import 'package:demo_shop/pages/Login/index.dart';
import 'package:demo_shop/pages/Main/index.dart';
import 'package:flutter/material.dart';

Widget getRootWidget() {
  return MaterialApp(initialRoute: "/", routes: getRootRoutes());
}

Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {"/": (context) => MainPage(), "/login": (context) => LoginPage()};
}
