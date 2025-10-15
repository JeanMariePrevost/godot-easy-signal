extends RefCounted
class_name EasySignal

# ===============================
# Factory methods
# ===============================


## Creates a new EasySignal with a payload signature defined by an array of type names or Variant.Type values.
##
## This only provides additional checks and debugging info at emit() and add() time
## You can get a small performance gain by using an untyped signal instead to skip the validation logic
##
## Example:
##
## ```
## var signal = EasySignal.new_typed("int", "MyCustomClass") # Results in an (int, MyCustomClass) signal
## var signal = EasySignal.new_typed(TYPE_INT, TYPE_FLOAT, TYPE_STRING) # Results in an (int, float, string) signal
## ```
static func new_typed(...payload_signature: Array[Variant]) -> EasySignal:
    # Validate that all arguments are either strings (type names) or integers (Variant.Type values)
    for arg in payload_signature:
        if not (arg is String or arg is int):
            push_error("Incorrect payload_signature value.Expect an array of int and/or String, got: " + str(payload_signature))
            return null
            
    return EasySignal.new(payload_signature)


## Creates a new EasySignal that does not process any payload.
## Applies no signature validation and simply drops any payload received
static func new_void() -> EasySignal:
    return EasySignal.new(TYPE_NIL)

## Creates a new EasySignal that does not accept any payload.
## Applies strict signature validation
static func new_void_strict() -> EasySignal:
    var new_signal = EasySignal.new(TYPE_NIL)
    new_signal._void_is_strict = true
    return new_signal

## Creates a new EasySignal that accepts any payload.
##
## Slightly more performant than a typed signal as it skips the validation logic
static func new_untyped() -> EasySignal:
    return EasySignal.new(["Variant"])


# ===============================
# Initialization
# ===============================

var warn_on_arguments_in_void_signals: bool = true

var _argument_types: Array[String]  ## The types of the arguments, where TYPE_OBJECT is also the basis for any custom type
var _argument_count: int = 0  ## The number of arguments
var _is_variant: bool = false  ## Whether the signal is a variant signal (accepts any arguments)
var _is_void: bool = false  ## Whether the signal is a void signal (accepts no arguments)
var _void_is_strict: bool = false  ## If false, void signals simply drop any payload received, and still emit. True will require that there be no payload at all

var _is_enabled: bool = true  ## Whether the signal will actually emit to subscribers

var _subscribers: Array[EasySignalSubscriber]


func get_argument_types() -> Array[String]:
    return _argument_types


func get_argument_count() -> int:
    return _argument_count


func get_is_variant() -> bool:
    return _is_variant


func get_is_void() -> bool:
    return _is_void


