import 'package:chuukohin/constant/theme.dart';
import 'package:chuukohin/services/provider/provider.dart';
import 'package:chuukohin/utils/widget/divider_insert.dart';
import 'package:chuukohin/widgets/seller/income_order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:niku/namespace.dart' as n;
import 'package:provider/provider.dart';

class IncomeScreen extends StatefulWidget {
  const IncomeScreen({Key? key}) : super(key: key);

  @override
  State<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: n.Text('Income'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 30),
          child: n.Column(
            [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: n.Column(
                  [
                    Container(
                      decoration: BoxDecoration(
                        color: ThemeConstant.primaryColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      constraints: const BoxConstraints(maxWidth: 160),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: n.Text(
                        Provider.of<SellerProvider>(context, listen: false)
                            .shopData
                            .seller
                            .name,
                      )
                        ..color = Colors.white
                        ..overflow = TextOverflow.ellipsis,
                    ),
                    n.Row([
                      n.Text("Total")
                        ..fontSize = 16
                        ..fontWeight = FontWeight.w500
                    ])
                      ..mainAxisAlignment = MainAxisAlignment.end,
                    n.Row(
                      [
                        n.Text(
                          Provider.of<SellerProvider>(context, listen: false)
                              .income
                              .summary
                              .totalIncome
                              .toString(),
                        )
                          ..fontSize = 24
                          ..fontWeight = FontWeight.w500,
                        Container(
                          padding: const EdgeInsets.only(bottom: 3, left: 4),
                          child: n.Text("THB")..fontSize = 12,
                        )
                      ],
                    )
                      ..mainAxisAlignment = MainAxisAlignment.end
                      ..crossAxisAlignment = CrossAxisAlignment.end,
                    Divider(
                      color: ThemeConstant.dividerColor,
                      height: 20,
                    ),
                  ],
                )..crossAxisAlignment = CrossAxisAlignment.start,
              ),
              n.Column(
                dividerInsert(
                  Provider.of<SellerProvider>(context, listen: false)
                      .income
                      .orderList
                      .map(
                        (order) => IncomeOrder(
                          name: order.customerName,
                          date: DateFormat("dd MMMM yyyy, HH:mm").format(
                            DateTime.parse(order.orderTime),
                          ),
                          price: order.income.toString(),
                        ),
                      )
                      .toList(),
                  Divider(
                    color: ThemeConstant.dividerColor,
                    height: 25,
                  ),
                ),
              ),
            ],
          )..crossAxisAlignment = CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
