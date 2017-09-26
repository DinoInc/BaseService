package test

import "testing"
import "strconv"
import "reflect"
import "github.com/DinoInc/BaseService"

func IsPointer(input interface{}) bool {
	return reflect.ValueOf(input).Kind() == reflect.Ptr
}

func IsPointerNil(input interface{}) bool {
	return reflect.ValueOf(input).IsNil()
}

func AssertNil(t *testing.T, testName string, varName string, input interface{}) {
	isPointer := IsPointer(input)

	if isPointer && !IsPointerNil(input) {
		t.Error(testName + ", " + varName + " is not nil")
	} else if !isPointer && input != nil {
		t.Error(testName + ", " + varName + " is not nil")
	}
}

func AssertNotNil(t *testing.T, testName string, varName string, input interface{}) {
	isPointer := IsPointer(input)

	if isPointer && IsPointerNil(input) {
		t.Error(testName + ", " + varName + " is nil")
	} else if !isPointer && input == nil {
		t.Error(testName + ", " + varName + " is nil")
	}

}

func AssertCode(t *testing.T, testName string, err error, expectedCode int) {
	var errorCode = err.(BaseService.Error).Code
	if errorCode != expectedCode {
		t.Error(testName + ", err.Code = " + strconv.Itoa(errorCode) + " not match, expected = " + strconv.Itoa(expectedCode))
	}
}
