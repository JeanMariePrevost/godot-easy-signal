extends TestFile

# ===============================
# Initialization Tests
# ===============================


func test_new_typed_single_type() -> TestResult:
    var test_signal = BetterSignal.new_typed(["int"])

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
    var test_signal = BetterSignal.new_typed(["int", "float", "String"])

    if test_signal.get_argument_count() != 3:
        return fail_test("Expected argument count to be 3, got " + str(test_signal.get_argument_count()))
    if test_signal.get_argument_types() != ["int", "float", "String"]:
        return fail_test("Expected argument types to be ['int', 'float', 'String'], got " + str(test_signal.get_argument_types()))
    if test_signal.get_is_variant():
        return fail_test("Expected signal to not be variant")
    if test_signal.get_is_void():
        return fail_test("Expected signal to not be void")

    return pass_test()


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
