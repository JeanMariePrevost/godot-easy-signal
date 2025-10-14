## Holds a reference to a callable registered to a BetterSignal
## Along with all of its metadata

extends RefCounted
class_name BetterSignalListener

var _callable: Callable
var _signal: BetterSignal
var _uses_left: int = -1  ## Auto-remove when it reaches 0, -1 for unlimited
var _priority: int = 0  ## Higher priority listeners are invoked before lower priority listeners

var _target_object: Object = null
var _target_method: String = ""


func _init(callable: Callable, owner_signal: BetterSignal):
    _callable = callable
    _signal = owner_signal

    # Extact object and method name from the callable
    _target_object = callable.get_object()
    _target_method = callable.get_method()
    if _target_method == "":
        _target_method = "[Lambda]"


## Invokes the callable with the given payload
##
## Internally decrements the uses_left if it is not unlimited
## Removes the listener from its signal when uses_left reaches 0
func emit_to(args: Array[Variant]) -> void:
    _callable.callv(args)
    if _uses_left != -1:
        _uses_left -= 1
        if _uses_left == 0:
            _signal.remove(_callable)


## Makes the listener unregister after the first use
## Alias for limited_to(1)
func once() -> BetterSignalListener:
    _uses_left = 1
    return self


## Sets the uses_left to the given value
func limited_to(uses_left: int) -> BetterSignalListener:
    _uses_left = uses_left
    return self


## Sets the priority of the listener
## Higher priority listeners are invoked before lower priority listeners
## Can be any int value, including negative numbers. Defaults to 0
func with_priority(priority: int) -> BetterSignalListener:
    _priority = priority
    _signal._sort_listeners_by_priority()
    return self


## Checks if the listener has the given callable
## Used to compare without exposing the callable
func has_callable(callable: Callable) -> bool:
    return _callable == callable


## Gets the priority of the listener
func get_priority() -> int:
    return _priority


## Gets the target object of the listener
## I.e. the object that owns the callback function
## Null if the callback is a native function or a lambda
func get_target_object() -> Object:
    return _target_object


## Gets the target method of the listener
## I.e. the method name of the callback function
## Empty string if the callback is a native function or a lambda
func get_target_method() -> String:
    return _target_method


## Gets the uses left of the listener before it removes itself on the next emit
func get_uses_left() -> int:
    return _uses_left


## Returns true if the callable or target object is null or has been freed
func is_orphaned() -> bool:
    return _callable == null or _target_object == null or not is_instance_valid(_target_object)
