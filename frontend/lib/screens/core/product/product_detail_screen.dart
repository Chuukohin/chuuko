import 'package:chuukohin/models/response/error/error_response.dart';
import 'package:chuukohin/screens/core/payment/checkout_screen.dart';
import 'package:chuukohin/services/order.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:chuukohin/widgets/product/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  void checkBeforeCreateOrder() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text('Kokomi shirt'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 6, left: 16, right: 16),
              child: Column(
                children: [
                  n.Column(
                    [
                      Container(
                        margin: const EdgeInsets.only(bottom: 18),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            Provider.of<SellerProvider>(context, listen: false)
                                .productDetail
                                .picture
                                .pictureUrl,
                            height: 220,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ProductDetail(
                        Provider.of<SellerProvider>(context, listen: false)
                            .productDetail
                            .name,
                        Provider.of<SellerProvider>(context, listen: false)
                            .productDetail
                            .brand,
                        Provider.of<SellerProvider>(context, listen: false)
                            .productDetail
                            .category
                            .name,
                        "Bangkok",
                        Provider.of<SellerProvider>(context, listen: false)
                            .productDetail
                            .price,
                        Provider.of<SellerProvider>(context, listen: false)
                            .productDetail
                            .description,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 12, left: 16, right: 16, bottom: 30),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: n.Text("Buy now")..fontSize = 16,
                    onPressed: () async {
                      await OrderService.getInfoBeforeCreateOrder(
                              Provider.of<SellerProvider>(context,
                                      listen: false)
                                  .productDetail
                                  .id)
                          .then((response) {
                        if (response is ErrorResponse) {
                          var error = SnackBar(
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.only(
                                bottom: 60, left: 15, right: 15),
                            content: Text(response.message),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(error);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(
                                name: Provider.of<SellerProvider>(context,
                                        listen: false)
                                    .productDetail
                                    .name,
                                brand: Provider.of<SellerProvider>(context,
                                        listen: false)
                                    .productDetail
                                    .brand,
                                price: Provider.of<SellerProvider>(context,
                                        listen: false)
                                    .productDetail
                                    .price,
                                pictureUrl: Provider.of<SellerProvider>(context,
                                        listen: false)
                                    .productDetail
                                    .picture
                                    .pictureUrl,
                                productId: Provider.of<SellerProvider>(context,
                                        listen: false)
                                    .productDetail
                                    .id,
                              ),
                            ),
                          );
                        }
                      });
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
