extends TestFile

## NOTE: Mostly AI-generated and unverified tests

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


func test_init_invalid_type_bool_defaults_to_untyped() -> TestResult:
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


func test_init_invalid_type_object_defaults_to_untyped() -> TestResult:
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


func test_init_invalid_array_with_invalid_element_defaults_to_untyped() -> TestResult:
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


func test_init_invalid_type_constant_out_of_range_defaults_to_untyped() -> TestResult:
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


func test_init_array_with_null_defaults_to_untyped() -> TestResult:
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


func test_remove_handler_should_dispose_subscriber() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var callback := func(): pass

    var listener = test_signal.add(callback)
    test_signal.remove(callback)

    if not listener._callable.is_null():
        return fail_test("Expected listener to be freed after remove()")

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


func test_emit_void_signal_with_payload_goes_through() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit(42)

    return assert_equal(1, call_count[0])


func test_emit_strict_void_signal_with_payload_does_not_go_through() -> TestResult:
    var test_signal = BetterSignal.new_void_strict()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit(42)

    if call_count[0] != 0:
        return fail_test("Expected callback to not go through (strict void signal does not accept any arguments)")

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


# ===============================
# Delay Tests
# ===============================


func test_delay_prevents_immediate_execution() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1

    test_signal.add(_callback).with_delay_frames(1)
    test_signal.emit()

    # Callback should NOT have been called yet (delay prevents immediate execution)
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called immediately with delay, got " + str(call_count[0]) + " calls")

    # Wait to prevent leaking from the test
    await Engine.get_main_loop().process_frame
    await Engine.get_main_loop().process_frame

    return pass_test()


func test_frame_delay_executes_at_the_right_frame() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1

    test_signal.add(_callback).with_delay_frames(3)
    test_signal.emit()

    # Callback should NOT have been called yet (delay prevents immediate execution)
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called immediately with delay, got " + str(call_count[0]) + " calls")

    # TODO: Is this actually _really_ precise down to the frame? Is this test "fuzzy"?
    await Engine.get_main_loop().process_frame
    await Engine.get_main_loop().process_frame

    if call_count[0] != 0:
        return fail_test("Expected callback to not be called immediately with delay, got " + str(call_count[0]) + " calls")

    await Engine.get_main_loop().process_frame

    if call_count[0] != 1:
        return fail_test("Expected callback to be called once, got " + str(call_count[0]))

    return pass_test()


func test_physics_frame_delay_prevents_immediate_execution() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1

    test_signal.add(_callback).with_delay_physics_frames(2)
    test_signal.emit()

    # Callback should NOT have been called yet
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called immediately with physics delay, got " + str(call_count[0]) + " calls")

    # Wait to prevent leaking from the test
    await Engine.get_main_loop().physics_frame
    await Engine.get_main_loop().physics_frame
    await Engine.get_main_loop().physics_frame

    return pass_test()


func test_ms_delay_prevents_immediate_execution() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1

    test_signal.add(_callback).with_delay_ms(50)
    test_signal.emit()

    # Callback should NOT have been called yet
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called immediately with ms delay, got " + str(call_count[0]) + " calls")

    # Wait for the delay to complete to prevent leaking
    await Engine.get_main_loop().create_timer(0.1).timeout

    return pass_test()


func test_zero_delay_executes_immediately() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1

    test_signal.add(_callback).with_delay_frames(0)
    test_signal.emit()

    # With zero delay, should execute immediately
    if call_count[0] != 1:
        return fail_test("Expected callback to be called immediately with zero delay, got " + str(call_count[0]) + " calls")

    return pass_test()


func test_delay_with_payload() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var received_value := [null]
    var _callback := func(value): received_value[0] = value

    test_signal.add(_callback).with_delay_frames(2)
    test_signal.emit(42)

    # Should not have been called yet
    if received_value[0] != null:
        return fail_test("Expected callback to not be called immediately")

    # Wait for delay
    await Engine.get_main_loop().process_frame
    await Engine.get_main_loop().process_frame
    await Engine.get_main_loop().process_frame

    # Should have received the payload
    if received_value[0] != 42:
        return fail_test("Expected payload to be 42, got " + str(received_value[0]))

    return pass_test()


