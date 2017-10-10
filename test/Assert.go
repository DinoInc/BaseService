package test

import "testing"
import "strconv"
import "reflect"
import "bytes"
import "github.com/DinoInc/BaseService"

var ReflectNullable = []reflect.Kind{
	reflect.Chan,
	reflect.Func,
	reflect.Interface,
	reflect.Map,
	reflect.Ptr,
	reflect.Slice,
}

func IsNullable(input reflect.Kind) bool {

	kind := input

	for _, nullableKind := range ReflectNullable {
		if kind == nullableKind {
			return true
		}
	}

	return false
}

// reference: https://github.com/stretchr/testify
func IsNil(input interface{}) bool {

	value := reflect.ValueOf(input)
	return input == nil || (IsNullable(value.Kind()) && value.IsNil())
}

func AssertNil(t *testing.T, testName string, varName string, input interface{}) {

	if !IsNil(input) {
		t.Error(testName + ", " + varName + " is not nil")
	}
}

func AssertNotNil(t *testing.T, testName string, varName string, input interface{}) {

	if IsNil(input) {
		t.Error(testName + ", " + varName + " is nil")
	}

}

func AssertCode(t *testing.T, testName string, err error, expectedCode int) {

	baseServiceError, isBaseServiceError := err.(BaseService.Error)

	if !isBaseServiceError {
		t.Error(testName + ", err expected to be a BaseService.Error")
	}

	if isBaseServiceError && baseServiceError.Code != expectedCode {
		t.Error(testName + ", err.Code = " + strconv.Itoa(baseServiceError.Code) + " not match, expected = " + strconv.Itoa(expectedCode))
	}
}

// objectsAreEqual determines if two objects are considered equal.
//
// This function does no assertion of any kind.
func objectsAreEqual(expected, actual interface{}) bool {

	if expected == nil || actual == nil {
		return expected == actual
	}
	if exp, ok := expected.([]byte); ok {
		act, ok := actual.([]byte)
		if !ok {
			return false
		} else if exp == nil || act == nil {
			return exp == nil && act == nil
		}
		return bytes.Equal(exp, act)
	}
	return reflect.DeepEqual(expected, actual)

}

// objectsAreEqualValues gets whether two objects are equal, or if their
// values are equal.
func objectsAreEqualValues(expected, actual interface{}) bool {
	if objectsAreEqual(expected, actual) {
		return true
	}

	actualType := reflect.TypeOf(actual)
	if actualType == nil {
		return false
	}
	expectedValue := reflect.ValueOf(expected)
	if expectedValue.IsValid() && expectedValue.Type().ConvertibleTo(actualType) {
		// Attempt comparison after type conversion
		return reflect.DeepEqual(expectedValue.Convert(actualType).Interface(), actual)
	}

	return false
}

func AssertEqual(t *testing.T, testName string, varName string, input interface{}, expectedValue interface{}) {

	if !objectsAreEqualValues(expectedValue, input) {
		t.Error(testName + " " + varName + " not match")
	}

}
