## Holds a reference to a callable registered to a BetterSignal
## Along with all of its metadata
##
## Essentially an entry in a signal's subscriber list

extends RefCounted
class_name BetterSignalSubscriber

var _callable: Callable  ## The callback function
var _target_object: Object = null  ## The object that owns the callback function, null if the callback is a native function or a lambda
var _target_method: String = ""  ## The method name of the callback function, empty string if the callback is a native function or a lambda
var _signal: WeakRef  ## WeakRef to a BetterSignal, needed to break the ref cycle between signal and subscriber

var _uses_left: int = -1  ## Countdown to auto-removal of this subscriber upon reaching 0, -1 for unlimited
var _priority: int = 0  ## Priority of this subscriber, higher priority subscribers are invoked before lower priority subscribers

var emit_delay_amount: int = 0  ## Delay in frames or milliseconds before the subscriber is invoked
var emit_delay_type: String = "frames"  ## The type of delay: "process_frame", "physics_frame" or "ms"


func _init(callable: Callable, owner_signal: BetterSignal):
    _callable = callable
    _signal = weakref(owner_signal)

    # Extact object and method name from the callable
    _target_object = callable.get_object()
    _target_method = callable.get_method()
    if _target_method == "":
        _target_method = "[Lambda]"


## Invokes the callable with the given payload
##
## Will also remove the subscriber from its signal if its uses_left run out
func emit_to(args: Array[Variant]) -> void:
    # Ensure callable exists
    if _callable.is_null():
        if _signal.get_ref() != null:
            _signal.get_ref().remove(self)
        return

    # Optional delay logic
    if emit_delay_amount > 0:
        var tree: SceneTree = Engine.get_main_loop() as SceneTree
        if tree:
            var _hack_to_keep_this_context_alive_yes_this_is_currently_required = self  # Without this, the context is garbage collected and the delay logic fails. We need a reference to keep it alive. It's a known issue: https://github.com/godotengine/godot/issues/81210
            match emit_delay_type:
                "process_frame":
                    for i in emit_delay_amount:
                        await tree.process_frame
                "physics_frame":
                    for i in emit_delay_amount:
                        await tree.physics_frame
                "ms":
                    await tree.create_timer(emit_delay_amount / 1000.0).timeout

    # Apply _uses_left logic
    if _uses_left > 0:
        _uses_left -= 1
    elif _uses_left == 0:
        return  # Already ran out,, shouldn't have been emitting (caused by delays?)

    # Invoke the callable
    # Ensure callable still exists after the delay
    if _callable.is_null():
        if _signal.get_ref() != null:
            _signal.get_ref().remove(self)
        return
    _callable.callv(args)

    # Remove if ran out
    if _uses_left == 0:
        if _signal.get_ref() != null:
            _signal.get_ref().remove(self)  # TODO: Should this be safer? Deferred? Is it fine to remove from signal right _before_ invoking the callable?


## Makes the subscriber unregister after the first use
## Alias for limited_to(1)
func once() -> BetterSignalSubscriber:
    _uses_left = 1
    return self


## Sets the uses_left to the given value
func limited_to(uses_left: int) -> BetterSignalSubscriber:
    _uses_left = uses_left
    return self


## Sets the priority of the subscriber
## Higher priority subscribers are invoked before lower priority subscribers
## Can be any int value, including negative numbers. Defaults to 0
func with_priority(priority: int) -> BetterSignalSubscriber:
    _priority = priority
    var owner_signal = _signal.get_ref()
    if owner_signal != null:
        owner_signal._sort_subscribers_by_priority()
    return self


## Sets a delay for the subscriber's emission handling, in process_frames
func with_delay_frames(delay_amount: int) -> BetterSignalSubscriber:
    emit_delay_amount = delay_amount
    emit_delay_type = "process_frame"
    return self


## Sets a delay for the subscriber's emission handling, in physics_frames
func with_delay_physics_frames(delay_amount: int) -> BetterSignalSubscriber:
    emit_delay_amount = delay_amount
    emit_delay_type = "physics_frame"
    return self


## Sets a delay for the subscriber's emission handling, in milliseconds
##
## Note that priority cannot be guaranteed to be respected when using this delay type
func with_delay_ms(delay_amount: int) -> BetterSignalSubscriber:
    emit_delay_amount = delay_amount
    emit_delay_type = "ms"
    return self


## Checks if the subscriber has the given callable
## Used to compare without exposing the callable
func has_callable(callable: Callable) -> bool:
    return _callable == callable


## Gets the priority of the subscriber
func get_priority() -> int:
    return _priority


## Gets the target object of the subscriber
## I.e. the object that owns the callback function
## Null if the callback is a native function or a lambda
func get_target_object() -> Object:
    return _target_object


## Gets the target method of the subscriber
## I.e. the method name of the callback function
## Empty string if the callback is a native function or a lambda
func get_target_method() -> String:
    return _target_method


## Gets the uses left of the subscriber before it removes itself on the next emit
func get_uses_left() -> int:
    return _uses_left


## Returns true if the callable or target object is null or has been freed
func is_orphaned() -> bool:
    return _callable.is_null() or _target_object == null or not is_instance_valid(_target_object) or _signal.get_ref() == null


## Safely cleans up and removes this subscriber from its signal
## After calling this, the subscriber should be considered dead and not used further
## Returns true if cleanup was successful, false if there were issues
func dispose() -> void:
    var owner_signal = _signal.get_ref() if _signal else null
    if owner_signal != null:
        owner_signal._subscribers.erase(self)

    # "Nullify" the callable (prevents accidental invocation)
    _callable = Callable()  # This is how you do it for Callablesm they cannot be null proper

    # Null references
    _signal = weakref(null)  # WeakRef to null, cannot be null proper
    _target_object = null
