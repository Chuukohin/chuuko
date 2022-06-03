import 'dart:convert';
import 'package:chuukohin/widgets/category/category_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niku/namespace.dart' as n;
import 'package:collection/collection.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List _categories = [];

  _loadCategories() async {
    final String response =
        await rootBundle.loadString('assets/json/category.json');
    final data = await json.decode(response);
    setState(() {
      _categories = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      width: double.infinity,
      child: n.Column(
        [
          Container(
            margin: const EdgeInsets.only(bottom: 20, left: 20),
            child: n.Text("Categories")
              ..fontWeight = FontWeight.bold
              ..fontSize = 16,
          ),
          Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _categories.mapIndexed((index, category) {
                return Container(
                  width: 65,
                  margin: index == 0
                      ? const EdgeInsets.only(left: 16)
                      : index == _categories.length - 1
                          ? const EdgeInsets.only(right: 20)
                          : null,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: CategoryIcon(url: category['icon']),
                      ),
                      n.Text(category['name'])
                        ..fontSize = 12
                        ..fontWeight = FontWeight.w500
                        ..textAlign = TextAlign.center
                        ..overflow = TextOverflow.ellipsis,
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      )..crossAxisAlignment = CrossAxisAlignment.start,
    );
  }
}
