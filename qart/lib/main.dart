import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart/pages/dashboard_page.dart';
import 'package:qart/utils/config.dart';

void main() {
  runApp(QartApp());
}

class QartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: Config.fontFamily,
          primaryColor: Colors.white,
          accentColor: Color(0xFFF5F5F5)),
      routes: {
        "/": (context) => DashboardPage(),
      },
    );
  }
}
