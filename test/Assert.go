package test

import "testing"

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