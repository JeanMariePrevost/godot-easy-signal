# BetterSignal

**BetterSignal** is a high-level, quality-of-life–oriented alternative to Godot’s built-in signal system.  
It provides a cleaner and feature-rich API for implementing the Observer pattern in GDScript.

The focus is on having a better, simpler development experience: flexibility, readability, and convenience rather than performance or editor integration.

---

## Basic Example

```gdscript
# Define a signal
var enemy_died: BetterSignal = BetterSignal.new("EnemyClass", "int")

# Add your listeners / callbacks
enemy_died.add(on_self_died)
...
enemy_died.add(on_killed_enemy)

# Emit the signal, here passing an enemy and an arbitrary value, like exp gain
enemy_died.emit(some_enemy_object, 100)

# At this point, the callbacks function have been invoked, just as if you had called:
#     on_self_died(some_enemy_object, 100)
#     on_killed_enemy(some_enemy_object, 100)
````


## Features

- **Fluent listener API**
e.g.  `player_took_damage.add(play_hurt_sfx).once().with_priority(10)`
- **Optional runtime type validation**
(void, untyped and typed signals available)
- **Auto-disconnects**
Listeners can subscribe to a prdefined number of emissions ahead of time, e.g.
`thing_happened.add(my_callback).once()` to listen only once.
`thing_happened.add(my_callback).limited_to(5)` to lisen up to 5 times before unsubscribing.
- **Priority-based listener ordering**
Order is defined by order of subscription, unless a priority is defined per listener. Useful for orchestrating time-coupled logic.



## Performance Considerations

BetterSignal runs entirely in GDScript, with a few levels of indirection, priority sorting, and optional runtime validation. Sadly, this makes it **measurably slower than Godot’s built-in C++ signal system**.

| Test (100 000 emissions) | Time | Relative |
|---------------------------|-------|-----------|
| Direct method call | ~61 ms | 1× |
| Built-in Godot signal | ~78 ms | 1.3× |
| BetterSignal (void or untyped) | ~140 ms | 2.3× |
| BetterSignal (full validation) | ~268 ms | 4.4× |

This difference only becomes relevant at pretty massive volumes (e.g. tens of thousands of emits per frame), but this means that this is not the right tool for performance-intensive tasks.

---

## 📄 License

[MIT License](LICENSE) — feel free to use, modify, and redistribute.
