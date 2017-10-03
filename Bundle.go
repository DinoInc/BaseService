package BaseService

import (
	"encoding/json"
	"io"
	"io/ioutil"
)

type ResourceBundle struct {
	Entry []*json.RawMessage `json:"entry,omitempty"`
}

func readBundle(responseBody io.Reader) (*ResourceBundle, error) {
	body, err := ioutil.ReadAll(responseBody)

	if err != nil {
		return nil, NewError(500, "FHIR server send not readable response body")
	}

	bundle := &ResourceBundle{}
	json.Unmarshal(body, bundle)

	return bundle, nil
}
