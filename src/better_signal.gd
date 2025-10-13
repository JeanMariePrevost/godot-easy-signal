extends RefCounted
class_name BetterSignal

# ===============================
# Factory methods
# ===============================


## Creates a new BetterSignal with a payload signature defined by an array of type names.
##
## This only provides additional checks and debugging info at emit() and add() time
## YOu can get a micro-performance gain by using a "variant" signal instead to skip the type checks
##
## Example:
##
## ```
## var signal = BetterSignal.new_typed(["int", "float", "String"]) # Results in an (int, float, string) signal
## ```
static func new_typed(payload_signature: Array[String]) -> BetterSignal:
    return BetterSignal.new(payload_signature)


## Creates a new BetterSignal that does not accept any payload.
static func new_void() -> BetterSignal:
    return BetterSignal.new(TYPE_NIL)


## Creates a new BetterSignal that accepts any payload.
static func new_untyped() -> BetterSignal:
    return BetterSignal.new(["Variant"])


# ===============================
# Initialization
# ===============================

var _argument_types: Array[String]  ## The types of the arguments, where TYPE_OBJECT is also the basis for any custom type
var _argument_count: int = 0  ## The number of arguments
var _is_variant: bool = false  ## Whether the signal is a variant signal (accepts any arguments)
var _is_void: bool = false  ## Whether the signal is a void signal (accepts no arguments)

var _listeners: Array[BetterSignalListener] = []


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


## Adds a listener to the signal
## Adding the same callable more than once has no effect
func add(callback: Callable) -> BetterSignalListener:
    var listener: BetterSignalListener = find(callback)
    if listener != null:
        return listener
    listener = BetterSignalListener.new(callback, self)
    _listeners.append(listener)
    return listener


## Emits the signal with the given payload
func emit(payload: Variant) -> void:
    # TODO: Implement priority (needs constant sorting? On changes? We need to detect changes in the listeners? They report back?..)
    for listener in _listeners:
        listener.emit_to(payload)


## Removes a listener from the signal, by its callable
## Returns true if a listener was removed, false otherwise
func remove(callback: Callable) -> bool:
    for listener in _listeners:
        if listener.has_callable(callback):
            _listeners.erase(listener)
            return true
    return false


## Removes all listeners from the signal
func remove_all() -> void:
    _listeners.clear()


# ===============================
# Utility
# ===============================


## Checks if the callable is already registered to the signal
func has(callback: Callable) -> bool:
    for listener in _listeners:
        if listener.has_callable(callback):
            return true
    return false


## Finds a listener by its callable
## Returns the listener if found, null otherwise
func find(callback: Callable) -> BetterSignalListener:
    for listener in _listeners:
        if listener.has_callable(callback):
            return listener
    return null
