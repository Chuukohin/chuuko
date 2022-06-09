import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/types/widget/placement.dart';
import 'package:chuukohin/widgets/product/product_detail.dart';
import 'package:chuukohin/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double screenHeight = height - padding.top - padding.bottom;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text('Kokomi shirt'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: screenHeight - 56,
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              n.Column(
                [
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://www.pcgamesn.com/wp-content/uploads/2021/07/genshin-impact-kokomi-release-date.jpg',
                      ),
                    ),
                  ),
                  const ProductDetail(
                      "Product name",
                      "Uniqlo",
                      "Shirt",
                      "Bangkok",
                      5000,
                      "Kokomi shirt Kokomi shirtKokomi shirtKokomi shirtKokomi shirt Kokomi shirt"),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: n.Text("Buy now")..fontSize = 17,
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
