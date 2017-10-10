package test

import (
	"github.com/DinoInc/BaseService"
	"github.com/DinoInc/BaseService/domain"
	"testing"
)

func TestAddPatientEmpty(t *testing.T) {
	service := BaseService.NewBaseService(testServerEndpoint)
	patient1, err := service.AddPatient(nil)

	AssertNotNil(t, "AddPatient on Empty", "patient", patient1)
	AssertNil(t, "AddPatient on Empty", "err", err)

	if patient1 != nil {
		patient2, err := service.FindPatientById(patient1.GetID())

		if err.(BaseService.Error).Code == 404 {
			t.Error("AddPatient on Empty remote object not found")
		}

		AssertEqual(t, "AddPatient on Empty", "patient", patient1, patient2)
	}
}

func TestAddPatientIdentifierRecognizedInPatient(t *testing.T) {
	service := BaseService.NewBaseService(testServerEndpoint)

	system := "urn:oid:1.2.36.146.595.217.0.1"
	value := "12345"

	identifier := &domain.Identifier{
		System: &system,
		Value:  &value,
	}

	patient1, err := service.AddPatient(&domain.Patient{
		Identifier: []*domain.Identifier{identifier},
	})

	AssertNotNil(t, "AddPatient on RecognizedInPatient", "patient", patient1)
	AssertNil(t, "AddPatient on RecognizedInPatient", "err", err)

	if patient1 != nil {
		patient2, err := service.FindPatientById("59b651e4fad1c1000179717c")

		if err.(BaseService.Error).Code == 404 {
			t.Error("AddPatient on RecognizedInPatient remote object not found")
		}

		AssertEqual(t, "AddPatient on RecognizedInPatient", "patient.ID", patient1.ID, patient2.ID)
	}
}

func TestAddPatientIdentifierRecognizedInPersonLinked(t *testing.T) {
	service := BaseService.NewBaseService(testServerEndpoint)

	system := "urn:oid:1.2.36.146.595.217.0.1"
	value := "12345"

	identifier := &domain.Identifier{
		System: &system,
		Value:  &value,
	}

	patient1, err := service.AddPatient(&domain.Patient{
		Identifier: []*domain.Identifier{identifier},
	})

	AssertNotNil(t, "AddPatient on RecognizedInPatient", "patient", patient1)
	AssertNil(t, "AddPatient on RecognizedInPatient", "err", err)

	if patient1 != nil {
		patient2, err := service.FindPatientById("59b651e4fad1c1000179717c")

		if err.(BaseService.Error).Code == 404 {
			t.Error("AddPatient on RecognizedInPatient remote object not found")
		}

		AssertEqual(t, "AddPatient on RecognizedInPatient", "patient.ID", patient1.ID, patient2.ID)
	}
}

func TestAddPatientIdentifierRecognizedInPersonNotLinked(t *testing.T) {

}

func TestAddPatientWithoutIdentifier(t *testing.T) {

}

func TestAddPatientSingleProperty(t *testing.T) {

}
