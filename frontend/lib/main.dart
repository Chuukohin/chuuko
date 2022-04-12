import 'package:chuukohin/screens/test_screen.dart';
import 'package:flutter/cupertino.dart';
// import 'package:niku/namespace.dart' as n;
// import 'package:chuukohin/screens/homepage_screen.dart';

void main() {
  runApp(const Chuuko());
}

class Chuuko extends StatelessWidget {
  const Chuuko({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(
          brightness: Brightness.light, primaryColor: Color(0xffB89476)),
      home: CupertinoPageScaffold(
        child: TestScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
