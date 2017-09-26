package test

import "testing"
import "github.com/DinoInc/BaseService"

func TestFindPatientByIdNotFound(t *testing.T) {
	service := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	res, err := service.FindPatientById("000000000000000000000000")

	AssertNotNil(t, "FindPatientById on NotFound", "err", err)
	AssertNil(t, "FindPatientById on NotFound", "res", res)
	AssertCode(t, "FindPatientById on NotFound", err, 404)

}

func TestFindPatientByIdFound(t *testing.T) {
	service := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	res, err := service.FindPatientById("59b651e4fad1c1000179717c")

	AssertNil(t, "FindPatientById on Found", "err", err)
	AssertNotNil(t, "FindPatientById on Found", "res", res)

	if *(res.ID) != "59b651e4fad1c1000179717c" {
		t.Error("FindPatientById on Found res.ID is not equal")
	}
}
