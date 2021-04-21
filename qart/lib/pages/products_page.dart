import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart/controllers/product_controller.dart';
import 'package:qart/utils/config.dart';
import 'package:qart/widgets/custom_text.dart';
import 'package:qart/widgets/product_widget.dart';

class ProductsPage extends StatelessWidget {
  final _productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.red,
      onRefresh: () async {
        _productController.fetchProduct(isFetchDataOnSplashScreen: false);
      },
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: GetX<ProductController>(builder: (product) {
          return product.isFetchingData.value
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    backgroundColor: Colors.red,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Config.getPageHeader("Products"),
                    CustomText(
                      text:
                          "Total ${_productController.getProductsLength} products",
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        height: Get.height / 1.5,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: _productController.getProductsLength,
                            itemBuilder: (context, index) {
                              var myProduct =
                                  _productController.products[index];
                              return ProductWidget(
                                index: index,
                                myProduct: myProduct,
                              );
                            }))
                  ],
                );
        }),
      ),
    );
  }
}
