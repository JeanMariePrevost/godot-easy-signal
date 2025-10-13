## Holds a reference to a callable registered to a BetterSignal
## Along with all of its metadata

extends RefCounted
class_name BetterSignalListener

var _callable: Callable
var _signal: BetterSignal
var _uses_left: int = -1  ## Auto-remove when it reaches 0, -1 for unlimited
var _priority: int = 0  ## Higher priority listeners are invoked before lower priority listeners


func _init(callable: Callable, owner_signal: BetterSignal):
    _callable = callable
    _signal = owner_signal


## Invokes the callable with the given payload
##
## Internally decrements the uses_left if it is not unlimited
## Removes the listener from its signal when uses_left reaches 0
func emit_to(payload: Variant) -> void:
    _callable.call(payload)
    if _uses_left != -1:
        _uses_left -= 1
        if _uses_left == 0:
            _signal.remove(_callable)


## Makes the listener unregister after the first use
## Alias for limited_to(1)
func once() -> void:
    _uses_left = 1


## Sets the uses_left to the given value
func limited_to(uses_left: int) -> void:
    _uses_left = uses_left


## Sets the priority of the listener
## Higher priority listeners are invoked before lower priority listeners
## Can be any int value, including negative numbers. Defaults to 0
func with_priority(priority: int) -> void:
    _priority = priority


## Checks if the listener has the given callable
## Used to compare without exposing the callable
func has_callable(callable: Callable) -> bool:
    return _callable == callable
