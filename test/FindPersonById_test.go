package test

import "testing"
import "github.com/DinoInc/BaseService"

func TestFindPersonByIdNotFound(t *testing.T) {
	service := BaseService.NewBaseService(testServerEndpoint)
	res, err := service.FindPersonById("000000000000000000000000")

	AssertNotNil(t, "FindPersonById on NotFound", "err", err)
	AssertNil(t, "FindPersonById on NotFound", "res", res)
	AssertCode(t, "FindPersonById on NotFound", err, 404)

}

func TestFindPersonByIdFound(t *testing.T) {
	service := BaseService.NewBaseService(testServerEndpoint)
	res, err := service.FindPersonById("59cb80e4fad1c100018960dc")

	AssertNil(t, "FindPersonById on Found", "err", err)
	AssertNotNil(t, "FindPersonById on Found", "res", res)

	if res != nil && *(res.ID) != "59cb80e4fad1c100018960dc" {
		t.Error("FindPersonById on Found res.ID is not equal")
	}
}
