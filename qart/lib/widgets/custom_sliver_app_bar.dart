import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart/controllers/cart_controller.dart';
import 'package:qart/pages/cart_page.dart';
import 'package:qart/widgets/custom_text.dart';

class CustomSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartController = Get.find<CartController>();

    return SliverAppBar(
      title: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 50.0,
                  height: 60.0,
                  fit: BoxFit.contain,
                ),
              ),
              CustomText(
                text: "Art Fashion",
                fontSize: 24.0,
              ),
              Expanded(child: Container()),
              IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  }),
              SizedBox(
                width: 20.0,
              )
            ],
          ),
          Positioned(
              right: 10,
              top: 10,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 12.0,
                child: GetX<CartController>(
                  builder: (cart) {
                    return CustomText(
                      textColor: Colors.white,
                      text: "${cart.getCartLength}",
                    );
                  },
                ),
              )),
        ],
      ),
      elevation: 0.0,
      centerTitle: true,
      floating: true,
    );
  }
}
