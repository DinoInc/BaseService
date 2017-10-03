package BaseService

import (
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"strings"
)
import (
	"github.com/DinoInc/BaseService/contract"
	"github.com/DinoInc/BaseService/domain"
)

var _ = fmt.Println

type BaseService struct {
	endpoint string
}

type PatientEntry struct {
	Resources *domain.Patient `json:"resource"`
}

type ResourceBundle struct {
	Entry []*json.RawMessage `json:"entry,omitempty"`
}

func NewBaseService(endpoint string) *BaseService {
	return &BaseService{endpoint: endpoint}
}

func readPatientBundle(responseBody io.Reader) ([]*domain.Patient, error) {

	body, err := ioutil.ReadAll(responseBody)

	if err != nil {
		return nil, NewError(500, "FHIR server send not readable response body")
	}

	bundle := &ResourceBundle{}
	json.Unmarshal(body, bundle)

	result := []*domain.Patient{}

	if bundle.Entry == nil {
		return result, nil
	}

	for _, entry := range bundle.Entry {

		patientEntry := &PatientEntry{}
		json.Unmarshal(*entry, patientEntry)

		result = append(result, patientEntry.Resources)

	}

	return result, nil
}

func readPatient(responseBody io.Reader) (*domain.Patient, error) {
	body, err := ioutil.ReadAll(responseBody)

	if err != nil {
		return nil, NewError(500, "FHIR server send not readable response body")
	}

	var patient domain.Patient
	json.Unmarshal(body, &patient)

	return &patient, nil
}

//
// This function is used, for example in "Front Office" want to register a new patient.
// The new patient will get a new Medical Record (MR) identifier linked to his/her Person
// object that also linked to his/her Patient object.
//
// issue MR: by default is [TRUE]
// [FALSE IF] when in emergency situation such as "IGD".The person will not get a new
// Medical Record number because of lack of patient data and could not confirm whether
// the patient has been registered on hospital or not. New Patient object will be created
// without any Person object linked.
//
//
// Parameters:
//  - Identifier
//  - Name
//  - Contact
//  - Gender
//  - BirthDate
//  - Address
//  - IssueMR
func (s *BaseService) AddPatient(identifier []*domain.Identifier, name []*domain.HumanName, contact []*domain.ContactPoint, gender domain.EnumPatientGender, birthDate int32, address []*domain.Address, issueMR bool) (*contract.ReturnType, error) {
	return nil, nil
}

// Function to find Patient using identifier on his/her linked Person object
//
// Parameters:
//  - Identifier
func (s *BaseService) FindPatientByIdentifier(identifier *domain.Identifier) ([]*domain.Patient, error) {

	var searchParam string
	if identifier.Value != nil && identifier.System != nil {
		searchParam = *identifier.System + "|" + *identifier.Value
	} else if identifier.Value != nil {
		searchParam = *identifier.Value
	} else {
		return nil, NewError(400, "FindPatientByIdentifier must have identifier.Value")
	}

	res, err := http.Get(s.endpoint + "/Patient/?identifier=" + searchParam)

	if err != nil {
		return nil, NewError(408, "FHIR Request time out.")
	}

	if res.StatusCode == 200 {
		return readPatientBundle(res.Body)
	}

	return nil, NewError(res.StatusCode, "")

}

// Function to find Patient using id on his/her Patient object
//
// Parameters:
//  - Id
func (s *BaseService) FindPatientById(id string) (r *domain.Patient, err error) {
	res, err := http.Get(s.endpoint + "/Patient/" + id)

	if err != nil {
		return nil, NewError(408, "FHIR Request time out.")
	}

	if res.StatusCode == 200 {
		return readPatient(res.Body)
	}

	return nil, NewError(res.StatusCode, "")

}

// Function to find Patient using HumanName on his/her Patient object
//
// Parameters:
//  - Name
func (s *BaseService) FindPatientByName(name string) (r []*domain.Patient, err error) {

	searchParam := strings.Replace(name, " ", ",", -1)
	res, err := http.Get(s.endpoint + "/Patient?name=" + searchParam)

	if err != nil {
		return nil, NewError(408, "FHIR Request time out.")
	}

	if res.StatusCode == 200 {
		return readPatientBundle(res.Body)
	}

	return nil, NewError(res.StatusCode, "")
}
