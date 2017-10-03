package test

import (
	"testing"
	"github.com/DinoInc/BaseService/domain"
	"github.com/DinoInc/BaseService"
)

func TestFindPatientByIdentifierNotFound(t *testing.T) {

	service := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	identifier := domain.NewIdentifier()
	identifier.System = domain.NewURI()
  	identifier.System.Value = domain.NewUnspecifiedType()
  	identifier.System.Value.BaseObjectType = "urn:oid:0.0.00.000.000.000.0.0"
  	identifierValue := "12345"
  	identifier.Value = &identifierValue
	
	res, err := service.FindPatientByIdentifier(identifier)

	AssertNil(t, "FindPatientByIdentifier on NotFound", "err", err)
	AssertNotNil(t, "FindPatientByIdentifier on NotFound", "res", res)

	if len(res) > 0 {
		t.Error("FindPatientByIdentifier on NotFound len(res) not zero")
	}

}

func TestFindPatientByIdentifierFound(t *testing.T) {

	service := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	identifier := domain.NewIdentifier()

	identifier.System = domain.NewURI()
  	identifier.System.Value = domain.NewUnspecifiedType()
  	identifier.System.Value.BaseObjectType = "urn:oid:1.2.36.146.595.217.0.1"

  	identifierValue := "12345"
  	identifier.Value = &identifierValue
  	
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

	service := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	identifier := domain.NewIdentifier()

  	identifierValue := "12345"
  	identifier.Value = &identifierValue

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

	service := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	identifier := domain.NewIdentifier()
	
  	identifier.System = domain.NewURI()
  	identifier.System.Value = domain.NewUnspecifiedType()
  	identifier.System.Value.BaseObjectType = "urn:oid:1.2.36.146.595.217.0.1"

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
