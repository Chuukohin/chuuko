package enum

type DeliveryStatus string

const (
	SentRequest     DeliveryStatus = "Request has sent"
	ReceivedPackage DeliveryStatus = "Received the package"
	Delivering      DeliveryStatus = "Delivering"
	Success         DeliveryStatus = "Success"
)
