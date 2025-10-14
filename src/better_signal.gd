extends RefCounted
class_name BetterSignal

# ===============================
# Factory methods
# ===============================


## Creates a new BetterSignal with a payload signature defined by an array of type names or Variant.Type values.
##
## This only provides additional checks and debugging info at emit() and add() time
## You can get a small performance gain by using an untyped signal instead to skip the validation logic
##
## Example:
##
## ```
## var signal = BetterSignal.new_typed("int", "MyCustomClass") # Results in an (int, MyCustomClass) signal
## var signal = BetterSignal.new_typed(TYPE_INT, TYPE_FLOAT, TYPE_STRING) # Results in an (int, float, string) signal
## ```
static func new_typed(...payload_signature: Array[Variant]) -> BetterSignal:
    # Validate that all arguments are either strings (type names) or integers (Variant.Type values)
    for arg in payload_signature:
        if not (arg is String or arg is int):
            push_error("Incorrect payload_signature value.Expect an array of int and/or String, got: " + str(payload_signature))
            return null
            
    return BetterSignal.new(payload_signature)


## Creates a new BetterSignal that does not accept any payload.
static func new_void() -> BetterSignal:
    return BetterSignal.new(TYPE_NIL)


## Creates a new BetterSignal that accepts any payload.
##
## Slightly more performant than a typed signal as it skips the validation logic
static func new_untyped() -> BetterSignal:
    return BetterSignal.new(["Variant"])


# ===============================
# Initialization
# ===============================

var _argument_types: Array[String]  ## The types of the arguments, where TYPE_OBJECT is also the basis for any custom type
var _argument_count: int = 0  ## The number of arguments
var _is_variant: bool = false  ## Whether the signal is a variant signal (accepts any arguments)
var _is_void: bool = false  ## Whether the signal is a void signal (accepts no arguments)

var _subscribers: Array[BetterSignalSubscriber]


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
## var signal = BetterSignal.new(TYPE_INT)                        #(int) signal
## var signal = BetterSignal.new(["int", "float"])                #(int, float) signal
## var signal = BetterSignal.new([TYPE_INT, TYPE_FLOAT])          #(int, float) signal
## var signal = BetterSignal.new(["String", "MySpecialType"])     #(String, MySpecialType) signal
## var signal = BetterSignal.new(null)                            #void signal (accepts no arguments)
## var signal = BetterSignal.new([])                              #void signal (accepts no arguments)
## var signal = BetterSignal.new(TYPE_NIL)                        #void signal (accepts no arguments)
## var signal = BetterSignal.new("Variant")                       #variant signal (accepts any number of arguments of any type)
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
func add(callback: Callable) -> BetterSignalSubscriber:
    ###########################################################################################
    # LIMITATION NOTE: Currently it is not possible to neither fully validate a callable signature nor "dectect/handle" a failed call
    # This means that it _will_ error out and log to the console
    # But it will proceed with the other subscribers just fine (though it causes a breakpoint when in the editor, but you can "continue" from there)
    #
    # So...
    # TODO: Implement a way to detect and handle failed calls if there ever is a proper way to achieve this
    ###########################################################################################
    var subscriber: BetterSignalSubscriber = find(callback)
    if subscriber != null:
        return subscriber

    var best_effort_validation: Dictionary = _weakly_validate_callback(callback)
    # print("Best effort validation: ", best_effort_validation)
    if not best_effort_validation["valid"]:
        push_error('Callback "' + callback.get_method() + '" could not be added. ' + best_effort_validation["reason"])
        return null

    subscriber = BetterSignalSubscriber.new(callback, self)
    _subscribers.append(subscriber)
    return subscriber


## Emits the signal with the given payload
func emit(...args: Array[Variant]) -> void:
    # TODO: Implement priority (needs constant sorting? On changes? We need to detect changes in the subscribers? They report back?..)

    # Validate payload
    if(_is_variant):
        # Nothing to do
        pass
    elif(_is_void):
        if(args.size() != 0):
            push_error("Payload could not be emitted. Void signal does not accept any arguments")
            return
    else:
        var validation_result: Dictionary = validate_payload(args)

        if not validation_result["valid"]:
            push_error("Payload could not be emitted. " + validation_result["reason"])
            return

    for subscriber in _subscribers:
        subscriber.emit_to(args)


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
func find(callback: Callable) -> BetterSignalSubscriber:
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
        return {"valid": false, "reason": "Callback is not valid"}

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
        # Built-in methods can't be verified this way
        return {"valid": true, "reason": "Callable is a built-in method (not introspectable)"}

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
    _subscribers.sort_custom(func(a: BetterSignalSubscriber, b: BetterSignalSubscriber): return a.get_priority() > b.get_priority())


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
    print(" BetterSignal Debug Summary")
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
