# EasySignal - A code-first alternative to Godot’s signal system

[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE) [![Godot 4.5+](https://img.shields.io/badge/Godot-4.5%2B-blue.svg)](https://godotengine.org/) [![Language: GDScript](https://img.shields.io/badge/Language-GDScript-orange.svg)](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/index.html)


**EasySignal** is a quality-of-life-oriented GDScript alternative to Godot’s built-in signal system for working "in code" only.

It provides a cleaner and feature-rich API for implementing the Observer pattern in GDScript, focusing on offering flexibility, readability, and convenience rather than raw performance or editor integration.


## Basic Example

It uses a simple syntax to essentially implement the Observer pattern:

```gdscript
# Define a signal
var enemy_died: EasySignal = EasySignal.new_typed("EnemyClass", "int")

# Add your listeners / callbacks
enemy_died.add(on_self_died)
...
enemy_died.add(on_killed_enemy)

# Emit the signal
# Here, we are passing an enemy and an arbitrary value, like exp gained
enemy_died.emit(some_enemy_object, 100)

# At this point, the callback functions have been invoked, just as if you had called:
#     on_self_died(some_enemy_object, 100)
#     on_killed_enemy(some_enemy_object, 100)
```


## Features

### Various Helper Functions and QoL Options

```gdscript
player_took_damage.add(on_first_hit).once()                # Triggers only once then unsubscribes
player_took_damage.add(count_hits).limited_to(100)         # Triggers up to 100 times then unsubscribes   
player_took_damage.add(play_hurt_sfx).with_delay_ms(150)   # Called 150ms after the fact
player_took_damage.add(apply_red_tint).with_priority(-1)   # Called on the same frame, but after other subscribers of higher priority
```

### Fluent-Style API

```gdscript
thing_happened.add(handler_function).once().with_delay_frames(2).with_priority(5) 
```

### Optional Runtime Type Validation
For a slight performance cost, emissions and added subscribers can have their arguments / signatures validated.

```gdscript
    # Void signals (drop arguments)
    var my_void_signal = EasySignal.new_void()
    my_void_signal.emit()
    my_void_signal.emit("these", "arguments", "will", "be", "dropped")
 
    # Strict void signals (do not accept arguments)
    var my_strict_void_signal = EasySignal.new_void_strict()
    my_strict_void_signal.emit() # This will work
    my_strict_void_signal.emit("this shouldn't be here") # This will not go through

    # Typed signals, accepts only this signature
    var my_typed_signal = EasySignal.new_typed("float")
    my_typed_signal.emit(1.0)

    # Typed signals accept multiple arguments and also custom classes
    var my_multi_typed_signal = EasySignal.new_typed("float", "String", "MyCustomWeaponClass")
    my_multi_typed_signal.emit(1.0, "some message", player_weapon)

    # Untyped signals apply no validation logic
    var my_untyped_signal = EasySignal.new_untyped()
    my_untyped_signal.emit()
    my_untyped_signal.emit(1.0)
    my_untyped_signal.emit("All", "of", "these", ["things", "will", "work"])
```

### Graceful Handling of Broken References and Freed Objects
Missing and broken references and callbacks on freed nodes will simply be silently skipped and can be purged automatically.

```gdscript
    var area_entered = EasySignal.new_typed("Area2D")
    area_entered.add(handle_area_entered)
    area_entered.add(troublesome_node.on_enter_zone)

    troublesome_node.free() # Second callback now points to a function on a freed node

    area_entered.emit()

    # Result:
    #     handle_area_entered is called
    #     troublesome_node.on_enter_zone is skipped


    # We can also remove all orphaned subscribers from the signal
    area_entered.purge_orphaned_subscribers()

    # At this point only the first callback is left on the signal
```

### Optionnal Priority-Based Dispatching
Order is defined by order of subscription, unless a priority is defined per listener. Useful for orchestrating time-coupled logic.

```gdscript
ship_landed.add(thing_that_is_very_low_priority).with_priority(-5)
ship_landed.add(thing_to_do_first).with_priority(1)
ship_landed.add(thing_do_do_after).with_priority(0)

ship_landed.emit()

# Order of execution:
# 1. thing_to_do_first (priority 1 > 0 > -5)
# 2. thing_do_do_after (priority 0 > -5)
# 3. thing_that_is_very_low_priority
```


## Performance Considerations

EasySignal runs entirely in GDScript, with a few levels of indirection, priority sorting, and optional runtime validation. Sadly, this makes it **measurably slower than Godot’s built-in C++ signal system**.

| Test (100 000 emissions) | Time | Relative |
|---------------------------|-------|-----------|
| Direct method call | ~61 ms | 1× |
| Built-in Godot signal | ~78 ms | 1.3× |
| EasySignal (void or untyped) | ~140 ms | 2.3× |
| EasySignal (full validation) | ~268 ms | 4.4× |

This difference only becomes relevant at very high volumes (e.g. tens of thousands of emits per frame), but this still means that it is not the right tool for every job.


## Tests

A suite of tests is included, built on top of a lightweight custom test runner.  
You can run it in CLI with:

```powershell
godot4 --headless -s res://test_runner/test_runner_tree.gd
```

Where godot4 is your variable or the path to a Godot 4.5+ binary.
For example, you can set up an alias or environment variable, or run it directly with something like:

```powershell
& "D:\Path_to_Godot_Binaries\Godot_v4.5-stable_mono_win64\Godot_v4.5-stable_mono_win64.exe" --headless -s res://test_runner/test_runner_tree.gd
```


---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Author

Jean-Marie Prévost

https://github.com/JeanMariePrevost