func test_delay_with_once() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1

    test_signal.add(_callback).with_delay_frames(2).once()

    # First emit
    test_signal.emit()

    # Wait to ensure delay completes
    for i in 3:
        await Engine.get_main_loop().process_frame

    if call_count[0] != 1:
        return fail_test("Expected 1 call after first emit, got " + str(call_count[0]))

    # Second emit - should not fire as it was removed after first use
    test_signal.emit()

    for i in 3:
        await Engine.get_main_loop().process_frame

    if call_count[0] != 1:
        return fail_test("Expected still 1 call after second emit (once removes it), got " + str(call_count[0]))

    return pass_test()


func test_delay_with_limited_to() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1

    test_signal.add(_callback).with_delay_frames(2).limited_to(2)

    # First emit
    test_signal.emit()
    for i in 5:
        await Engine.get_main_loop().process_frame

    if call_count[0] != 1:
        return fail_test("Expected 1 call, got " + str(call_count[0]))

    # Second emit
    test_signal.emit()
    for i in 5:
        await Engine.get_main_loop().process_frame

    if call_count[0] != 2:
        return fail_test("Expected 2 calls, got " + str(call_count[0]))

    # Third emit - should not fire
    test_signal.emit()
    for i in 5:
        await Engine.get_main_loop().process_frame

    if call_count[0] != 2:
        return fail_test("Expected still 2 calls after third emit (limited to 2), got " + str(call_count[0]))

    return pass_test()


func test_multiple_subscribers_with_different_delays() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_order: Array[int] = []
    var _callback1 := func(): call_order.append(1)
    var _callback2 := func(): call_order.append(2)
    var _callback3 := func(): call_order.append(3)

    test_signal.add(_callback1).with_delay_frames(1)
    test_signal.add(_callback2).with_delay_frames(3)
    test_signal.add(_callback3)  # No delay

    test_signal.emit()

    # Callback3 should fire immediately
    if call_order != [3]:
        return fail_test("Expected [3] immediately, got " + str(call_order))

    # Wait for callback1 (1 frame delay)
    await Engine.get_main_loop().process_frame

    if call_order != [3, 1]:
        return fail_test("Expected [3, 1] after 1 frame, got " + str(call_order))

    # Wait for callback2 (3 frame delay total)
    await Engine.get_main_loop().process_frame
    await Engine.get_main_loop().process_frame

    if call_order != [3, 1, 2]:
        return fail_test("Expected [3, 1, 2] after all delays, got " + str(call_order))

    return pass_test()


func test_delay_with_priority() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_order: Array[int] = []
    var _callback1 := func(): call_order.append(1)
    var _callback2 := func(): call_order.append(2)

    # Both have same delay but different priorities
    # Higher priority (2) should start its delay first
    test_signal.add(_callback1).with_delay_frames(2).with_priority(1)
    test_signal.add(_callback2).with_delay_frames(2).with_priority(2)

    test_signal.emit()

    # Wait for delays to complete
    for i in 5:
        await Engine.get_main_loop().process_frame

    # Both should have fired (order depends on when delay started)
    if call_order.size() != 2:
        return fail_test("Expected 2 callbacks to fire, got " + str(call_order.size()))

    # Priority 2 fires before priority 1 in the emit loop
    if call_order != [2, 1]:
        return fail_test("Expected [2, 1] (priority order), got " + str(call_order))

    return pass_test()


# ===============================
# WeakRef and Memory Management Tests
# ===============================


func test_subscriber_weakref_to_signal() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var _callback := func(): pass
    var subscriber = test_signal.add(_callback)

    # Subscriber should not be orphaned while signal exists
    if subscriber.is_orphaned():
        return fail_test("Expected subscriber to not be orphaned initially")

    # Free the signal
    test_signal = null
    await Engine.get_main_loop().process_frame

    # Subscriber should now be orphaned (signal weakref is invalid)
    if not subscriber.is_orphaned():
        return fail_test("Expected subscriber to be orphaned after signal freed")

    return pass_test()


# ===============================
# Edge Cases and Additional Scenarios
# ===============================


func test_multiple_emissions_with_delay() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_INT)
    var received_values: Array[int] = []
    var _callback := func(value: int): received_values.append(value)

    test_signal.add(_callback).with_delay_frames(1)

    # Emit multiple times rapidly
    test_signal.emit(1)
    test_signal.emit(2)
    test_signal.emit(3)

    # Wait for all delays to complete
    for i in 5:
        await Engine.get_main_loop().process_frame

    # All values should be received in order
    if received_values != [1, 2, 3]:
        return fail_test("Expected [1, 2, 3], got " + str(received_values))

    return pass_test()


