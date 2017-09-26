package test

import "testing"
import "github.com/DinoInc/BaseService"

func TestFindPatientByNameNotFound(t *testing.T) {
	service := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	res, err := service.FindPatientByName("Upin")

	AssertNil(t, "FindPatientByName on NotFound", "err", err)
	AssertNotNil(t, "FindPatientByName on NotFound", "res", res)

	if len(res) > 0 {
		t.Error("FindPatientByName on NotFound len(res) not zero")
	}

}

func TestFindPatientByNameSimilar(t *testing.T) {
	service := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	res, err := service.FindPatientByName("Jim")

	AssertNil(t, "FindPatientByName on Similar", "err", err)
	AssertNotNil(t, "FindPatientByName on Similar", "res", res)

	var found = false
	var i = 0

	for !found && i < len(res) {
		found = (*(res[i].ID) == "59b651e4fad1c1000179717c")
		i++
	}

	if !found {
		t.Error("FindPatientByName on Similar, expected res.ID is not found")
	}
}

func TestFindPatientByNameExact(t *testing.T) {
	service := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	res, err := service.FindPatientByName("Peter James")

	AssertNil(t, "FindPatientByName on Exact", "err", err)
	AssertNotNil(t, "FindPatientByName on Exact", "res", res)

	var found = false
	var i = 0

	for !found && i < len(res) {
		found = (*(res[i].ID) == "59b651e4fad1c1000179717c")
		i++
	}

	if !found {
		t.Error("FindPatientByName on Exact, expected res.ID is not found")
	}
}