## Use the static factory methods instead of this constructor for a simpler interface
##
## Accepts:
## - A Variant.Type value (e.g. TYPE_INT)  for a single argument typed signal
## - A type name (e.g. "int" or "MyCustomClass") for a single argument typed signal
## - An array of Variant.Type values (e.g. [TYPE_INT, TYPE_FLOAT]) for a typed signal of that exact signature
## - An array of type names (e.g. ["String", "MySpecialType"]) for a typed signal of that exact signature
## - null, TYPE_NIL or [] for a void signal (accepts no arguments)
## - "Variant" for a variant signal (accepts any number of arguments of any type)
##
## Examples:
##
## ```
## var signal = EasySignal.new(TYPE_INT)                        #(int) signal
## var signal = EasySignal.new(["int", "float"])                #(int, float) signal
## var signal = EasySignal.new([TYPE_INT, TYPE_FLOAT])          #(int, float) signal
## var signal = EasySignal.new(["String", "MySpecialType"])     #(String, MySpecialType) signal
## var signal = EasySignal.new(null)                            #void signal (accepts no arguments)
## var signal = EasySignal.new([])                              #void signal (accepts no arguments)
## var signal = EasySignal.new(TYPE_NIL)                        #void signal (accepts no arguments)
## var signal = EasySignal.new("Variant")                       #variant signal (accepts any number of arguments of any type)
## ```
func _init(payload_signature: Variant = TYPE_NIL):
    # Normalize input
    if payload_signature == null or (payload_signature is int and payload_signature == TYPE_NIL):
        payload_signature = []
    elif payload_signature is int:
        payload_signature = [payload_signature]
    elif payload_signature is String:
        payload_signature = [payload_signature]
    elif payload_signature is not Array:
        # Meaning _not_ null, not an int, not a string, _and_ not an array
        push_error("Invalid payload signature: " + str(payload_signature) + ". Signal will be untyped.")
        payload_signature = ["Variant"]

    # Void signal special case
    if payload_signature is Array and payload_signature.is_empty():
        _argument_types = []
        _argument_count = 0
        _is_variant = false
        _is_void = true
        return

    # Variant signal special case
    if payload_signature.size() == 1 and payload_signature[0] is String and payload_signature[0] == "Variant":
        _argument_types = ["Variant"]
        _argument_count = 1
        _is_variant = true
        _is_void = false
        return

    # Typed signal
    _argument_types = []
    for element in payload_signature:
        if element is int and element > TYPE_NIL and element <= TYPE_MAX:
            _argument_types.append(type_string(element))
        elif element is String:
            _argument_types.append(element)
        else:
            push_error("Invalid type value: " + str(element) + ". Signal will be untyped.")
            _argument_types = ["Variant"]
            _argument_count = 1
            _is_variant = true
            _is_void = false
            return
    _argument_count = _argument_types.size()
    _is_variant = false
    _is_void = false
    return


# ===============================
# Core
# ===============================


## Adds a subscriber to the signal
## Adding the same callable more than once has no effect
func add(callback: Callable) -> EasySignalSubscriber:
    ###########################################################################################
    # LIMITATION NOTE: Currently it is not possible to neither fully validate a callable signature nor "dectect/handle" a failed call
    # This means that it _will_ error out and log to the console
    # But it will proceed with the other subscribers just fine (though it causes a breakpoint when in the editor, but you can "continue" from there)
    #
    # So...
    # TODO: Implement a way to detect and handle failed calls if there ever is a proper way to achieve this
    ###########################################################################################
    var subscriber: EasySignalSubscriber = find(callback)
    if subscriber != null:
        return subscriber

    var best_effort_validation: Dictionary = _weakly_validate_callback(callback)
    # print("Best effort validation: ", best_effort_validation)
    if not best_effort_validation["valid"]:
        push_error('Callback "' + callback.get_method() + '" could not be added. ' + best_effort_validation["reason"])
        return null

    subscriber = EasySignalSubscriber.new(callback, self)
    _subscribers.append(subscriber)
    return subscriber


## Emits the signal with the given payload
func emit(...args: Array[Variant]) -> void:
    if not _is_enabled:
        return

    # Validate payload
    if(_is_variant):
        # Nothing to do
        pass
    elif(_is_void and args.size() != 0):
        if(_void_is_strict):
            push_error("Arguments were provided to a strict void signal. Emission will not go through.")
            return
        elif(warn_on_arguments_in_void_signals):
            # Only warn in case the user wonders why their arguments are not being passed
            push_warning("You are passing arguments into a void signal, they will not be passed to subscribers. Use Untyped Signals if you wish for the arguments to go through.")
            args = []

    else:
        var validation_result: Dictionary = validate_payload(args)

        if not validation_result["valid"]:
            push_error("Payload could not be emitted. " + validation_result["reason"])
            return

    for subscriber in _subscribers.duplicate(): # Duplicate to work on a snapshot of the subscribers and avoid modifying the array while iterating
        subscriber.emit_to(args)