func test_delay_preserves_emission_order() -> TestResult:
    var test_signal = BetterSignal.new(TYPE_STRING)
    var received_values: Array[String] = []
    var _callback := func(value: String): received_values.append(value)

    test_signal.add(_callback).with_delay_frames(2)

    # Emit in specific order
    test_signal.emit("first")
    test_signal.emit("second")
    test_signal.emit("third")

    # Wait for delays
    for i in 6:
        await Engine.get_main_loop().process_frame

    # Order should be preserved
    if received_values != ["first", "second", "third"]:
        return fail_test("Expected order preserved, got " + str(received_values))

    return pass_test()


func test_removed_delayed_subcsriber_should_not_be_called() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1

    test_signal.add(_callback).with_delay_frames(2)
    test_signal.emit()

    # Remove subscriber before delay completes
    test_signal.remove(_callback)

    # Wait past when it would have fired
    for i in 2:
        await Engine.get_main_loop().process_frame

    # Should not have been called
    if call_count[0] != 0:
        return fail_test("Expected 0 calls (removed before delay), got " + str(call_count[0]))

    return pass_test()


func test_delay_ms_executes_after_time() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1

    test_signal.add(_callback).with_delay_ms(100)
    test_signal.emit()

    # Should not be called immediately
    if call_count[0] != 0:
        return fail_test("Expected 0 calls immediately")

    # Wait for delay to complete
    await Engine.get_main_loop().create_timer(0.15).timeout

    # Should have been called now
    if call_count[0] != 1:
        return fail_test("Expected 1 call after delay, got " + str(call_count[0]))

    return pass_test()


func test_subscriber_getters() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var _callback := func(): pass

    var subscriber = test_signal.add(_callback).with_delay_frames(5).with_priority(10).limited_to(3)

    # Check getters return correct values
    if subscriber.get_priority() != 10:
        return fail_test("Expected priority 10, got " + str(subscriber.get_priority()))

    if subscriber.get_uses_left() != 3:
        return fail_test("Expected uses_left 3, got " + str(subscriber.get_uses_left()))

    if subscriber.emit_delay_amount != 5:
        return fail_test("Expected delay_amount 5, got " + str(subscriber.emit_delay_amount))

    if subscriber.emit_delay_type != "process_frame":
        return fail_test("Expected delay_type 'process_frame', got " + str(subscriber.emit_delay_type))

    return pass_test()


# ===============================
# Enable/Disable Tests
# ===============================


func test_signal_enabled_by_default() -> TestResult:
    var test_signal = BetterSignal.new_void()
    return assert_true(test_signal.is_enabled(), "Expected signal to be enabled by default after creation")


func test_signal_disable_changes_enabled_state() -> TestResult:
    var test_signal = BetterSignal.new_void()
    test_signal.disable()
    return assert_false(test_signal.is_enabled(), "Expected signal to be disabled after disable()")


func test_signal_enable_changes_enabled_state() -> TestResult:
    var test_signal = BetterSignal.new_void()
    test_signal.disable()
    test_signal.enable()
    return assert_true(test_signal.is_enabled(), "Expected signal to be enabled after enable()")


func test_signal_disabled_does_not_emit() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1
    test_signal.add(_callback)
    test_signal.disable()
    return assert_false(call_count[0] > 0, "Expected 0 calls after disable()")


func test_signal_re_enabled_does_emit() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1
    test_signal.add(_callback)
    test_signal.disable()
    test_signal.enable()
    test_signal.emit()
    return assert_true(call_count[0] > 0, "Expected 1 call after enable()")


func test_signal_disabled_with_delay_does_not_emit() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1
    test_signal.add(_callback)
    test_signal.disable()
    test_signal.emit()
    return assert_false(call_count[0] > 0, "Expected 0 calls after disable()")


func test_signal_disabled_signal_does_not_queue_delayed_emissions() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1
    test_signal.add(_callback).with_delay_frames(2)
    test_signal.disable()
    test_signal.emit()
    for i in 2:
        await Engine.get_main_loop().process_frame
    return assert_false(call_count[0] > 0, "Expected 0 calls after disable()")


func test_disabling_signal_does_not_stop_queued_delayed_emissions() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1
    test_signal.add(_callback).with_delay_frames(2)
    test_signal.emit()
    test_signal.disable()
    for i in 2:
        await Engine.get_main_loop().process_frame
    return assert_true(call_count[0] > 0, "Expected 1 call after disable()")


# ===============================
# Godot signal linking Tests
# ===============================


