import 'package:chuukohin/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;
import 'package:chuukohin/widgets/product/product_detail.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double screenHeight = height - padding.top - padding.bottom;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text('Product name'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: screenHeight - 56,
          padding: const EdgeInsets.only(top: 6, left: 16, right: 16),
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
              n.Row([
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: ThemeConstant.logOutBtnColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: n.Text("Delete")..fontSize = 16,
                        onPressed: () {}),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: n.Text("Done")..fontSize = 16,
                        onPressed: () {}),
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
