package BaseService

type ErrorType struct {
	errorMessage string
	Code int
}

func(e ErrorType) Error() string {
	return e.errorMessage
}

func NewError(code int, msg string) ErrorType {
	return ErrorType{Code: code, errorMessage: msg}
}