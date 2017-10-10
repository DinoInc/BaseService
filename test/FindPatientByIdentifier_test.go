package test

import (
	"github.com/DinoInc/BaseService"
	"github.com/DinoInc/BaseService/domain"
	"testing"
)

func TestFindPatientByIdentifierNotFound(t *testing.T) {

	service := BaseService.NewBaseService(testServerEndpoint)
	identifier := domain.NewIdentifier()

	identifier.System = new(string)
	*identifier.System = "urn:oid:0.0.00.000.000.000.0.0"
	identifier.Value = new(string)
	*identifier.Value = "12345"

	res, err := service.FindPatientByIdentifier(identifier)

	AssertNil(t, "FindPatientByIdentifier on NotFound", "err", err)
	AssertNotNil(t, "FindPatientByIdentifier on NotFound", "res", res)

	if len(res) > 0 {
		t.Error("FindPatientByIdentifier on NotFound len(res) not zero")
	}

}

func TestFindPatientByIdentifierFound(t *testing.T) {

	service := BaseService.NewBaseService(testServerEndpoint)
	identifier := domain.NewIdentifier()

	identifier.System = new(string)
	*identifier.System = "urn:oid:1.2.36.146.595.217.0.1"
	identifier.Value = new(string)
	*identifier.Value = "12345"

	res, err := service.FindPatientByIdentifier(identifier)

	AssertNil(t, "FindPatientByIdentifier on Similar", "err", err)
	AssertNotNil(t, "FindPatientByIdentifier on Similar", "res", res)

	var found = false
	var i = 0

	for !found && i < len(res) {
		found = (*(res[i].ID) == "59b651e4fad1c1000179717c")
		i++
	}

	if !found {
		t.Error("FindPatientByIdentifier on Similar, expected res.ID is not found")
	}
}

func TestFindPatientByIdentifierValue(t *testing.T) {

	service := BaseService.NewBaseService(testServerEndpoint)
	identifier := domain.NewIdentifier()

	identifier.Value = new(string)
	*identifier.Value = "12345"

	res, err := service.FindPatientByIdentifier(identifier)

	AssertNil(t, "FindPatientByIdentifier on Exact", "err", err)
	AssertNotNil(t, "FindPatientByIdentifier on Exact", "res", res)

	var found = false
	var i = 0

	for !found && i < len(res) {
		found = (*(res[i].ID) == "59b651e4fad1c1000179717c")
		i++
	}

	if !found {
		t.Error("FindPatientByIdentifier on Exact, expected res.ID is not found")
	}
}

func TestFindPatientByIdentifierSystem(t *testing.T) {

	service := BaseService.NewBaseService(testServerEndpoint)
	identifier := domain.NewIdentifier()

	identifier.System = new(string)
	*identifier.System = "urn:oid:1.2.36.146.595.217.0.1"

	res, err := service.FindPatientByIdentifier(identifier)

	AssertNotNil(t, "FindPatientByIdentifier on System", "err", err)
	AssertNil(t, "FindPatientByIdentifier on System", "res", res)
}