func test_signal_link_to_godot_signal_adds_link_to_internal_list() -> TestResult:
    var test_signal = BetterSignal.new_void()
    test_signal.link_to_godot_signal(Engine.get_main_loop().process_frame)
    return assert_equal(1, test_signal._godot_builtin_signals_links.size())


func test_adding_same_callback_multiple_times_does_not_duplicate() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    # Add the same callback multiple times
    test_signal.add(callback)
    test_signal.add(callback)
    test_signal.add(callback)

    # Should only have one subscriber
    return assert_equal(1, test_signal._subscribers.size(), "Expected only 1 subscriber when adding same callback multiple times")


func test_adding_same_callback_multiple_times_only_calls_once() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    # Add the same callback multiple times
    test_signal.add(callback)
    test_signal.add(callback)
    test_signal.add(callback)

    # Emit and verify it only calls once
    test_signal.emit()
    return assert_equal(1, call_count[0], "Expected callback to be called only once despite multiple adds")


func test_signal_link_to_godot_signal_by_name_adds_link_to_internal_list() -> TestResult:
    var test_signal = BetterSignal.new_void()
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    return assert_equal(1, test_signal._godot_builtin_signals_links.size())


func test_signal_link_to_godot_signal_emits_with_it() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    test_signal.link_to_godot_signal(Engine.get_main_loop().process_frame)
    await Engine.get_main_loop().process_frame
    return assert_equal(1, call_count[0])


func test_signal_link_to_godot_signal_by_name_emits_with_it() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    await Engine.get_main_loop().process_frame
    return assert_equal(1, call_count[0])


func test_signal_add_by_ref_remove_by_name_removes_link() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var godot_signal = Engine.get_main_loop().process_frame
    test_signal.link_to_godot_signal(godot_signal)
    test_signal.disconnect_from_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_signal_add_by_name_remove_by_ref_removes_link() -> TestResult:
    var test_signal = BetterSignal.new_void()
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    var godot_signal = Engine.get_main_loop().process_frame
    test_signal.disconnect_from_godot_signal(godot_signal)
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_signal_disconnect_from_godot_signal_removes_link_from_internal_list() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var godot_signal = Engine.get_main_loop().process_frame
    test_signal.link_to_godot_signal(godot_signal)
    test_signal.disconnect_from_godot_signal(godot_signal)
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_signal_disconnect_from_godot_signal_by_name_removes_link_from_internal_list() -> TestResult:
    var test_signal = BetterSignal.new_void()
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    test_signal.disconnect_from_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_signal_disconnect_from_godot_signal_stops_emitting_with_it() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    var godot_signal = Engine.get_main_loop().process_frame
    test_signal.link_to_godot_signal(godot_signal)
    test_signal.disconnect_from_godot_signal(godot_signal)
    await Engine.get_main_loop().process_frame
    return assert_equal(0, call_count[0])


func test_signal_disconnect_from_godot_signal_by_name_stops_emitting_with_it() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    test_signal.disconnect_from_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    await Engine.get_main_loop().process_frame
    return assert_equal(0, call_count[0])


func test_signal_disconnect_from_all_godot_signals_removes_all_links_from_internal_list() -> TestResult:
    var test_signal = BetterSignal.new_void()
    test_signal.link_to_godot_signal(Engine.get_main_loop().process_frame)
    test_signal.disconnect_from_all_godot_signals()
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_signal_disconnect_from_all_godot_signals_stops_emitting_linked_by_ref() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    var godot_signal = Engine.get_main_loop().process_frame
    test_signal.link_to_godot_signal(godot_signal)
    test_signal.disconnect_from_all_godot_signals()
    await Engine.get_main_loop().process_frame
    return assert_equal(0, call_count[0])


func test_signal_disconnect_from_all_godot_signals_stops_emitting_linked_by_name() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    test_signal.disconnect_from_all_godot_signals()
    await Engine.get_main_loop().process_frame
    return assert_equal(0, call_count[0])


func test_signal_link_to_godot_signal_integration_with_button_node() -> TestResult:
    var test_signal = BetterSignal.new_void()
    var call_count := [0]
    var button_node = Button.new()
    Engine.get_main_loop().root.add_child(button_node)
    test_signal.link_to_godot_signal(button_node.pressed)
    test_signal.add(func(): call_count[0] += 1)

    button_node.pressed.emit()

    button_node.queue_free()
    return assert_equal(1, call_count[0])
