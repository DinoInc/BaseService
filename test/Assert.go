package test

import "testing"
import "strconv"
import "github.com/DinoInc/BaseService"

func AssertNil(t *testing.T, testName string, varName string, input interface{}){
	if input != nil {
		t.Error(testName + ", " + varName + " is not nil")
	}
}

func AssertNotNil(t *testing.T, testName string, varName string, input interface{}){
	if input == nil {
		t.Error(testName + ", " + varName + " is not nil")
	}
}

func AssertCode(t *testing.T, testName string, err error, expectedCode int){
	var errorCode = err.(BaseService.Error).Code
	if  errorCode != expectedCode {
		t.Error(testName + ", err.Code = "+ strconv.Itoa(errorCode) +" not match, expected = "+ strconv.Itoa(expectedCode))
	}
}