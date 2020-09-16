import 'package:flutter/material.dart';
import 'package:bagua/LoginPage.dart';
import 'InputInfoPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '八卦排盘',
//      home: InputInfoPage(),

      home: InputInfoPage(),
    );
  }
}

//void main() {
//  runApp(new MaterialApp(
//    title: '八字排盘',
//    home: new LoginPage(),
//  ));
//}