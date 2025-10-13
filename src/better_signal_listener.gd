## Holds a reference to a callable registered to a BetterSignal
## Along with all of its metadata

extends RefCounted
class_name BetterSignalListener

var _callable: Callable
var _signal: BetterSignal
var _uses_left: int = -1  ## Auto-remove when it reaches 0, -1 for unlimited


func _init(callable: Callable, owner_signal: BetterSignal):
    _callable = callable
    _signal = owner_signal


## Passes the payload to the callable
##
## Internally decrements the uses_left if it is not unlimited
## Removes the listener from the signal and frees it when the uses_left reaches 0
func invoke_callable(payload: Variant) -> void:
    _callable.call(payload)
    if _uses_left != -1:
        _uses_left -= 1
        if _uses_left == 0:
            _signal.remove(self)
            self.free()


## Checks if the listener has the given callable
## Used to compare without exposing the callable
func has_callable(callable: Callable) -> bool:
    return _callable == callable
