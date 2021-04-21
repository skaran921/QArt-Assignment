import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart/controllers/cart_controller.dart';
import 'package:qart/controllers/product_controller.dart';
import 'package:qart/pages/splash_screen.dart';
import 'package:qart/widgets/custom_scaffold.dart';

class DashboardPage extends StatelessWidget {
  final _productController = Get.put(ProductController());
  final _cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GetX<ProductController>(builder: (product) {
      return product.isFetchingDataWithSplashScreen.value
          ? SplashScreen()
          : CustomScaffold();
    });
  }
}
