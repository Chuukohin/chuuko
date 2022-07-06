import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/models/response/me/my_shop/my_shop_response.dart';
import 'package:chuukohin/screens/start/login_screen.dart';
import 'package:chuukohin/services/me/myshop.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:chuukohin/utils/widget/divider_insert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:niku/namespace.dart' as n;
import 'package:collection/collection.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeScreen extends StatefulWidget {
  final String userType;
  const MeScreen({Key? key, required this.userType}) : super(key: key);

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  final List<Map<String, dynamic>> accountDetail = [
    {"name": "My Profile", "path": "/profile"},
    {"name": "Order Status", "path": "/profile/order/status"},
    {"name": "My Address", "path": "/profile/address"},
    {"name": "My Card", "path": "/profile/card"},
  ];
  final List<Map<String, dynamic>> sellerDetail = [
    {"name": "My Shop", "path": "/seller/shop"},
    {"name": "Your Product / Management", "path": "/seller/product/manage"},
    {"name": "Order Report", "path": "/seller/order"},
    {"name": "Income", "path": "/seller/income"},
  ];

  late SharedPreferences prefs;

  void deleteUserData() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('user');
    AppProviders.disposeAllDisposableProviders(context);
  }

  void readJson() async {
    final shopResponse = await ShopDataService.getShopData();
    if (shopResponse is MyShopInfoResponse) {
      context.read<SellerProvider>().setShopData(shopResponse.data);
    } else {
      context.read<SellerProvider>().setShopData(
            MyShopInfoData(
                seller: MyShopInfo(name: "", totalProduct: 0, joinDate: ""),
                products: []),
          );
    }
    context.read<SellerProvider>().getSellingProduct();
    context.read<SellerProvider>().getSoldProduct();
    context.read<SellerProvider>().getIncome();
    context.read<ProfileProvider>().getReceiveProduct();
    context.read<ProfileProvider>().getCompleteProduct();
    context.read<SellerProvider>().getSendingOrder();
    context.read<SellerProvider>().getSentOrder();
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: n.Column(
            [
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/shop-bg.png',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      color: Colors.white.withOpacity(0.4),
                      colorBlendMode: BlendMode.modulate,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 70, left: 30, right: 30),
                      child: n.Row(
                        [
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(120),
                              child: Image.network(
                                context
                                    .watch<ProfileProvider>()
                                    .medata
                                    .pictureUrl,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          n.Column(
                            [
                              Container(
                                width: screenWidth * 0.5,
                                margin: const EdgeInsets.only(bottom: 4),
                                child: n.Text(
                                  context
                                          .watch<ProfileProvider>()
                                          .medata
                                          .firstname +
                                      " " +
                                      context
                                          .watch<ProfileProvider>()
                                          .medata
                                          .lastname,
                                )
                                  ..fontWeight = FontWeight.bold
                                  ..color = ThemeConstant.secondaryColor
                                  ..overflow = TextOverflow.ellipsis,
                              ),
                              context
                                      .watch<ProfileProvider>()
                                      .medata
                                      .joinDate
                                      .isNotEmpty
                                  ? n.Text(
                                      "Joined: " +
                                          DateFormat("dd/MM/yyyy").format(
                                            DateTime.parse(context
                                                .watch<ProfileProvider>()
                                                .medata
                                                .joinDate),
                                          ),
                                    )
                                  : Container(),
                            ],
                          )..crossAxisAlignment = CrossAxisAlignment.start
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: n.Column([
                  Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: n.Text("My Account")
                        ..fontWeight = FontWeight.bold),
                  Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset:
                              const Offset(1, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: n.Column(
                      dividerInsert(
                        accountDetail
                            .mapIndexed(
                              (index, element) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, element['path']),
                                  behavior: HitTestBehavior.translucent,
                                  child: n.Row(
                                    [
                                      n.Text(element['name'])
                                        ..fontSize = 12
                                        ..fontWeight = FontWeight.w500,
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 14,
                                        color: ThemeConstant.dividerColor,
                                      ),
                                    ],
                                  )
                                    ..mainAxisAlignment =
                                        MainAxisAlignment.spaceBetween
                                    ..crossAxisAlignment =
                                        CrossAxisAlignment.center,
                                ),
                              ),
                            )
                            .toList(),
                        Divider(
                          color: ThemeConstant.dividerColor,
                          indent: 16,
                          endIndent: 16,
                          height: 1,
                        ),
                      ),
                    )..crossAxisAlignment = CrossAxisAlignment.start,
                  ),
                  widget.userType == "seller"
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: n.Text("Seller Management")
                                  ..fontWeight = FontWeight.bold),
                            Container(
                              margin: const EdgeInsets.only(bottom: 24),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(
                                        1, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: n.Column(
                                dividerInsert(
                                  sellerDetail
                                      .mapIndexed(
                                        (index, element) => Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          child: GestureDetector(
                                            onTap: () => Navigator.pushNamed(
                                                context, element['path']),
                                            behavior:
                                                HitTestBehavior.translucent,
                                            child: n.Row(
                                              [
                                                n.Text(element['name'])
                                                  ..fontSize = 12
                                                  ..fontWeight =
                                                      FontWeight.w500,
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 14,
                                                  color: ThemeConstant
                                                      .dividerColor,
                                                ),
                                              ],
                                            )
                                              ..mainAxisAlignment =
                                                  MainAxisAlignment.spaceBetween
                                              ..crossAxisAlignment =
                                                  CrossAxisAlignment.center,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  Divider(
                                    color: ThemeConstant.dividerColor,
                                    indent: 16,
                                    endIndent: 16,
                                    height: 1,
                                  ),
                                ),
                              )..crossAxisAlignment = CrossAxisAlignment.start,
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(bottom: 16),
                                child: n.Text("Become a Seller")
                                  ..fontWeight = FontWeight.bold),
                            Container(
                              margin: const EdgeInsets.only(bottom: 24),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: const Offset(1, 1),
                                  ),
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                      context, '/seller/signup'),
                                  behavior: HitTestBehavior.translucent,
                                  child: n.Row(
                                    [
                                      n.Text("Register")
                                        ..fontSize = 12
                                        ..fontWeight = FontWeight.w500,
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 14,
                                        color: ThemeConstant.dividerColor,
                                      ),
                                    ],
                                  )
                                    ..mainAxisAlignment =
                                        MainAxisAlignment.spaceBetween
                                    ..crossAxisAlignment =
                                        CrossAxisAlignment.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        child: const Text("Sign Out"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            ThemeConstant.logOutBtnColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          deleteUserData();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        }),
                  ),
                ])
                  ..crossAxisAlignment = CrossAxisAlignment.start,
              )
            ],
          )..crossAxisAlignment = CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
