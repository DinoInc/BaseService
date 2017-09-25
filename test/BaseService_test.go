package test

import (
	"github.com/DinoInc/BaseService"
	"testing"
)

func TestFindPatientByIdNotFound(*testing.T){

}

func TestFindPatientByIdFound(*testing.T){
	handler := BaseService.NewBaseService("http://server.ibrohim.me:3001")
	handler.FindPatientById("59b651e4fad1c1000179717c")
}