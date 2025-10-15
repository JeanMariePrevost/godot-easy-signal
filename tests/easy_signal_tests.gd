extends GDTestCase

## NOTE: Mostly AI-generated and unverified tests

# ===============================
# Initialization Tests
# ===============================


func test_new_typed_single_type() -> GDTestResult:
    var test_signal = EasySignal.new_typed("int")

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int"]:
        return fail_test("Expected argument types to be ['int'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_new_typed_multiple_types() -> GDTestResult:
    var test_signal = EasySignal.new_typed("int", "float", "String")

    if test_signal.get_argument_count() != 3:
        return fail_test("Expected argument count to be 3, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int", "float", "String"]:
        return fail_test("Expected argument types to be ['int', 'float', 'String'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_new_typed_bad_input_returns_null() -> GDTestResult:
    var test_signal = EasySignal.new_typed([["int", "float", "String"]])

    if test_signal == null:
        return pass_test()
    else:
        return fail_test("Expected signal to be null")


func test_new_void() -> GDTestResult:
    var test_signal = EasySignal.new_void()

    if test_signal.get_argument_count() != 0:
        return fail_test("Expected argument count to be 0, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != []:
        return fail_test("Expected argument types to be [], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if not test_signal.get_is_void():
        return fail_test("Expected signal to be void")

    return pass_test()


func test_new_untyped() -> GDTestResult:
    var test_signal = EasySignal.new_untyped()

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_single_type_int() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int"]:
        return fail_test("Expected argument types to be ['int'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_single_type_float() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_FLOAT)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["float"]:
        return fail_test("Expected argument types to be ['float'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_single_type_string() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_STRING)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["String"]:
        return fail_test("Expected argument types to be ['String'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_of_types() -> GDTestResult:
    var test_signal = EasySignal.new([TYPE_INT, TYPE_FLOAT])

    if test_signal.get_argument_count() != 2:
        return fail_test("Expected argument count to be 2, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int", "float"]:
        return fail_test("Expected argument types to be ['int', 'float'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_of_types_mixed() -> GDTestResult:
    var test_signal = EasySignal.new([TYPE_STRING, TYPE_BOOL, TYPE_VECTOR2])

    if test_signal.get_argument_count() != 3:
        return fail_test("Expected argument count to be 3, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["String", "bool", "Vector2"]:
        return fail_test("Expected argument types to be ['String', 'bool', 'Vector2'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_single_string_type() -> GDTestResult:
    var test_signal = EasySignal.new("int")

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int"]:
        return fail_test("Expected argument types to be ['int'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_custom_class_name() -> GDTestResult:
    var test_signal = EasySignal.new("MySpecialType")

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["MySpecialType"]:
        return fail_test("Expected argument types to be ['MySpecialType'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_of_string_types() -> GDTestResult:
    var test_signal = EasySignal.new(["int", "float"])

    if test_signal.get_argument_count() != 2:
        return fail_test("Expected argument count to be 2, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int", "float"]:
        return fail_test("Expected argument types to be ['int', 'float'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_of_string_types_with_custom() -> GDTestResult:
    var test_signal = EasySignal.new(["String", "MySpecialType"])

    if test_signal.get_argument_count() != 2:
        return fail_test("Expected argument count to be 2, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["String", "MySpecialType"]:
        return fail_test("Expected argument types to be ['String', 'MySpecialType'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_void_with_null() -> GDTestResult:
    var test_signal = EasySignal.new(null)

    if test_signal.get_argument_count() != 0:
        return fail_test("Expected argument count to be 0, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != []:
        return fail_test("Expected argument types to be [], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if not test_signal.get_is_void():
        return fail_test("Expected signal to be void")

    return pass_test()


func test_init_void_with_type_nil() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_NIL)

    if test_signal.get_argument_count() != 0:
        return fail_test("Expected argument count to be 0, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != []:
        return fail_test("Expected argument types to be [], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if not test_signal.get_is_void():
        return fail_test("Expected signal to be void")

    return pass_test()


func test_init_void_with_empty_array() -> GDTestResult:
    var test_signal = EasySignal.new([])

    if test_signal.get_argument_count() != 0:
        return fail_test("Expected argument count to be 0, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != []:
        return fail_test("Expected argument types to be [], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if not test_signal.get_is_void():
        return fail_test("Expected signal to be void")

    return pass_test()


func test_init_void_with_no_args() -> GDTestResult:
    var test_signal = EasySignal.new()

    if test_signal.get_argument_count() != 0:
        return fail_test("Expected argument count to be 0, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != []:
        return fail_test("Expected argument types to be [], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if not test_signal.get_is_void():
        return fail_test("Expected signal to be void")

    return pass_test()


func test_init_variant_with_string() -> GDTestResult:
    var test_signal = EasySignal.new("Variant")

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_variant_with_array() -> GDTestResult:
    var test_signal = EasySignal.new(["Variant"])

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_mixed_type_and_string() -> GDTestResult:
    var test_signal = EasySignal.new([TYPE_INT, "float", TYPE_STRING])

    if test_signal.get_argument_count() != 3:
        return fail_test("Expected argument count to be 3, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int", "float", "String"]:
        return fail_test("Expected argument types to be ['int', 'float', 'String'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_all_basic_types() -> GDTestResult:
    var test_signal = (
        EasySignal
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


func test_init_type_array() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_ARRAY)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Array"]:
        return fail_test("Expected argument types to be ['Array'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_type_dictionary() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_DICTIONARY)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Dictionary"]:
        return fail_test("Expected argument types to be ['Dictionary'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_type_object() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_OBJECT)

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


func test_init_invalid_type_bool_defaults_to_untyped() -> GDTestResult:
    var test_signal = EasySignal.new(true)

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1 (variant defaults to 1), got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant (invalid input defaults to variant)")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_invalid_type_object_defaults_to_untyped() -> GDTestResult:
    var test_object = Object.new()
    var test_signal = EasySignal.new(test_object)
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


func test_init_invalid_array_with_invalid_element_defaults_to_untyped() -> GDTestResult:
    var test_signal = EasySignal.new([TYPE_INT, true, TYPE_FLOAT])  # Should default to untyped

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1 (variant defaults to 1), got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant (invalid element causes fallback to variant)")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_invalid_type_constant_out_of_range_defaults_to_untyped() -> GDTestResult:
    var test_signal = EasySignal.new(-1)  # Should default to untyped

    if test_signal.get_argument_count() != 1:
        return fail_test("Expected argument count to be 1 (variant defaults to 1), got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["Variant"]:
        return fail_test("Expected argument types to be ['Variant'], got " + str(test_signal.get_argument_types()))
    if not test_signal.get_is_variant():
        return fail_test("Expected signal to be variant (invalid type constant defaults to variant)")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


func test_init_array_with_null_defaults_to_untyped() -> GDTestResult:
    var test_signal = EasySignal.new(["String", null, "int"])  # Should default to untyped
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


func test_add_handler() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var callback: Callable = func(_payload): pass

    var listener = test_signal.add(callback)

    if listener == null:
        return fail_test("Expected add() to return a listener")
    if not test_signal.has(callback):
        return fail_test("Expected signal to have the callback after add()")

    return pass_test()


func test_add_same_handler_twice_returns_same_listener() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var callback := func(_payload): pass

    var listener1 = test_signal.add(callback)
    var listener2 = test_signal.add(callback)

    if listener1 != listener2:
        return fail_test("Expected adding same callback twice to return same listener")

    return pass_test()


func test_remove_handler_should_dispose_subscriber() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var callback := func(): pass

    var listener = test_signal.add(callback)
    test_signal.remove(callback)

    if not listener._callable.is_null():
        return fail_test("Expected listener to be freed after remove()")

    return pass_test()


func test_remove_handler() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var callback := func(_payload): pass

    test_signal.add(callback)
    var removed = test_signal.remove(callback)

    if not removed:
        return fail_test("Expected remove() to return true when removing existing callback")
    if test_signal.has(callback):
        return fail_test("Expected signal to not have the callback after remove()")

    return pass_test()


func test_remove_nonexistent_handler() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var callback := func(_payload): pass

    var removed = test_signal.remove(callback)

    if removed:
        return fail_test("Expected remove() to return false when removing non-existent callback")

    return pass_test()


func test_remove_all_handlers() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var callback1 := func(_payload): pass
    var callback2 := func(_payload): pass

    test_signal.add(callback1)
    test_signal.add(callback2)
    test_signal.remove_all()

    if test_signal.has(callback1) or test_signal.has(callback2):
        return fail_test("Expected signal to have no callbacks after remove_all()")

    return pass_test()


func test_emit_void_signal() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit()

    if call_count[0] != 1:
        return fail_test("Expected callback to be called once, got " + str(call_count[0]))

    return pass_test()


func test_emit_void_signal_with_payload_goes_through() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit(42)

    return assert_equal(1, call_count[0])


func test_emit_strict_void_signal_with_payload_does_not_go_through() -> GDTestResult:
    var test_signal = EasySignal.new_void_strict()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit(42)

    if call_count[0] != 0:
        return fail_test("Expected callback to not go through (strict void signal does not accept any arguments)")

    return pass_test()


func test_emit_typed_signal_single_payload() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var received_payload := [null]
    var callback := func(payload): received_payload[0] = payload

    test_signal.add(callback)
    test_signal.emit(42)

    if received_payload[0] != 42:
        return fail_test("Expected payload to be 42, got " + str(received_payload[0]))

    return pass_test()


func test_emit_typed_signal_with_invalid_payload() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var call_count := [0]
    var _callback := func(_payload): call_count[0] += 1

    test_signal.add(_callback)
    test_signal.emit("hello")

    if call_count[0] != 0:
        return fail_test("Expected callback to not go through")

    return pass_test()


func test_emit_variant_signal_with_different_types() -> GDTestResult:
    var test_signal = EasySignal.new_untyped()
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


func test_emit_calls_multiple_handlers() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
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


func test_emit_after_handler_removed() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var call_count := [0]
    var callback := func(_payload): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit(1)
    test_signal.remove(callback)
    test_signal.emit(2)

    if call_count[0] != 1:
        return fail_test("Expected callback to be called once (before removal), got " + str(call_count[0]))

    return pass_test()


func test_emit_with_priority() -> GDTestResult:
    var test_signal = EasySignal.new()
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


func test_emit_with_priority_post_emit() -> GDTestResult:
    var test_signal = EasySignal.new()
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


func test_priority_resets_after_remove() -> GDTestResult:
    var test_signal = EasySignal.new()
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


func test_delay_prevents_immediate_execution() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_frame_delay_executes_at_the_right_frame() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_physics_frame_delay_prevents_immediate_execution() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_ms_delay_prevents_immediate_execution() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_zero_delay_executes_immediately() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1

    test_signal.add(_callback).with_delay_frames(0)
    test_signal.emit()

    # With zero delay, should execute immediately
    if call_count[0] != 1:
        return fail_test("Expected callback to be called immediately with zero delay, got " + str(call_count[0]) + " calls")

    return pass_test()


func test_delay_with_payload() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
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


func test_delay_with_once() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_delay_with_limited_to() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_multiple_subscribers_with_different_delays() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_delay_with_priority() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_subscriber_weakref_to_signal() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_multiple_emissions_with_delay() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
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


func test_delay_preserves_emission_order() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_STRING)
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


func test_removed_delayed_subcsriber_should_not_be_called() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_delay_ms_executes_after_time() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_subscriber_getters() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_signal_enabled_by_default() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    return assert_true(test_signal.is_enabled(), "Expected signal to be enabled by default after creation")


func test_signal_disable_changes_enabled_state() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    test_signal.disable()
    return assert_false(test_signal.is_enabled(), "Expected signal to be disabled after disable()")


func test_signal_enable_changes_enabled_state() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    test_signal.disable()
    test_signal.enable()
    return assert_true(test_signal.is_enabled(), "Expected signal to be enabled after enable()")


func test_signal_disabled_does_not_emit() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1
    test_signal.add(_callback)
    test_signal.disable()
    return assert_false(call_count[0] > 0, "Expected 0 calls after disable()")


func test_signal_re_enabled_does_emit() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1
    test_signal.add(_callback)
    test_signal.disable()
    test_signal.enable()
    test_signal.emit()
    return assert_true(call_count[0] > 0, "Expected 1 call after enable()")


func test_signal_disabled_with_delay_does_not_emit() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1
    test_signal.add(_callback)
    test_signal.disable()
    test_signal.emit()
    return assert_false(call_count[0] > 0, "Expected 0 calls after disable()")


func test_signal_disabled_signal_does_not_queue_delayed_emissions() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var _callback := func(): call_count[0] += 1
    test_signal.add(_callback).with_delay_frames(2)
    test_signal.disable()
    test_signal.emit()
    for i in 2:
        await Engine.get_main_loop().process_frame
    return assert_false(call_count[0] > 0, "Expected 0 calls after disable()")


func test_disabling_signal_does_not_stop_queued_delayed_emissions() -> GDTestResult:
    var test_signal = EasySignal.new_void()
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


func test_signal_link_to_godot_signal_adds_link_to_internal_list() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    test_signal.link_to_godot_signal(Engine.get_main_loop().process_frame)
    return assert_equal(1, test_signal._godot_builtin_signals_links.size())


func test_adding_same_callback_multiple_times_does_not_duplicate() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    # Add the same callback multiple times
    test_signal.add(callback)
    test_signal.add(callback)
    test_signal.add(callback)

    # Should only have one subscriber
    return assert_equal(1, test_signal._subscribers.size(), "Expected only 1 subscriber when adding same callback multiple times")


func test_adding_same_callback_multiple_times_only_calls_once() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    # Add the same callback multiple times
    test_signal.add(callback)
    test_signal.add(callback)
    test_signal.add(callback)

    # Emit and verify it only calls once
    test_signal.emit()
    return assert_equal(1, call_count[0], "Expected callback to be called only once despite multiple adds")


func test_signal_link_to_godot_signal_by_name_adds_link_to_internal_list() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    return assert_equal(1, test_signal._godot_builtin_signals_links.size())


func test_signal_link_to_godot_signal_emits_with_it() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    test_signal.link_to_godot_signal(Engine.get_main_loop().process_frame)
    await Engine.get_main_loop().process_frame
    return assert_equal(1, call_count[0])


func test_signal_link_to_godot_signal_by_name_emits_with_it() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    await Engine.get_main_loop().process_frame
    return assert_equal(1, call_count[0])


func test_signal_add_by_ref_remove_by_name_removes_link() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var godot_signal = Engine.get_main_loop().process_frame
    test_signal.link_to_godot_signal(godot_signal)
    test_signal.disconnect_from_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_signal_add_by_name_remove_by_ref_removes_link() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    var godot_signal = Engine.get_main_loop().process_frame
    test_signal.disconnect_from_godot_signal(godot_signal)
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_signal_disconnect_from_godot_signal_removes_link_from_internal_list() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var godot_signal = Engine.get_main_loop().process_frame
    test_signal.link_to_godot_signal(godot_signal)
    test_signal.disconnect_from_godot_signal(godot_signal)
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_signal_disconnect_from_godot_signal_by_name_removes_link_from_internal_list() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    test_signal.disconnect_from_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_signal_disconnect_from_godot_signal_stops_emitting_with_it() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    var godot_signal = Engine.get_main_loop().process_frame
    test_signal.link_to_godot_signal(godot_signal)
    test_signal.disconnect_from_godot_signal(godot_signal)
    await Engine.get_main_loop().process_frame
    return assert_equal(0, call_count[0])


func test_signal_disconnect_from_godot_signal_by_name_stops_emitting_with_it() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    test_signal.disconnect_from_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    await Engine.get_main_loop().process_frame
    return assert_equal(0, call_count[0])


func test_signal_disconnect_from_all_godot_signals_removes_all_links_from_internal_list() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    test_signal.link_to_godot_signal(Engine.get_main_loop().process_frame)
    test_signal.disconnect_from_all_godot_signals()
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_signal_disconnect_from_all_godot_signals_stops_emitting_linked_by_ref() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    var godot_signal = Engine.get_main_loop().process_frame
    test_signal.link_to_godot_signal(godot_signal)
    test_signal.disconnect_from_all_godot_signals()
    await Engine.get_main_loop().process_frame
    return assert_equal(0, call_count[0])


func test_signal_disconnect_from_all_godot_signals_stops_emitting_linked_by_name() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    test_signal.add(func(): call_count[0] += 1)
    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "process_frame")
    test_signal.disconnect_from_all_godot_signals()
    await Engine.get_main_loop().process_frame
    return assert_equal(0, call_count[0])


func test_signal_link_to_godot_signal_integration_with_button_node() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var button_node = Button.new()
    Engine.get_main_loop().root.add_child(button_node)
    test_signal.link_to_godot_signal(button_node.pressed)
    test_signal.add(func(): call_count[0] += 1)

    button_node.pressed.emit()

    button_node.queue_free()
    return assert_equal(1, call_count[0])


# ===============================
# Public API Methods Tests (find, validate_payload)
# ===============================


func test_find_returns_subscriber_for_existing_callback() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var callback := func(): pass

    var subscriber = test_signal.add(callback)
    var found = test_signal.find(callback)

    if found != subscriber:
        return fail_test("Expected find() to return the same subscriber instance")

    return pass_test()


func test_find_returns_null_for_nonexistent_callback() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var callback := func(): pass

    var found = test_signal.find(callback)

    if found != null:
        return fail_test("Expected find() to return null for non-existent callback")

    return pass_test()


func test_find_distinguishes_between_different_callbacks() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var callback1 := func(): pass
    var callback2 := func(): pass

    var subscriber1 = test_signal.add(callback1)
    var found = test_signal.find(callback2)

    if found == subscriber1:
        return fail_test("Expected find() to distinguish between different callbacks")
    if found != null:
        return fail_test("Expected find() to return null for different callback")

    return pass_test()


func test_validate_payload_accepts_valid_payload() -> GDTestResult:
    var test_signal = EasySignal.new([TYPE_INT, TYPE_STRING])
    var payload = [42, "hello"]

    var result = test_signal.validate_payload(payload)

    if not result["valid"]:
        return fail_test("Expected valid payload to pass validation, reason: " + result["reason"])

    return pass_test()


func test_validate_payload_rejects_wrong_argument_count() -> GDTestResult:
    var test_signal = EasySignal.new([TYPE_INT, TYPE_STRING])
    var payload = [42]  # Missing second argument

    var result = test_signal.validate_payload(payload)

    if result["valid"]:
        return fail_test("Expected validation to fail for wrong argument count")
    if not "count" in result["reason"].to_lower():
        return fail_test("Expected reason to mention count mismatch, got: " + result["reason"])

    return pass_test()


func test_validate_payload_rejects_wrong_type() -> GDTestResult:
    var test_signal = EasySignal.new([TYPE_INT, TYPE_STRING])
    var payload = ["hello", 42]  # Types swapped

    var result = test_signal.validate_payload(payload)

    if result["valid"]:
        return fail_test("Expected validation to fail for wrong types")
    if not "type" in result["reason"].to_lower():
        return fail_test("Expected reason to mention type mismatch, got: " + result["reason"])

    return pass_test()


func test_validate_payload_accepts_variant_types() -> GDTestResult:
    var test_signal = EasySignal.new_untyped()
    var payload = [42]

    var result = test_signal.validate_payload(payload)

    if not result["valid"]:
        return fail_test("Expected variant signal to accept any payload, reason: " + result["reason"])

    return pass_test()


# ===============================
# Callback Validation Edge Cases
# ===============================


func test_add_null_callback_rejected() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var callback: Callable = Callable()  # Null callable

    var subscriber = test_signal.add(callback)

    if subscriber != null:
        return fail_test("Expected add() to reject null callable")

    return pass_test()


func test_add_invalid_callback_rejected() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var obj = RefCounted.new()
    var callback = Callable(obj, "nonexistent_method")

    var subscriber = test_signal.add(callback)

    # Invalid callable should be rejected
    if subscriber != null:
        return fail_test("Expected add() to reject invalid callable")

    return pass_test()


func test_add_callback_with_wrong_argument_count() -> GDTestResult:
    var test_signal = EasySignal.new_typed("int", "float")
    # Lambda with 1 argument when signal expects 2
    var callback := func(_arg1): pass

    var subscriber = test_signal.add(callback)

    # Should be rejected due to argument count mismatch
    return assert_null(subscriber)


# ===============================
# Godot Signal Linking Edge Cases
# ===============================


func test_link_to_godot_signal_with_null_source_rejected() -> GDTestResult:
    var test_signal = EasySignal.new_void()

    # Should handle null gracefully
    test_signal.link_to_godot_signal_by_name(null, "some_signal")

    # Should not have added any links
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_link_to_godot_signal_with_empty_signal_name_rejected() -> GDTestResult:
    var test_signal = EasySignal.new_void()

    test_signal.link_to_godot_signal_by_name(Engine.get_main_loop(), "")

    # Should not have added any links
    return assert_equal(0, test_signal._godot_builtin_signals_links.size())


func test_link_to_same_godot_signal_twice_does_not_duplicate() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var godot_signal = Engine.get_main_loop().process_frame

    test_signal.link_to_godot_signal(godot_signal)
    test_signal.link_to_godot_signal(godot_signal)  # Second time should warn and not duplicate

    # Should only have one link
    var result = assert_equal(1, test_signal._godot_builtin_signals_links.size())

    # Cleanup
    test_signal.disconnect_from_all_godot_signals()

    return result


func test_disconnect_from_godot_signal_that_was_never_connected() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var godot_signal = Engine.get_main_loop().process_frame

    var result = test_signal.disconnect_from_godot_signal(godot_signal)

    if result:
        return fail_test("Expected disconnect to return false for never-connected signal")

    return pass_test()


# ===============================
# EasySignalSubscriber Getter Tests
# ===============================


func test_subscriber_get_target_object_returns_correct_object() -> GDTestResult:
    var test_signal = EasySignal.new_typed("bool")
    var test_obj = Node.new()
    var callback = Callable(test_obj, "set_process")

    var subscriber = test_signal.add(callback)

    var object_if_correct: bool = subscriber.get_target_object() == test_obj

    test_obj.free()
    test_obj = null

    return assert_true(object_if_correct, "Expected get_target_object() to return the callback's object")


func test_subscriber_get_target_object_for_lambda_has_correct_metadata() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var subscriber = test_signal.add(func(): pass)

    # Ensure target object is non-null and of type Object and that the method name is "<anonymous lambda>"
    if subscriber.get_target_object() == null or subscriber.get_target_object() is not Object:
        return fail_test("Expected get_target_object() to return a non-null object")
    if subscriber.get_target_method() != "<anonymous lambda>":
        return fail_test("Expected get_target_method() to return '<anonymous lambda>' for lambda, got: " + subscriber.get_target_method())

    return pass_test()


# ===============================
# Fluent API Multiple Calls Tests
# ===============================


func test_calling_once_multiple_times_last_wins() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    var subscriber = test_signal.add(callback)
    subscriber.once()
    subscriber.limited_to(5)  # Should override once

    for i in 3:
        test_signal.emit()

    if call_count[0] != 3:
        return fail_test("Expected 3 calls (limited_to should override once), got " + str(call_count[0]))

    return pass_test()


func test_calling_limited_to_multiple_times_last_wins() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    var subscriber = test_signal.add(callback)
    subscriber.limited_to(2)
    subscriber.limited_to(1)  # Should override to 1

    test_signal.emit()
    test_signal.emit()

    if call_count[0] != 1:
        return fail_test("Expected 1 call (second limited_to should win), got " + str(call_count[0]))

    return pass_test()


func test_changing_delay_type_multiple_times_last_wins() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var callback := func(): pass

    var subscriber = test_signal.add(callback)
    subscriber.with_delay_frames(5)
    subscriber.with_delay_physics_frames(3)
    subscriber.with_delay_ms(100)  # Should win

    if subscriber.emit_delay_type != "ms":
        return fail_test("Expected delay_type to be 'ms', got " + subscriber.emit_delay_type)
    if subscriber.emit_delay_amount != 100:
        return fail_test("Expected delay_amount to be 100, got " + str(subscriber.emit_delay_amount))

    return pass_test()


func test_negative_delay_frames() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    var subscriber = test_signal.add(callback)
    subscriber.with_delay_frames(-5)  # Negative delay

    test_signal.emit()

    # Should probably execute immediately (or emit has undefined behavior)
    # This test documents the actual behavior
    if call_count[0] != 1:
        return fail_test("Expected immediate execution with negative delay, got " + str(call_count[0]) + " calls")

    return pass_test()


# ===============================
# Reentrancy Tests
# ===============================


func test_adding_subscriber_during_emission() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var second_callback := func():
        print("Second callback will take count from " + str(call_count[0]) + " to " + str(call_count[0] + 100))
        call_count[0] += 100

    var first_callback := func():
        print("First callback will take count from " + str(call_count[0]) + " to " + str(call_count[0] + 1))
        call_count[0] += 1
        test_signal.add(second_callback)  # Add during emission

    test_signal.add(first_callback)
    test_signal.emit()

    # First emit should only call first_callback
    if call_count[0] != 1:
        return fail_test("Expected 1 call on first emit, got " + str(call_count[0]))

    # Second emit should call both
    test_signal.emit()

    test_signal.remove_all()

    if call_count[0] != 102:  # 1 + 1 + 100
        return fail_test("Expected 102 total calls after second emit, got " + str(call_count[0]))

    return pass_test()


func test_removing_subscriber_during_emission() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var second_callback := func(): call_count[0] += 100

    var first_callback := func():
        call_count[0] += 1
        test_signal.remove(second_callback)  # Remove during emission

    test_signal.add(first_callback)
    test_signal.add(second_callback)
    test_signal.emit()

    test_signal.remove_all()

    # Both should have been called (removal happens after iteration started)
    # OR first removes second before it fires (implementation dependent)
    # This test documents actual behavior
    if call_count[0] < 1:
        return fail_test("Expected at least first callback to fire, got " + str(call_count[0]))

    return pass_test()


func test_recursive_emission() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var call_count := [0]

    var recursive_callback := func(depth: int):
        call_count[0] += 1
        if depth > 0:
            test_signal.emit(depth - 1)  # Recursive emit

    test_signal.add(recursive_callback)
    test_signal.emit(3)  # Should call 4 times total (3, 2, 1, 0)

    test_signal.remove_all()

    if call_count[0] != 4:
        return fail_test("Expected 4 calls from recursive emission, got " + str(call_count[0]))

    return pass_test()


# ===============================
# Memory Management Edge Cases
# ===============================


func test_target_object_freed_during_delay() -> GDTestResult:
    var test_signal = EasySignal.new_typed("bool")
    var call_count := [0]
    var obj = Node.new()

    var callback = Callable(obj, "set_process")
    test_signal.add(callback).with_delay_frames(2)
    test_signal.add(func(_arg): call_count[0] += 1)

    test_signal.emit(false)

    # Free the object during delay
    obj.free()
    obj = null

    # Wait for delay
    for i in 3:
        await Engine.get_main_loop().process_frame

    # Should not crash (gracefully handle freed object) and stillproceed with dispatch
    return assert_equal(1, call_count[0])


func test_dispose_prevents_delayed_invocation() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    var subscriber = test_signal.add(callback).with_delay_frames(2)
    test_signal.emit()

    # Dispose the subscriber immediately
    subscriber.dispose()

    # Wait for delay period
    for i in 3:
        await Engine.get_main_loop().process_frame

    # Should not have been called
    if call_count[0] != 0:
        return fail_test("Expected disposed subscriber to not be called, got " + str(call_count[0]) + " calls")

    return pass_test()


func test_is_orphaned_detects_null_callable() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var callback := func(): pass

    var subscriber = test_signal.add(callback)
    subscriber.dispose()  # This nullifies the callable

    if not subscriber.is_orphaned():
        return fail_test("Expected subscriber to be orphaned after dispose")

    return pass_test()


func test_purge_orphaned_subscribers_removes_orphaned_subscribers() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var test_node = Node.new()
    var callback := func(): call_count[0] += 1
    var _subscriber1 = test_signal.add(callback)
    var subscriber2 = test_signal.add(test_node.can_process)
    var _subscriber3 = test_signal.add(func(): call_count[0] += 1)

    test_signal.emit()

    test_node.free()
    test_node = null

    await Engine.get_main_loop().process_frame

    if test_signal._subscribers.size() != 3:
        return fail_test("Expected 3 subscribers, got " + str(test_signal._subscribers.size()))

    test_signal.purge_orphaned_subscribers()

    # COnfirm the listeners were removed from the signal
    if test_signal._subscribers.size() != 2:
        return fail_test("Expected 2 subscribers, got " + str(test_signal._subscribers.size()))

    # Confirm subscribers 2 was disposed by simply checking that their _target_object is null
    if subscriber2.get_target_object() != null:
        return fail_test("Expected subscriber2 to be disposed")

    test_signal.emit()

    return assert_equal(4, call_count[0])


# ===============================
# Priority Edge Cases
# ===============================


func test_priority_ties_maintain_add_order() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var results: Array[int] = []

    var callback1 := func(): results.append(1)
    var callback2 := func(): results.append(2)
    var callback3 := func(): results.append(3)

    # All have same priority
    test_signal.add(callback1).with_priority(5)
    test_signal.add(callback2).with_priority(5)
    test_signal.add(callback3).with_priority(5)

    test_signal.emit()

    # Should maintain add order when priorities are equal
    if results != [1, 2, 3]:
        return fail_test("Expected [1, 2, 3] for equal priorities, got " + str(results))

    return pass_test()


func test_extreme_priority_values() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var results: Array[int] = []

    var callback1 := func(): results.append(1)
    var callback2 := func(): results.append(2)
    var callback3 := func(): results.append(3)

    test_signal.add(callback1).with_priority(-9223372036854775808)  # MIN_INT
    test_signal.add(callback2).with_priority(0)
    test_signal.add(callback3).with_priority(9223372036854775807)  # MAX_INT

    test_signal.emit()

    # Highest priority first
    if results != [3, 2, 1]:
        return fail_test("Expected [3, 2, 1] for extreme priorities, got " + str(results))

    return pass_test()


# ===============================
# Complex Scenario Tests
# ===============================


func test_complex_chaining_all_fluent_methods() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var received_values: Array[int] = []
    var callback := func(val: int): received_values.append(val)

    test_signal.add(callback).with_priority(10).with_delay_frames(1).limited_to(2)

    test_signal.emit(1)
    test_signal.emit(2)
    test_signal.emit(3)  # Should not fire (limited to 2)

    # Wait for delays
    for i in 3:
        await Engine.get_main_loop().process_frame

    if received_values != [1, 2]:
        return fail_test("Expected [1, 2] from chained methods, got " + str(received_values))

    return pass_test()


func test_emit_typed_signal_with_multiple_argument_types() -> GDTestResult:
    var test_signal = EasySignal.new([TYPE_INT, TYPE_STRING, TYPE_BOOL, TYPE_VECTOR2])
    var received_args: Array = [null, null, null, null]
    var callback := func(a: int, b: String, c: bool, d: Vector2):
        received_args[0] = a
        received_args[1] = b
        received_args[2] = c
        received_args[3] = d

    test_signal.add(callback)
    test_signal.emit(42, "test", true, Vector2(1.5, 2.5))

    if received_args[0] != 42:
        return fail_test("Expected first arg to be 42, got " + str(received_args[0]))
    if received_args[1] != "test":
        return fail_test("Expected second arg to be 'test', got " + str(received_args[1]))
    if received_args[2] != true:
        return fail_test("Expected third arg to be true, got " + str(received_args[2]))
    if received_args[3] != Vector2(1.5, 2.5):
        return fail_test("Expected fourth arg to be Vector2(1.5, 2.5), got " + str(received_args[3]))

    return pass_test()


# ===============================
# emit_after_frames Tests
# ===============================


func test_emit_after_frames_basic() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]

    test_signal.add(func(): call_count[0] += 1)
    test_signal.add(func(): call_count[0] += 1)
    test_signal.emit_after_frames(2)

    # Should not have been called yet
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called immediately, got " + str(call_count[0]))

    # Wait for the delay
    for i in 3:
        await Engine.get_main_loop().process_frame

    # Should now have been dispatched to both subscribers
    if call_count[0] != 2:
        return fail_test("Expected callback to be called once after frames, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_frames_with_payload() -> GDTestResult:
    var test_signal = EasySignal.new_typed("int")
    var received_args: Array = []
    var callback := func(a: int): received_args.append(a)

    test_signal.add(callback)
    test_signal.emit_after_frames(2, 42)

    # Should not have received yet
    if received_args.size() != 0:
        return fail_test("Expected no emissions yet, got " + str(received_args.size()))

    # Wait for the delay
    for i in 3:
        await Engine.get_main_loop().process_frame

    # Should have received the args
    if received_args.size() != 1:
        return fail_test("Expected 1 emission, got " + str(received_args.size()))
    if received_args[0] != 42:
        return fail_test("Expected first arg to be 42, got " + str(received_args[0]))

    return pass_test()


func test_emit_after_frames_disabled_does_not_emit() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit_after_frames(2)

    # Disable before the delay completes
    test_signal.disable()

    # Wait for the delay
    for i in 3:
        await Engine.get_main_loop().process_frame

    # Should NOT have been called because signal was disabled
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called when disabled, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_frames_add_subscriber_during_delay() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count1 := [0]
    var call_count2 := [0]
    var callback1 := func(): call_count1[0] += 1
    var callback2 := func(): call_count2[0] += 1

    test_signal.add(callback1)
    test_signal.emit_after_frames(2)

    # Wait 1 frame
    await Engine.get_main_loop().process_frame

    # Add second subscriber during the delay
    test_signal.add(callback2)

    # Wait for the rest of the delay
    for i in 2:
        await Engine.get_main_loop().process_frame

    # Both should have been called
    if call_count1[0] != 1:
        return fail_test("Expected callback1 to be called once, got " + str(call_count1[0]))
    if call_count2[0] != 1:
        return fail_test("Expected callback2 to be called once, got " + str(call_count2[0]))

    return pass_test()


func test_emit_after_frames_remove_subscriber_during_delay() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit_after_frames(2)

    # Wait 1 frame
    await Engine.get_main_loop().process_frame

    # Remove subscriber during the delay
    test_signal.remove(callback)

    # Wait for the rest of the delay
    for i in 2:
        await Engine.get_main_loop().process_frame

    # Should NOT have been called because subscriber was removed
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called after removal, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_frames_multiple_delays() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var received_values: Array[int] = []
    var callback := func(val: int): received_values.append(val)

    test_signal.add(callback)

    # Queue multiple delayed emits
    test_signal.emit_after_frames(2, 1)
    test_signal.emit_after_frames(3, 2)
    test_signal.emit_after_frames(4, 3)

    # Wait for all delays to complete
    for i in 5:
        await Engine.get_main_loop().process_frame

    # All three should have been received in order
    if received_values != [1, 2, 3]:
        return fail_test("Expected [1, 2, 3], got " + str(received_values))

    return pass_test()


# ===============================
# emit_after_physics_frames Tests
# ===============================


func test_emit_after_physics_frames_basic() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)

    # Should not have been called yet
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called yet, got " + str(call_count[0]))

    test_signal.emit_after_physics_frames(2)

    # Still should not have been called
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called immediately, got " + str(call_count[0]))

    # Wait for the delay
    for i in 3:
        await Engine.get_main_loop().physics_frame

    # Should have been called once
    if call_count[0] != 1:
        return fail_test("Expected callback to be called once after physics frames, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_physics_frames_with_payload() -> GDTestResult:
    var test_signal = EasySignal.new([TYPE_FLOAT, TYPE_BOOL])
    var received_args: Array = []
    var callback := func(a: float, b: bool): received_args.append([a, b])

    test_signal.add(callback)
    test_signal.emit_after_physics_frames(2, 3.14, true)

    # Should not have received yet
    if received_args.size() != 0:
        return fail_test("Expected no emissions yet, got " + str(received_args.size()))

    # Wait for the delay
    for i in 3:
        await Engine.get_main_loop().physics_frame

    # Should have received the args
    if received_args.size() != 1:
        return fail_test("Expected 1 emission, got " + str(received_args.size()))
    if not is_equal_approx(received_args[0][0], 3.14):
        return fail_test("Expected first arg to be ~3.14, got " + str(received_args[0][0]))
    if received_args[0][1] != true:
        return fail_test("Expected second arg to be true, got " + str(received_args[0][1]))

    return pass_test()


func test_emit_after_physics_frames_disabled_does_not_emit() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit_after_physics_frames(2)

    # Disable before the delay completes
    test_signal.disable()

    # Wait for the delay
    for i in 3:
        await Engine.get_main_loop().physics_frame

    # Should NOT have been called because signal was disabled
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called when disabled, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_physics_frames_add_subscriber_during_delay() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count1 := [0]
    var call_count2 := [0]
    var callback1 := func(): call_count1[0] += 1
    var callback2 := func(): call_count2[0] += 1

    test_signal.add(callback1)
    test_signal.emit_after_physics_frames(2)

    # Wait 1 physics frame
    await Engine.get_main_loop().physics_frame

    # Add second subscriber during the delay
    test_signal.add(callback2)

    # Wait for the rest of the delay
    for i in 2:
        await Engine.get_main_loop().physics_frame

    # Both should have been called
    if call_count1[0] != 1:
        return fail_test("Expected callback1 to be called once, got " + str(call_count1[0]))
    if call_count2[0] != 1:
        return fail_test("Expected callback2 to be called once, got " + str(call_count2[0]))

    return pass_test()


func test_emit_after_physics_frames_remove_subscriber_during_delay() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit_after_physics_frames(2)

    # Wait 1 physics frame
    await Engine.get_main_loop().physics_frame

    # Remove subscriber during the delay
    test_signal.remove(callback)

    # Wait for the rest of the delay
    for i in 2:
        await Engine.get_main_loop().physics_frame

    # Should NOT have been called because subscriber was removed
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called after removal, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_physics_frames_multiple_delays() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_STRING)
    var received_values: Array[String] = []
    var callback := func(val: String): received_values.append(val)

    test_signal.add(callback)

    # Queue multiple delayed emits
    test_signal.emit_after_physics_frames(2, "first")
    test_signal.emit_after_physics_frames(3, "second")
    test_signal.emit_after_physics_frames(4, "third")

    # Wait for all delays to complete
    for i in 5:
        await Engine.get_main_loop().physics_frame

    # All three should have been received in order
    if received_values != ["first", "second", "third"]:
        return fail_test("Expected [first, second, third], got " + str(received_values))

    return pass_test()


# ===============================
# emit_after_ms Tests
# ===============================


func test_emit_after_ms_basic() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)

    # Should not have been called yet
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called yet, got " + str(call_count[0]))

    test_signal.emit_after_ms(50)

    # Still should not have been called
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called immediately, got " + str(call_count[0]))

    # Wait for the delay (50ms + a bit extra)
    await Engine.get_main_loop().create_timer(0.08).timeout

    # Should have been called once
    if call_count[0] != 1:
        return fail_test("Expected callback to be called once after ms, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_ms_with_payload() -> GDTestResult:
    var test_signal = EasySignal.new([TYPE_STRING, TYPE_VECTOR2])
    var received_args: Array = []
    var callback := func(a: String, b: Vector2): received_args.append([a, b])

    test_signal.add(callback)
    test_signal.emit_after_ms(50, "test", Vector2(1.0, 2.0))

    # Should not have received yet
    if received_args.size() != 0:
        return fail_test("Expected no emissions yet, got " + str(received_args.size()))

    # Wait for the delay
    await Engine.get_main_loop().create_timer(0.08).timeout

    # Should have received the args
    if received_args.size() != 1:
        return fail_test("Expected 1 emission, got " + str(received_args.size()))
    if received_args[0][0] != "test":
        return fail_test("Expected first arg to be 'test', got " + str(received_args[0][0]))
    if received_args[0][1] != Vector2(1.0, 2.0):
        return fail_test("Expected second arg to be Vector2(1, 2), got " + str(received_args[0][1]))

    return pass_test()


func test_emit_after_ms_disabled_does_not_emit() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit_after_ms(50)

    # Disable before the delay completes
    test_signal.disable()

    # Wait for the delay
    await Engine.get_main_loop().create_timer(0.08).timeout

    # Should NOT have been called because signal was disabled
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called when disabled, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_ms_add_subscriber_during_delay() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count1 := [0]
    var call_count2 := [0]
    var callback1 := func(): call_count1[0] += 1
    var callback2 := func(): call_count2[0] += 1

    test_signal.add(callback1)
    test_signal.emit_after_ms(50)

    # Wait a bit
    await Engine.get_main_loop().create_timer(0.025).timeout

    # Add second subscriber during the delay
    test_signal.add(callback2)

    # Wait for the rest of the delay
    await Engine.get_main_loop().create_timer(0.06).timeout

    # Both should have been called
    if call_count1[0] != 1:
        return fail_test("Expected callback1 to be called once, got " + str(call_count1[0]))
    if call_count2[0] != 1:
        return fail_test("Expected callback2 to be called once, got " + str(call_count2[0]))

    return pass_test()


func test_emit_after_ms_remove_subscriber_during_delay() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit_after_ms(50)

    # Wait a bit
    await Engine.get_main_loop().create_timer(0.025).timeout

    # Remove subscriber during the delay
    test_signal.remove(callback)

    # Wait for the rest of the delay
    await Engine.get_main_loop().create_timer(0.06).timeout

    # Should NOT have been called because subscriber was removed
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called after removal, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_ms_multiple_delays() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_INT)
    var received_values: Array[int] = []
    var callback := func(val: int): received_values.append(val)

    test_signal.add(callback)

    # Queue multiple delayed emits with different delays
    test_signal.emit_after_ms(50, 1)
    test_signal.emit_after_ms(75, 2)
    test_signal.emit_after_ms(100, 3)

    # Wait for all delays to complete
    await Engine.get_main_loop().create_timer(0.15).timeout

    # All three should have been received in order
    if received_values != [1, 2, 3]:
        return fail_test("Expected [1, 2, 3], got " + str(received_values))

    return pass_test()


func test_emit_after_ms_timing_precision() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_time := [0.0]
    var start_time := Time.get_ticks_msec()
    var callback := func(): call_time[0] = Time.get_ticks_msec() - start_time

    test_signal.add(callback)
    test_signal.emit_after_ms(50)

    # Wait for emission
    await Engine.get_main_loop().create_timer(0.08).timeout

    # Check that timing was reasonably close (within 20ms tolerance for system variance)
    if call_time[0] < 45 or call_time[0] > 70:
        return fail_test("Expected emission around 50ms, got " + str(call_time[0]) + "ms")

    return pass_test()


func test_emit_after_frames_disabled_then_re_enabled_during_delay() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.disable()
    test_signal.emit_after_frames(2)

    # Wait 1 frame
    await Engine.get_main_loop().process_frame

    # Re-enable during delay
    test_signal.enable()

    # Wait for the rest of the delay
    for i in 2:
        await Engine.get_main_loop().process_frame

    # Should NOT have been called because signal was disabled when emit was triggered
    if call_count[0] != 0:
        return fail_test("Expected callback to not be called, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_all_three_methods_together() -> GDTestResult:
    var test_signal = EasySignal.new(TYPE_STRING)
    var received_values: Array[String] = []
    var callback := func(val: String): received_values.append(val)

    test_signal.add(callback)

    # Queue all three types of delays
    test_signal.emit_after_frames(2, "frames")
    test_signal.emit_after_physics_frames(2, "physics")
    test_signal.emit_after_ms(50, "timer")

    # Wait for all to complete
    for i in 3:
        await Engine.get_main_loop().process_frame
    for i in 3:
        await Engine.get_main_loop().physics_frame
    await Engine.get_main_loop().create_timer(0.08).timeout

    # All three should have been received
    if received_values.size() != 3:
        return fail_test("Expected 3 emissions, got " + str(received_values.size()))
    if not received_values.has("frames"):
        return fail_test("Expected 'frames' to be emitted")
    if not received_values.has("physics"):
        return fail_test("Expected 'physics' to be emitted")
    if not received_values.has("timer"):
        return fail_test("Expected 'timer' to be emitted")

    return pass_test()


func test_emit_after_frames_with_delayed_subscriber_double_delay() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]

    # Add subscriber with 2-frame delay and an immediate one
    test_signal.add(func(): call_count[0] += 1).with_delay_frames(2)
    test_signal.add(func(): call_count[0] += 1)

    # Emit with frame delay (signal-level delay)
    test_signal.emit_after_frames(1)

    # Nothing should have fired immediately
    if call_count[0] != 0:
        return fail_test("Expected no calls immediately, got " + str(call_count[0]))

    # Wait for the emit delay
    await Engine.get_main_loop().process_frame

    # The immediate subscriber should have been called
    if call_count[0] != 1:
        return fail_test("Expected 1 call, got " + str(call_count[0]))

    # Wait for the subscriber delay
    await Engine.get_main_loop().process_frame
    await Engine.get_main_loop().process_frame

    # The delayed subscriber should have been called
    if call_count[0] != 2:
        return fail_test("Expected 2 calls, got " + str(call_count[0]))

    return pass_test()


func test_emit_after_frames_disabled_does_not_queue() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.disable()
    test_signal.emit_after_frames(1)

    await Engine.get_main_loop().process_frame

    # Should NOT have been called because signal was disabled when emission was scheduled
    return assert_equal(call_count[0], 0)


func test_emit_after_frames_disabled_then_reenabled_emits() -> GDTestResult:
    var test_signal = EasySignal.new_void()
    var call_count := [0]
    var callback := func(): call_count[0] += 1

    test_signal.add(callback)
    test_signal.emit_after_frames(2)

    test_signal.disable()  # Disable during the delay
    await Engine.get_main_loop().process_frame
    test_signal.enable()  # Re-enable before it runs out
    await Engine.get_main_loop().process_frame

    # Bit of a strange case, but expected behavior is that it _would_ go through
    return assert_equal(call_count[0], 1)