## Emits after a number of process_frames
## Applies to the entire signal, on top of any individual subscriber's delay that might be set
func emit_after_frames(delay_amount: int, ...args: Array[Variant]) -> void:
    if not _is_enabled:
        return

    var tree: SceneTree = Engine.get_main_loop() as SceneTree
    if tree:
        var _hack_to_keep_this_context_alive_yes_this_is_currently_required = self  # Without this, the context is garbage collected and the delay logic fails. We need a reference to keep it alive. It's a known issue: https://github.com/godotengine/godot/issues/81210
        for _i in delay_amount:
            await tree.process_frame
        emit.callv(args) # Using callv to about "double boxing" the arguments
    else:
        push_error("EasySignal.emit_after_frames: Failed to get main loop")
        return


## Emits after a number of physics_frames
## Applies to the entire signal, on top of any individual subscriber's delay that might be set
func emit_after_physics_frames(delay_amount: int, ...args: Array[Variant]) -> void:
    if not _is_enabled:
        return

    var tree: SceneTree = Engine.get_main_loop() as SceneTree
    if tree:
        var _hack_to_keep_this_context_alive_yes_this_is_currently_required = self  # Without this, the context is garbage collected and the delay logic fails. We need a reference to keep it alive. It's a known issue: https://github.com/godotengine/godot/issues/81210
        for _i in delay_amount:
            await tree.physics_frame
        emit.callv(args) # Using callv to about "double boxing" the arguments
    else:
        push_error("EasySignal.emit_after_physics_frames: Failed to get main loop")
        return


## Emits after a number of milliseconds
## Applies to the entire signal, on top of any individual subscriber's delay that might be set
func emit_after_ms(delay_amount: int, ...args: Array[Variant]) -> void:
    if not _is_enabled:
        return

    var tree: SceneTree = Engine.get_main_loop() as SceneTree
    if tree:
        var _hack_to_keep_this_context_alive_yes_this_is_currently_required = self  # Without this, the context is garbage collected and the delay logic fails. We need a reference to keep it alive. It's a known issue: https://github.com/godotengine/godot/issues/81210
        await tree.create_timer(delay_amount / 1000.0).timeout
        emit.callv(args) # Using callv to about "double boxing" the arguments
    else:
        push_error("EasySignal.emit_after_ms: Failed to get main loop")
        return


## Removes a subscriber from the signal, by its callable
## Returns true if a subscriber was removed, false otherwise
##
## Note: This also "disposes" the subscriber, preventing it from completing delayed invocations
func remove(callback: Callable) -> bool:
    for subscriber in _subscribers:
        if subscriber.has_callable(callback):
            _subscribers.erase(subscriber)
            subscriber.dispose()
            return true
    return false


## Removes all subscribers from the signal
func remove_all() -> void:
    _subscribers.clear()


## Purges all orphaned subscribers from the signal
##
## Orphaned subscribers are subscribers that have a target object that is null or has been freed, or whose target method is no longer valid
func purge_orphaned_subscribers() -> void:
    for subscriber in _subscribers:
        if subscriber.is_orphaned():
            _subscribers.erase(subscriber)
            subscriber.dispose()
    return


## Makes the signal no longer emit to its subscribers until re-enabled
##
## Notes: 
## - Prevents emit() from going through
## - Prevents emit_after_x() from queueing new emissions
## - Prevents emit_after_x() that run out from going through
## - Does _not_ stop already queued emissions from going through if the signal is re-enabled when they run out
## - Subscribers that have already been queued will still go through regardless of the signal's state
func disable() -> void:
    _is_enabled = false


## Makes the signal emit to its subscribers again if it was disabled
func enable() -> void:
    _is_enabled = true


## Returns whether the signal is enabled, meaning it will emit to its subscribers
## True by default
func is_enabled() -> bool:
    return _is_enabled




# ===============================
# Godot's built-in signal integration
# ===============================

## Collection that tracks the built-in Godot signals this EasySignal is linked to
var _godot_builtin_signals_links: Array[Dictionary] = []

## Makes this signal trigger from a given signal's emissions
func link_to_godot_signal(godot_signal: Signal) -> void:
    var source: Object = godot_signal.get_object()
    var signal_name: String = godot_signal.get_name()
    link_to_godot_signal_by_name(source, signal_name)


