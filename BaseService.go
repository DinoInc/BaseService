package BaseService

type BaseService struct {
	endpoint string
}

func NewBaseService(endpoint string) *BaseService {
	return &BaseService{endpoint: endpoint}
}
