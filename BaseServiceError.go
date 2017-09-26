package BaseService

type Error struct {
	errorMessage string
	Code         int
}

func (e Error) Error() string {
	return e.errorMessage
}

func NewError(code int, msg string) Error {
	return Error{Code: code, errorMessage: msg}
}
