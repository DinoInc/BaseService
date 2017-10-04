package BaseService

import (
	"encoding/json"
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
)
import (
	"github.com/DinoInc/BaseService/domain"
)

var _ = fmt.Println

type PersonEntry struct {
	Resources *domain.Person `json:"resource"`
}

func readPersonBundle(responseBody io.Reader) ([]*domain.Person, error) {

	bundle, err := readBundle(responseBody)
	if err != nil {
		return nil, err
	}

	result := []*domain.Person{}

	if bundle.Entry == nil {
		return result, nil
	}

	for _, entry := range bundle.Entry {

		personEntry := &PersonEntry{}
		json.Unmarshal(*entry, personEntry)

		result = append(result, personEntry.Resources)

	}

	return result, nil
}

func readPerson(responseBody io.Reader) (*domain.Person, error) {
	body, err := ioutil.ReadAll(responseBody)

	if err != nil {
		return nil, NewError(500, "FHIR server send not readable response body")
	}

	var person domain.Person
	json.Unmarshal(body, &person)

	return &person, nil
}

// Function to find Patient using identifier of Person object
//
// Parameters:
//  - Identifier
func (s *BaseService) FindPersonByIdentifier(identifier *domain.Identifier) (r []*domain.Person, err error) {
	var searchParam string
	if identifier.Value != nil && identifier.System != nil {
		searchParam = *identifier.System + "|" + *identifier.Value
	} else if identifier.Value != nil {
		searchParam = *identifier.Value
	} else {
		return nil, NewError(400, "FindPatientByIdentifier must have identifier.Value")
	}

	res, err := http.Get(s.endpoint + "/Person/?identifier=" + searchParam)

	if err != nil {
		return nil, NewError(408, "FHIR Request time out.")
	}

	if res.StatusCode == 200 {
		return readPersonBundle(res.Body)
	}

	return nil, NewError(res.StatusCode, "")
}

// Function to find Person using id on his/her Person object
//
// Parameters:
//  - ID
func (s *BaseService) FindPersonById(id string) (r *domain.Person, err error) {
	res, err := http.Get(s.endpoint + "/Person/" + id)

	if err != nil {
		return nil, NewError(408, "FHIR Request time out.")
	}

	if res.StatusCode == 200 {
		return readPerson(res.Body)
	}

	return nil, NewError(res.StatusCode, "")
}

// Function to find Person using HumanName on his/her Person object
//
// Parameters:
//  - Name
func (s *BaseService) FindPersonByName(name string) (r []*domain.Person, err error) {
	return nil, nil
}
