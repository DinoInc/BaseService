package test

import "testing"
import "strconv"
import "reflect"
import "github.com/DinoInc/BaseService"

// reference: https://github.com/stretchr/testify
func IsNil(input interface{}) bool {

	if input == nil {
		return true
	}

	value := reflect.ValueOf(input)
	kind := value.Kind()

	// Is a [Chan, Func, Interface, Map, Ptr, Slice] and (reflect.Value).IsNil()
	return (kind >= reflect.Chan && kind <= reflect.Slice) && value.IsNil()

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
	var errorCode = err.(BaseService.Error).Code
	if errorCode != expectedCode {
		t.Error(testName + ", err.Code = " + strconv.Itoa(errorCode) + " not match, expected = " + strconv.Itoa(expectedCode))
	}
}
