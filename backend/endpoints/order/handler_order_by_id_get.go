package order

import (
	"chuukohin/database"
	"chuukohin/models"
	"chuukohin/types/model_shop"
	"chuukohin/types/responder"
	"encoding/json"
	"github.com/gofiber/fiber/v2"
	"strconv"
)

// OrderByIdGetHandler
// @ID           order.by_id.get
// @Summary      Get order detail by order_id
// @Description  Get order detail by order_id
// @Tags         order
// @Accept       json
// @Produce      json
// @Success      200  {object}  order.orderByIdResponse
// @Failure      400  {object}  responder.ErrorResponse
// @Router       /order/detail/{order_id} [get]
func OrderByIdGetHandler(c *fiber.Ctx) error {
	// * Query
	orderId, _ := strconv.ParseUint(c.Params("order_id"), 10, 64)

	// * Fetch order detail
	var orderDetails *models.OrderDetail
	if result := database.Gorm.Preload("Order.User.Address").First(&orderDetails, "order_id = ?", orderId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to fetch the order detail",
			Err:     result.Error,
		}
	}

	// * Convert type
	m := string(*orderDetails.Details)
	orderDetailDetails := new(model_shop.OrderDetail)
	err := json.Unmarshal([]byte(m), orderDetailDetails)
	if err != nil {
		return &responder.GenericError{
			Message: "Unable to unmarshal json",
			Err:     err,
		}
	}

	// * Fetch product
	var productDetail *models.Product
	if result := database.Gorm.Preload("Picture").First(&productDetail, "id = ?", orderDetails.Order.ProductId); result.Error != nil {
		return &responder.GenericError{
			Message: "Unable to fetch the product",
			Err:     result.Error,
		}
	}

	customerName := *orderDetails.Order.User.Firstname + " " + *orderDetails.Order.User.Lastname
	var tempTrackingOrder []*trackingOrderStatus
	for _, status := range orderDetailDetails.Status {
		tempTrackingOrder = append(tempTrackingOrder, &trackingOrderStatus{
			Status:      status.Status,
			Time:        status.Time,
			Description: status.Description,
		})
	}

	return c.JSON(responder.NewInfoResponse(&orderByIdResponse{
		Product: &product{
			Id:         productDetail.Id,
			Name:       productDetail.Name,
			Brand:      productDetail.Brand,
			Price:      productDetail.Price,
			PictureUrl: productDetail.Picture.PictureUrl,
		},
		Address: &address{
			Id:           orderDetails.Order.User.Address.Id,
			Name:         orderDetails.Order.User.Address.Name,
			Phone:        orderDetails.Order.User.Address.Phone,
			AddressLine1: orderDetails.Order.User.Address.AddressLine1,
			AddressLine2: orderDetails.Order.User.Address.AddressLine2,
			Province:     orderDetails.Order.User.Address.Province,
			District:     orderDetails.Order.User.Address.District,
			SubDistrict:  orderDetails.Order.User.Address.SubDistrict,
			PostalCode:   orderDetails.Order.User.Address.PostalCode,
		},
		OrderDetail: &orderDetail{
			OrderId:      orderDetails.OrderId,
			OrderTime:    orderDetails.Order.OrderTime,
			CustomerName: &customerName,
			Price:        orderDetails.Order.Price,
		},
		DeliveryInfo: &deliveryInformation{
			TrackingNumber: orderDetails.TrackingNo,
		},
		TrackingOrder: &trackingOrder{
			ProductId:      productDetail.Id,
			TrackingNumber: orderDetails.TrackingNo,
			Status:         tempTrackingOrder,
		},
	}))
}
