import 'package:flutter/material.dart';
import 'package:qart/models/User.dart';
import 'package:qart/widgets/custom_text.dart';

class Config {
  static const String fontFamily = "Poppins";

  /// Colors
  static const Color textColor = Color(0xFF2f2c2c);
  static const Color grayColor = Color(0xFFF5F5F5);
  static const Color greenColor = Color(0xFFc4f2df);
  static const Color darkGreenColor = Color(0xFF487666);

  /// home page brands details
  static const List<String> brandImages = [
    "my-profile.png",
    "1.png",
    "5.png",
    "7.png",
    "8.png",
    "12.png",
    "1-Park-Avenue.png",
  ];

  static Widget getPageHeader(String title) => CustomText(
        text: "$title",
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
      );

  /// current user info
  static const User currentUserInfo = User(
      firstName: "Karan",
      lastName: "Soni",
      email: "skaran921@gmail.com",
      imgUrl: "profile.png",
      mobile: "9466067763",
      gender: 'Male');

  /// products api
  static const String productsApi =
      "https://debug.qart.fashion/api/product/GetProductsWithSizes?retailerCode=40984";
}
