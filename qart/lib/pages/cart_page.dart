import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart/controllers/cart_controller.dart';
import 'package:qart/controllers/product_controller.dart';
import 'package:qart/utils/config.dart';
import 'package:qart/widgets/custom_scaffold.dart';
import 'package:qart/widgets/custom_text.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartController = Get.find<CartController>();
    final _productController = Get.find<ProductController>();

    return CustomScaffold(
        hasBottomNavigationBar: false,
        body: Container(
          height: Get.height / 1.4,
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Config.getPageHeader("Product Cart"),
              Divider(),
              TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                    _cartController.emptyCart();
                  },
                  child: CustomText(
                    text: "Clear Cart",
                    textColor: Colors.white,
                  )),
              Expanded(
                child: GetX<CartController>(
                  builder: (cart) {
                    return cart.productCart.isEmpty
                        ? Center(
                            child: CustomText(
                              text: "Nothing in cart",
                            ),
                          )
                        : ListView.builder(
                            itemCount: cart.getCartLength,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var currentCartItem = cart.productCart[index];
                              var imageUrl =
                                  _productController.products[index].imageUrl;
                              return ListTile(
                                leading: CachedNetworkImage(
                                  imageUrl: "$imageUrl",
                                  width: (100),
                                  height: 100,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.low,
                                ),
                                title: Text("${currentCartItem.qrCode}"),
                                trailing: CustomText(
                                  text: "₹ ${currentCartItem.totalAmt}",
                                  textColor: Colors.red,
                                  fontSize: 20,
                                ),
                                subtitle: CustomText(
                                  text:
                                      "${currentCartItem.mrp} X  ${currentCartItem.totalItems}",
                                ),
                              );
                            });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