## Makes this signal trigger from a given signal's emissions
func link_to_godot_signal_by_name(source: Object, signal_name: String) -> void:
    if source == null or signal_name == "":
        push_error("Invalid source or signal name: " + str(source) + " " + str(signal_name))
        return
    if source.is_connected(signal_name, emit):
        push_warning("Signal is already linked to: " + str(source) + " " + str(signal_name))
        return
    _godot_builtin_signals_links.append({"source": source, "signal_name": signal_name})
    source.connect(signal_name, emit)



## Disconnects this EasySignal from a linked Godot signal
## Returns true if the signal was disconnected, false if it was not connected in the first place
func disconnect_from_godot_signal(godot_signal: Signal) -> bool:
    var source: Object = godot_signal.get_object()
    var signal_name: String = godot_signal.get_name()
    return disconnect_from_godot_signal_by_name(source, signal_name)

## Disconnects this EasySignal from a linked Godot signal
## Returns true if the signal was disconnected, false if it was not connected in the first place
func disconnect_from_godot_signal_by_name(source: Object, signal_name: String) -> bool:
    for link in _godot_builtin_signals_links:
        if link.has("source") and link.has("signal_name") and link["source"] == source and link["signal_name"] == signal_name:
            _godot_builtin_signals_links.erase(link)

    if not source.is_connected(signal_name, emit):
        return false
    source.disconnect(signal_name, emit)
    return true


## Disconnects this EasySignal from all linked Godot signals
func disconnect_from_all_godot_signals() -> void:
    for link in _godot_builtin_signals_links:
        if link.has("source") and link["source"] != null and link.has("signal_name") and link["source"].is_connected(link["signal_name"], emit):
            link["source"].disconnect(link["signal_name"], emit)
    _godot_builtin_signals_links.clear()


# ===============================
# Utility
# ===============================


## Checks if the callable is already registered to the signal
func has(callback: Callable) -> bool:
    for subscriber in _subscribers:
        if subscriber.has_callable(callback):
            return true
    return false


## Finds a subscriber by its callable
## Returns the subscriber if found, null otherwise
func find(callback: Callable) -> EasySignalSubscriber:
    for subscriber in _subscribers:
        if subscriber.has_callable(callback):
            return subscriber
    return null


## Does a best-effort validation of the callback signature
## Returns true if it appears to match expected signature; false otherwise
##
## NOTE: Does NOT guarante 100% compatibility as of yet due to very limited introspection capabilities, notably with lambdas
##
## Returns a dictionary with the following keys:
## - "valid": true if the callback is valid, false otherwise
## - "reason": a string explaining why the callback is valid or invalid
func _weakly_validate_callback(callback: Callable) -> Dictionary:
    # Validate non-null and valid
    if callback == null:
        return {"valid": false, "reason": "Callback is null"}

    if not callback.is_valid():
        return {"valid": false, "reason": "callback.is_valid() returned false"}

    # Attempt to validate argument types (works for named functions only I believe?)
    var target_object = callback.get_object()
    var target_method = callback.get_method()

    # Skip if the callable is a lambda (these aren't introspectable)
    if target_object == null or target_method == "":
        # Can't truly inspect, rely only on the argument count
        if callback.get_argument_count() != _argument_count:
            return {"valid": false, "reason": "Argument count mismatch (requires " + str(_argument_count) + ", has " + str(callback.get_argument_count()) + ")"}
        return {"valid": true, "reason": "Callable is a lambda (not introspectable)"}

    var script: Script = target_object.get_script()
    if script == null:
        # Built-in / unnamed methods only present argument count
        if callback.get_argument_count() != _argument_count:
            return {"valid": false, "reason": "Argument count mismatch (requires " + str(_argument_count) + ", has " + str(callback.get_argument_count()) + ")"}
        return {"valid": true, "reason": "Callable is a built-in / unnamed method with the expected argument count"}

    var methods: Array[Dictionary] = script.get_script_method_list()
    for m in methods:
        if m.name == target_method:
            # Special case, check if the method is variadic
            if m.flags & METHOD_FLAG_VARARG != 0:
                return {"valid": true, "reason": "Callable is a variadic method and will accept anything"}
            
            # We have a declared method definition with argument metadata
            var args_meta: Array[Dictionary] = m.args
            if args_meta.size() != _argument_count:
                return {"valid": false, "reason": "Argument count mismatch (requires " + str(_argument_count) + ", has " + str(args_meta.size()) + ")"}
            for i in range(_argument_count):
                var expected_type: String = _argument_types[i]
                var declared_type: String = type_string(args_meta[i].type)
                # If both sides have explicit types, compare them
                # NOTE: A "Nil" type argument is an "untyped Variant", not "void"
                if declared_type not in ["Nil", "Variant"] and expected_type not in ["Nil", "Variant"] and declared_type != expected_type:
                    return {"valid": false, "reason": "Argument type mismatch (requires " + expected_type + ", exposes " + declared_type + ")"}
            return {"valid": true, "reason": "Callable is a valid method with the expected signature (introspectable)"}

    # If the method wasn't found in the script, assume it's external or native
    return {"valid": true, "reason": "Callable is external or native (not introspectable)"}


