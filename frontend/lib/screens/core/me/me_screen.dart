import 'package:chuukohin/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:niku/namespace.dart' as n;

class MeScreen extends StatefulWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  State<MeScreen> createState() => _MeScreenState();
}

class _MeScreenState extends State<MeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
          child: n.Column(
            [
              n.Row(
                [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.network(
                        'https://www.pcgamesn.com/wp-content/uploads/2021/07/genshin-impact-kokomi-release-date.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  n.Column([
                    Container(
                      width: 190,
                      margin: const EdgeInsets.only(bottom: 4),
                      child: n.Text("SangonomiyaSangonomiya Kokomi")
                        ..fontWeight = FontWeight.bold
                        ..color = ThemeConstant.secondaryColor
                        ..overflow = TextOverflow.ellipsis,
                    ),
                    n.Text("Joined: 11/6/2022"),
                  ])
                    ..crossAxisAlignment = CrossAxisAlignment.start
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
