package test

import (
	"github.com/DinoInc/BaseService"
	"github.com/DinoInc/BaseService/domain"
	"testing"
)

func TestFindPersonByIdentifierNotFound(t *testing.T) {

	service := BaseService.NewBaseService(testServerEndpoint)
	identifier := domain.NewIdentifier()

	identifier.System = new(string)
	*identifier.System = "urn:oid:0.0.00.000.000.000.0.0"
	identifier.Value = new(string)
	*identifier.Value = "12345"

	res, err := service.FindPersonByIdentifier(identifier)

	AssertNil(t, "FindPersonByIdentifier on NotFound", "err", err)
	AssertNotNil(t, "FindPersonByIdentifier on NotFound", "res", res)

	if len(res) > 0 {
		t.Error("FindPersonByIdentifier on NotFound len(res) not zero")
	}

}

func TestFindPersonByIdentifierFound(t *testing.T) {

	service := BaseService.NewBaseService(testServerEndpoint)
	identifier := domain.NewIdentifier()

	identifier.System = new(string)
	*identifier.System = "urn:oid:1.2.36.146.595.217.0.1"
	identifier.Value = new(string)
	*identifier.Value = "3301222110950005"

	res, err := service.FindPersonByIdentifier(identifier)

	AssertNil(t, "FindPersonByIdentifier on Similar", "err", err)
	AssertNotNil(t, "FindPersonByIdentifier on Similar", "res", res)

	var found = false
	var i = 0

	for !found && i < len(res) {
		found = (*(res[i].ID) == "59cb80e4fad1c100018960dc")
		i++
	}

	if !found {
		t.Error("FindPersonByIdentifier on Similar, expected res.ID is not found")
	}
}

func TestFindPersonByIdentifierValue(t *testing.T) {

	service := BaseService.NewBaseService(testServerEndpoint)
	identifier := domain.NewIdentifier()

	identifier.Value = new(string)
	*identifier.Value = "3301222110950005	"

	res, err := service.FindPersonByIdentifier(identifier)

	AssertNil(t, "FindPersonByIdentifier on Exact", "err", err)
	AssertNotNil(t, "FindPersonByIdentifier on Exact", "res", res)

	var found = false
	var i = 0

	for !found && i < len(res) {
		found = (*(res[i].ID) == "59cb80e4fad1c100018960dc")
		i++
	}

	if !found {
		t.Error("FindPersonByIdentifier on Exact, expected res.ID is not found")
	}
}

func TestFindPersonByIdentifierSystem(t *testing.T) {

	service := BaseService.NewBaseService(testServerEndpoint)
	identifier := domain.NewIdentifier()

	identifier.System = new(string)
	*identifier.System = "urn:oid:1.2.36.146.595.217.0.1"

	res, err := service.FindPersonByIdentifier(identifier)

	AssertNotNil(t, "FindPersonByIdentifier on System", "err", err)
	AssertNil(t, "FindPersonByIdentifier on System", "res", res)
}