## Validates the payload against the signal's signature
## Returns a dictionary with the following keys:
## - "valid": true if the payload is valid, false otherwise
## - "reason": a string explaining why the payload is valid or invalid
func validate_payload(payload: Array[Variant]) -> Dictionary:
    # Check argument count
    if payload.size() != _argument_count:
        return {"valid": false, "reason": "Argument count mismatch (requires " + str(_argument_count) + ", has " + str(payload.size()) + ")"}

    # Check argument types
    for i in range(_argument_count):
        var expected_type: String = _argument_types[i]
        var declared_type: String = type_string(typeof(payload[i]))
        if declared_type not in ["Nil", "Variant"] and expected_type not in ["Nil", "Variant"] and declared_type != expected_type:
            return {"valid": false, "reason": "Argument type mismatch (requires " + expected_type + ", exposes " + declared_type + ")"}

    return {"valid": true, "reason": "Payload is valid"}


## Called by subscribers when their priority is changed
func _sort_subscribers_by_priority() -> void:
    _subscribers.sort_custom(func(a: EasySignalSubscriber, b: EasySignalSubscriber): return a.get_priority() > b.get_priority())


## Prints a detailed and formatted summary of the signal's internal state.
func debug_pretty_print_state() -> void:
    var signal_type: String
    var signature: String = ""
    
    # Determine type & signature
    if _is_void:
        signal_type = "void"
        signature = "()"
    elif _is_variant:
        signal_type = "variant"
        signature = "(...)"
    else:
        signal_type = "typed"
        if _argument_count > 0:
            signature = "(" + ", ".join(_argument_types) + ")"
        else:
            signature = "()"
    
    # Header
    print("\n──────────────────────────────────────────────")
    print(" EasySignal Debug Summary")
    print("──────────────────────────────────────────────")
    print("Payload: " + signal_type + " " + signature)
    print("Subscribers: " + str(_subscribers))
    print("")
    
    # Subscribers section
    var count := _subscribers.size()
    if count == 0:
        print("Subscribers: none")
    else:
        print("Subscribers (" + str(count) + "):")
        for i in range(count):
            var l = _subscribers[i]
            if l.get_target_object() == null:
                print("  • #" + str(i) + " | [INVALID -> target object is null]")
                continue
            if l.get_target_object() != null and l.get_target_object().is_instance_valid():
                print("  • #" + str(i) + " | [INVALID -> target object is no longer in memory]")
                continue
            print("  • #" + str(i) + " | priority=" + str(l.get_priority()) + " | uses_left=" + str(l.get_uses_left()) + " | " + l.get_target_object().get_script().get_path() + " -> " + l.get_target_method() + "()")
    
    # Footer
    print("──────────────────────────────────────────────\n")
