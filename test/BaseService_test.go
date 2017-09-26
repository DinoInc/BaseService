package test

import (
	"github.com/DinoInc/BaseService"
	"testing"
)

func TestFindPatientByIdNotFound(t *testing.T) {
	handler := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	res, err := handler.FindPatientById("000000000000000000000000")

	if err == nil {
		t.Error("FindPatientById on NotFound err nil")
	}

	if res != nil {
		t.Error("FindPatientById on NotFound res not nil")
	}

	if err.(BaseService.Error).Code != 404 {
		t.Error("FindPatientById on NotFound wrong error code")
	}

}

func TestFindPatientByIdFound(t *testing.T) {
	handler := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	res, err := handler.FindPatientById("59b651e4fad1c1000179717c")

	if err != nil {
		t.Error("FindPatientById on Found err not nil")
	}

	if res == nil {
		t.Error("FindPatientById on Found res nil")
	}

	if *(res.ID) != "59b651e4fad1c1000179717c" {
		t.Error("FindPatientById on Found res.ID is not equal")
	}
}
