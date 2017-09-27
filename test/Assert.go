package test

import "testing"
import "strconv"
import "reflect"
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
