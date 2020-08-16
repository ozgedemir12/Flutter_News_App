import 'package:flutter/material.dart';
import 'package:news_app1/iletisim.dart';
import 'package:news_app1/kurucuuyeler.dart';
import 'package:news_app1/login.dart';
import 'package:news_app1/signup.dart';
import 'package:news_app1/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youdevo',
      routes: rotalar,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: SignUpPage(),
    );
  }
}

var rotalar = <String, WidgetBuilder>{
  "/home": (BuildContext context) => Home(),
  "/iletisim": (BuildContext context) => Iletisim(),
  "/kurucuuyeler": (BuildContext context) => KurucuUyeler(),
};
