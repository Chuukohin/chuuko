import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/models/response/home/home_product_response.dart';
import 'package:chuukohin/models/response/me/address/address_response.dart';
import 'package:chuukohin/models/response/me/card/card_response.dart';
import 'package:chuukohin/models/response/me/income/income_response.dart';
import 'package:chuukohin/models/response/me/me_response.dart';
import 'package:chuukohin/models/response/me/my_shop/my_shop_response.dart';
import 'package:chuukohin/models/response/me/order_report/order_report.dart';
import 'package:chuukohin/models/response/me/order_status/order_status_response.dart';
import 'package:chuukohin/models/response/me/product_management/product_management_response.dart';
import 'package:chuukohin/models/response/order/order_detail_response.dart';
import 'package:chuukohin/models/response/product/product_detail_response.dart';
import 'package:chuukohin/models/response/product/product_info.dart';
import 'package:chuukohin/services/home/home_product.dart';
import 'package:chuukohin/services/me/address.dart';
import 'package:chuukohin/services/me/income.dart';
import 'package:chuukohin/services/me/me.dart';
import 'package:chuukohin/services/me/order_report.dart';
import 'package:chuukohin/services/me/order_status.dart';
import 'package:chuukohin/services/me/product_management.dart';
import 'package:chuukohin/services/order.dart';
import 'package:chuukohin/services/product/product_detail.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier, DiagnosticableTreeMixin {
  MeData medata = MeData(
      email: "", firstname: "", lastname: "", pictureUrl: "", joinDate: "");
  CardInfoData cardInfo =
      CardInfoData(name: "", cardNo: "", monthExpire: "", yearExpire: "");
  AddressInfoData addressInfo = AddressInfoData(
      name: "",
      phone: "",
      addressLine1: "",
      addressLine2: "",
      province: "",
      district: "",
      subDistrict: "",
      postalCode: "");
  bool addressFirstTime = false;
  List<OrderStatusData> receiveProduct = [];
  List<OrderStatusData> completeProduct = [];
  OrderDetailData orderDetail = OrderDetailData(
      product: OrderProductDetail(
          id: 0, name: "", price: 0, pictureUrl: "", brand: ""),
      address: OrderAddressDetail(
          id: 0,
          name: "",
          phone: "",
          addressLine1: "",
          addressLine2: "",
          province: "",
          district: "",
          subDistrict: "",
          postalCode: ""),
      orderDetail:
          OrderDetails(orderId: 0, price: 0, customerName: "", orderTime: ""),
      deliveryInfo: OrderDeliveryInfoDetail(trackingNumber: ""),
      trackingOrder:
          OrderTrackingDetail(productId: 0, trackingNumber: "", status: []));

  void setMeData(MeData data) {
    medata = data;
    notifyListeners();
  }

  void setCardInfo(CardInfoData data) {
    cardInfo = data;
    notifyListeners();
  }

  void setAddressInfo(AddressInfoData data) {
    addressInfo = data;
    notifyListeners();
  }

  void setAddressFirstTime(bool value) {
    addressFirstTime = value;
    notifyListeners();
  }

  void setReceiveProduct(List<OrderStatusData> data) {
    receiveProduct = data;
    notifyListeners();
  }

  void setCompleteProduct(List<OrderStatusData> data) {
    completeProduct = data;
    notifyListeners();
  }

  void setProductDetail(OrderDetailData data) {
    orderDetail = data;
    notifyListeners();
  }

  Future<void> getMeData() async {
    final meResponse = await ProfileService.getProfile();
    if (meResponse is MeResponse) {
      setMeData(meResponse.data);
    } else {
      setMeData(MeData(
          email: "",
          firstname: "",
          lastname: "",
          pictureUrl: "",
          joinDate: ""));
    }
    notifyListeners();
  }

  Future getAddressInfo() async {
    final response = await AddressService.getAddress();
    if (response is AddressInfoResponse) {
      setAddressInfo(response.data);
      addressFirstTime = false;
    } else if (response is ErrorResponse) {
      addressFirstTime = true;
    } else {
      setAddressInfo(AddressInfoData(
          name: "",
          phone: "",
          addressLine1: "",
          addressLine2: "",
          province: "",
          district: "",
          subDistrict: "",
          postalCode: ""));
    }
    notifyListeners();
  }

  Future<void> getReceiveProduct() async {
    final response = await OrderStatusService.getReceiveProduct();
    if (response is OrderStatusResponse) {
      setReceiveProduct(response.data);
    } else {
      setReceiveProduct([]);
    }
    notifyListeners();
  }

  Future<void> getCompleteProduct() async {
    final response = await OrderStatusService.getCompleteProduct();
    if (response is OrderStatusResponse) {
      setCompleteProduct(response.data);
    } else {
      setCompleteProduct([]);
    }
    notifyListeners();
  }

  Future<void> getOrderDetail(String id) async {
    final response = await OrderService.getOrderDetail(id);
    if (response is OrderDetailResponse) {
      setProductDetail(response.data);
    } else {
      setProductDetail(
        OrderDetailData(
          product: OrderProductDetail(
              id: 0, name: "", price: 0, pictureUrl: "", brand: ""),
          address: OrderAddressDetail(
              id: 0,
              name: "",
              phone: "",
              addressLine1: "",
              addressLine2: "",
              province: "",
              district: "",
              subDistrict: "",
              postalCode: ""),
          orderDetail: OrderDetails(
              orderId: 0, price: 0, customerName: "", orderTime: ""),
          deliveryInfo: OrderDeliveryInfoDetail(trackingNumber: ""),
          trackingOrder:
              OrderTrackingDetail(productId: 0, trackingNumber: "", status: []),
        ),
      );
    }
    notifyListeners();
  }
}

class SellerProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String sellerId = "";
  MyShopInfoData shopData = MyShopInfoData(
      seller: MyShopInfo(name: "", totalProduct: 0, joinDate: ""),
      products: []);
  List<ProductManagementData> sellingProducts = [];
  List<ProductManagementData> soldProducts = [];
  ProductDetailData productDetail = ProductDetailData(
    id: 0,
    sellerId: 0,
    name: "",
    brand: "",
    price: 0,
    description: "",
    status: "",
    category: ProductCategory(id: 0, name: ""),
    picture: ProductPicture(id: 0, pictureUrl: ""),
  );
  IncomeInfoData income = IncomeInfoData(
    summary: IncomeSummary(shopName: "", totalIncome: 0),
    orderList: [],
  );
  List<OrderReportData> sendingOrder = [];
  List<OrderReportData> sentOrder = [];

  void setSellerId(String id) {
    sellerId = id;
    notifyListeners();
  }

  void setShopData(MyShopInfoData data) {
    shopData = data;
    notifyListeners();
  }

  void setSellingProducts(List<ProductManagementData> data) {
    sellingProducts = data;
    notifyListeners();
  }

  void setSoldProducts(List<ProductManagementData> data) {
    soldProducts = data;
    notifyListeners();
  }

  void setProductDetail(ProductDetailData data) {
    productDetail = data;
    notifyListeners();
  }

  void setIncome(IncomeInfoData data) {
    income = data;
    notifyListeners();
  }

  void setSendingOrder(List<OrderReportData> data) {
    sendingOrder = data;
    notifyListeners();
  }

  void setSentOrder(List<OrderReportData> data) {
    sentOrder = data;
    notifyListeners();
  }

  Future<void> getSellingProduct() async {
    final response = await ProductManagementService.getAllSellingProducts();
    if (response is ProductManagementResponse) {
      setSellingProducts(response.data);
    } else {
      setSellingProducts([]);
    }
    notifyListeners();
  }

  Future<void> getSoldProduct() async {
    final response = await ProductManagementService.getAllSoldProducts();
    if (response is ProductManagementResponse) {
      setSoldProducts(response.data);
    } else {
      setSoldProducts([]);
    }
    notifyListeners();
  }

  Future<void> getProductDetail(String id) async {
    final response = await ProductDetailService.getProductDetail(id);
    if (response is ProductDetailResponse) {
      setProductDetail(response.data);
    } else {
      setProductDetail(ProductDetailData(
          id: 0,
          sellerId: 0,
          name: "",
          brand: "",
          price: 0,
          description: "",
          status: "",
          category: ProductCategory(id: 0, name: ""),
          picture: ProductPicture(id: 0, pictureUrl: "")));
    }
    notifyListeners();
  }

  Future<void> getIncome() async {
    final response = await IncomeService.getIncome();
    if (response is IncomeInfoResponse) {
      setIncome(response.data);
    } else {
      setIncome(IncomeInfoData(
          summary: IncomeSummary(shopName: "", totalIncome: 0), orderList: []));
    }
    notifyListeners();
  }

  Future<void> getSendingOrder() async {
    final response = await OrderReportService.getSendingOrder();
    if (response is OrderReportResponse) {
      setSendingOrder(response.data);
    } else {
      setSendingOrder([]);
    }
    notifyListeners();
  }

  Future<void> getSentOrder() async {
    final response = await OrderReportService.getSentOrder();
    if (response is OrderReportResponse) {
      setSentOrder(response.data);
    } else {
      setSentOrder([]);
    }
    notifyListeners();
  }
}

class HomeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<Product> homeProduct = [];
  List<Product> categoryProduct = [];
  void setHomeProduct(List<Product> data) {
    homeProduct = data;
    notifyListeners();
  }

  void setCategoryProduct(List<Product> data) {
    categoryProduct = data;
    notifyListeners();
  }

  Future<void> getHomeProduct() async {
    final response = await HomeService.getHomeProduct();
    if (response is HomeProductResponse) {
      setHomeProduct(response.products);
    } else {
      setHomeProduct([]);
    }
    notifyListeners();
  }

  Future<void> getCategoryProduct(String id) async {
    final response = await HomeService.getCategoryProduct(id);
    if (response is CategoryProductResponse) {
      setCategoryProduct(response.products);
    } else {
      setCategoryProduct([]);
    }
    notifyListeners();
  }
}
