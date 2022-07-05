import 'package:chuukohin/constant/environment.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;
import 'package:chuukohin/widgets/product/product_detail.dart';
import 'package:provider/provider.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text('Product name'),
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
                                    .pictureUrl
                                    .contains('https')
                                ? Provider.of<SellerProvider>(context,
                                        listen: false)
                                    .productDetail
                                    .picture
                                    .pictureUrl
                                : EnvironmentConstant.internalPrefix +
                                    Provider.of<SellerProvider>(context,
                                            listen: false)
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
              child: Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: n.Text("Back")..fontSize = 16,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
