extends TestFile

## NOTE: Mostly AI-generated and unverified

# ===============================
# Initialization Tests
# ===============================


func test_new_typed_single_type() -> TestResult:
    var test_signal = BetterSignal.new_typed("int")

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int"]:
        return fail_test("Expected argument types to be ['int'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_new_typed_multiple_types() -> TestResult:
    var test_signal = BetterSignal.new_typed("int", "float", "String")

    if test_signal.get_argument_count() != 3:
        return fail_test("Expected argument count to be 3, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int", "float", "String"]:
        return fail_test("Expected argument types to be ['int', 'float', 'String'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_new_typed_bad_input_returns_null() -> TestResult:
    var test_signal = BetterSignal.new_typed([["int", "float", "String"]])

    if test_signal == null:
        return pass_test()
    else:
        return fail_test("Expected signal to be null")


func test_new_void() -> TestResult:
    var test_signal = BetterSignal.new_void()

    if test_signal.get_argument_count() != 0:
        return fail_test("Expected argument count to be 0, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != []:
        return fail_test("Expected argument types to be [], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if not test_signal.get_is_void():
        return fail_test("Expected signal to be void")

    return pass_test()


func test_new_untyped() -> TestResult:
    var test_signal = BetterSignal.new_untyped()

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_single_type_int() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int"]:
        return fail_test("Expected argument types to be ['int'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_single_type_float() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_FLOAT)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["float"]:
        return fail_test("Expected argument types to be ['float'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_single_type_string() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_STRING)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["String"]:
        return fail_test("Expected argument types to be ['String'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_of_types() -> TestResult:
    var test_signal = BetterSignal.new([TYPE_INT, TYPE_FLOAT])

    if test_signal.get_argument_count() != 2:
        return fail_test("Expected argument count to be 2, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int", "float"]:
        return fail_test("Expected argument types to be ['int', 'float'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_of_types_mixed() -> TestResult:
    var test_signal = BetterSignal.new([TYPE_STRING, TYPE_BOOL, TYPE_VECTOR2])

    if test_signal.get_argument_count() != 3:
        return fail_test("Expected argument count to be 3, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["String", "bool", "Vector2"]:
        return fail_test("Expected argument types to be ['String', 'bool', 'Vector2'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_single_string_type() -> TestResult:
    var test_signal = BetterSignal.new("int")

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int"]:
        return fail_test("Expected argument types to be ['int'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_custom_class_name() -> TestResult:
    var test_signal = BetterSignal.new("MySpecialType")

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["MySpecialType"]:
        return fail_test("Expected argument types to be ['MySpecialType'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_of_string_types() -> TestResult:
    var test_signal = BetterSignal.new(["int", "float"])

    if test_signal.get_argument_count() != 2:
        return fail_test("Expected argument count to be 2, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int", "float"]:
        return fail_test("Expected argument types to be ['int', 'float'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_of_string_types_with_custom() -> TestResult:
    var test_signal = BetterSignal.new(["String", "MySpecialType"])

    if test_signal.get_argument_count() != 2:
        return fail_test("Expected argument count to be 2, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["String", "MySpecialType"]:
        return fail_test("Expected argument types to be ['String', 'MySpecialType'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_void_with_null() -> TestResult:
    var test_signal = BetterSignal.new(null)

    if test_signal.get_argument_count() != 0:
        return fail_test("Expected argument count to be 0, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != []:
        return fail_test("Expected argument types to be [], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if not test_signal.get_is_void():
        return fail_test("Expected signal to be void")

    return pass_test()


func test_init_void_with_type_nil() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_NIL)

    if test_signal.get_argument_count() != 0:
        return fail_test("Expected argument count to be 0, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != []:
        return fail_test("Expected argument types to be [], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if not test_signal.get_is_void():
        return fail_test("Expected signal to be void")

    return pass_test()


func test_init_void_with_empty_array() -> TestResult:
    var test_signal = BetterSignal.new([])

    if test_signal.get_argument_count() != 0:
        return fail_test("Expected argument count to be 0, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != []:
        return fail_test("Expected argument types to be [], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if not test_signal.get_is_void():
        return fail_test("Expected signal to be void")

    return pass_test()


func test_init_void_with_no_args() -> TestResult:
    var test_signal = BetterSignal.new()

    if test_signal.get_argument_count() != 0:
        return fail_test("Expected argument count to be 0, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != []:
        return fail_test("Expected argument types to be [], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if not test_signal.get_is_void():
        return fail_test("Expected signal to be void")

    return pass_test()


func test_init_variant_with_string() -> TestResult:
    var test_signal = BetterSignal.new("Variant")

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_variant_with_array() -> TestResult:
    var test_signal = BetterSignal.new(["Variant"])

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_mixed_type_and_string() -> TestResult:
    var test_signal = BetterSignal.new([TYPE_INT, "float", TYPE_STRING])

    if test_signal.get_argument_count() != 3:
        return fail_test("Expected argument count to be 3, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int", "float", "String"]:
        return fail_test("Expected argument types to be ['int', 'float', 'String'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_all_basic_types() -> TestResult:
    var test_signal = (
        BetterSignal
        . new(
            [
                TYPE_BOOL,
                TYPE_INT,
                TYPE_FLOAT,
                TYPE_STRING,
                TYPE_VECTOR2,
                TYPE_VECTOR3,
                TYPE_COLOR,
            ]
        )
    )

    var expected_types = ["bool", "int", "float", "String", "Vector2", "Vector3", "Color"]

    if test_signal.get_argument_count() != 7:
        return fail_test("Expected argument count to be 7, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != expected_types:
        return fail_test("Expected argument types to be " + str(expected_types) + ", got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_type_array() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_ARRAY)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Array"]:
        return fail_test("Expected argument types to be ['Array'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_type_dictionary() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_DICTIONARY)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Dictionary"]:
        return fail_test("Expected argument types to be ['Dictionary'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_type_object() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_OBJECT)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Object"]:
        return fail_test("Expected argument types to be ['Object'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


# ===============================
# Invalid initialization input tests (expected to default to variant)
# ===============================


func test_init_invalid_type_bool() -> TestResult:
    var test_signal = BetterSignal.new(true)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1 (variant defaults to 1), got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant (invalid input defaults to variant)")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_invalid_type_object() -> TestResult:
    var test_object = Object.new()
    var test_signal = BetterSignal.new(test_object)
    test_object.free()

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1 (variant defaults to 1), got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant (invalid input defaults to variant)")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_invalid_array_with_invalid_element() -> TestResult:
    var test_signal = BetterSignal.new([TYPE_INT, true, TYPE_FLOAT])  # Should default to untyped

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1 (variant defaults to 1), got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant (invalid element causes fallback to variant)")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_invalid_type_constant_out_of_range() -> TestResult:
    var test_signal = BetterSignal.new(-1)  # Should default to untyped

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1 (variant defaults to 1), got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant (invalid type constant defaults to variant)")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_with_null() -> TestResult:
    var test_signal = BetterSignal.new(["String", null, "int"])  # Should default to untyped
    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test('Expected argument types to be ["Variant"], got ' + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


# # ===============================
# # Basic operations
# # ===============================


func test_add_handler() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var callback: Callable = func(_payload): pass

    var listener = test_signal.add(callback)

    if listener == null:
        return fail_test("Expected add() to return a listener")
    if not test_signal.has(callback):
        return fail_test("Expected signal to have the callback after add()")

    return pass_test()


func test_add_same_handler_twice_returns_same_listener() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var callback := func(_payload): pass

    var listener1 = test_signal.add(callback)
    var listener2 = test_signal.add(callback)

    if listener1 != listener2:
        return fail_test("Expected adding same callback twice to return same listener")

    return pass_test()


func test_remove_handler() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var callback := func(_payload): pass

    test_signal.add(callback)
    var removed = test_signal.remove(callback)

    if not removed:
        return fail_test("Expected remove() to return true when removing existing callback")
    if test_signal.has(callback):
        return fail_test("Expected signal to not have the callback after remove()")

    return pass_test()


func test_remove_nonexistent_handler() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var callback := func(_payload): pass

    var removed = test_signal.remove(callback)

    if removed:
        return fail_test("Expected remove() to return false when removing non-existent callback")

    return pass_test()


func test_remove_all_handlers() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var callback1 := func(_payload): pass
    var callback2 := func(_payload): pass

    test_signal.add(callback1)
    test_signal.add(callback2)
    test_signal.remove_all()

    if test_signal.has(callback1) or test_signal.has(callback2):
        return fail_test("Expected signal to have no callbacks after remove_all()")

    return pass_test()


func test_emit_void_signal() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit()

    if call_count[0] != 1:
        return fail_test("Expected callback to be called once, got " + str(call_count[0]))

    return pass_test()


func test_emit_void_signal_with_payload() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit(42)

    if call_count[0] != 0:
        return fail_test("Expected callback to not go through")

    return pass_test()


func test_emit_typed_signal_single_payload() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var received_payload := [null]
    var callback := func(payload): received_payload[0] = payload

    test_signal.add(callback)
    test_signal.emit(42)

    if received_payload[0] != 42:
        return fail_test("Expected payload to be 42, got " + str(received_payload[0]))

    return pass_test()


func test_emit_typed_signal_with_invalid_payload() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var call_count := [0]
    var _callback := func(_payload): call_count[0] += 1

    test_signal.add(_callback)
    test_signal.emit("hello")

    if call_count[0] != 0:
        return fail_test("Expected callback to not go through")

    return pass_test()


func test_emit_variant_signal_with_different_types() -> TestResult:
    var test_signal = BetterSignal.new_untyped()
    var received_payloads: Array[Variant] = []
    var callback: Callable = func(payload: Variant): received_payloads.append(payload)

    test_signal.add(callback)
    test_signal.emit(42)
    test_signal.emit("hello")
    test_signal.emit(Vector2(1, 2))

    if received_payloads.size() != 3:
        return fail_test("Expected 3 emissions, got " + str(received_payloads.size()))
    if received_payloads[0] != 42:
        return fail_test("Expected first payload to be 42")
    if received_payloads[1] != "hello":
        return fail_test("Expected second payload to be 'hello'")
    if received_payloads[2] != Vector2(1, 2):
        return fail_test("Expected third payload to be Vector2(1, 2)")

    return pass_test()


func test_emit_calls_multiple_handlers() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var call_count1 := [0]
    var call_count2 := [0]
    var callback1 := func(_payload): call_count1[0] += 1
    var callback2 := func(_payload): call_count2[0] += 1

    test_signal.add(callback1)
    test_signal.add(callback2)
    test_signal.emit(10)

    if call_count1[0] != 1:
        return fail_test("Expected first callback to be called once, got " + str(call_count1[0]))
    if call_count2[0] != 1:
        return fail_test("Expected second callback to be called once, got " + str(call_count2[0]))

    return pass_test()


func test_emit_after_handler_removed() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var call_count := [0]
    var callback := func(_payload): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit(1)
    test_signal.remove(callback)
    test_signal.emit(2)

    if call_count[0] != 1:
        return fail_test("Expected callback to be called once (before removal), got " + str(call_count[0]))

    return pass_test()


func test_emit_with_priority() -> TestResult:
    var test_signal = BetterSignal.new()
    var results: Array[int] = []
    var callback1: Callable = func(): results.append(1)
    var callback2: Callable = func(): results.append(2)
    var callback3: Callable = func(): results.append(3)

    test_signal.add(callback1).with_priority(1)
    test_signal.add(callback2).with_priority(-1)
    test_signal.add(callback3).with_priority(2)
    test_signal.emit()

    if results != [3, 1, 2]:
        return fail_test("Expected results to be [3, 1, 2], got " + str(results))

    return pass_test()


func test_emit_with_priority_post_emit() -> TestResult:
    var test_signal = BetterSignal.new()
    var results: Array[int] = []
    var callback1: Callable = func(): results.append(1)
    var callback2: Callable = func(): results.append(2)
    var callback3: Callable = func(): results.append(3)

    var listener1 = test_signal.add(callback1)
    var listener2 = test_signal.add(callback2)
    var listener3 = test_signal.add(callback3)

    test_signal.emit()

    results.clear()

    listener1.with_priority(1)
    listener2.with_priority(2)
    listener3.with_priority(3)

    test_signal.emit()

    if results != [3, 2, 1]:
        return fail_test("Expected results to be [3,2,1], got " + str(results))

    results.clear()

    listener1.with_priority(3)
    listener2.with_priority(1)
    listener3.with_priority(-100)

    test_signal.emit()

    if results != [1, 2, 3]:
        return fail_test("Expected results to be [1,2,3], got " + str(results))

    return pass_test()


func test_priority_resets_after_remove() -> TestResult:
    var test_signal = BetterSignal.new()
    var results: Array[int] = []
    var callback1: Callable = func(): results.append(1)
    var callback2: Callable = func(): results.append(2)
    var callback3: Callable = func(): results.append(3)

    test_signal.add(callback1).with_priority(5)
    test_signal.add(callback2).with_priority(1)
    test_signal.add(callback3).with_priority(20)

    test_signal.emit()

    if results != [3, 1, 2]:
        return fail_test("Expected results to be [3, 1, 2], got " + str(results))

    results.clear()

    test_signal.remove(callback1)
    test_signal.emit()

    if results != [3, 2]:
        return fail_test("Expected results to be [3,2], got " + str(results))

    results.clear()

    test_signal.add(callback1)
    test_signal.emit()

    if results != [3, 2, 1]:
        return fail_test("Expected results to be [3,2,1], got " + str(results))

    return pass_test()
