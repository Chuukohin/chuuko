import 'package:flutter/cupertino.dart';
import 'package:niku/namespace.dart' as n;

class IncomeOrder extends StatefulWidget {
  final String name;
  final String date;
  final String price;
  const IncomeOrder(
      {Key? key, required this.date, required this.name, required this.price})
      : super(key: key);

  @override
  State<IncomeOrder> createState() => _IncomeOrderState();
}

class _IncomeOrderState extends State<IncomeOrder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: n.Column([
        n.Text("Order by: " + widget.name)
          ..fontSize = 14
          ..fontWeight = FontWeight.w500,
        n.Text(widget.date)..fontSize = 13,
        n.Row(
          [
            n.Text(widget.price)
              ..fontSize = 18
              ..fontWeight = FontWeight.w400,
            Container(
              padding: const EdgeInsets.only(bottom: 1, left: 4),
              child: n.Text("THB")..fontSize = 12,
            ),
          ],
        )
          ..mainAxisAlignment = MainAxisAlignment.end
          ..crossAxisAlignment = CrossAxisAlignment.end,
      ])
        ..crossAxisAlignment = CrossAxisAlignment.start
        ..mainAxisAlignment = MainAxisAlignment.spaceBetween,
    );
  }
}
