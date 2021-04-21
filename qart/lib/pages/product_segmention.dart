import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart/controllers/product_controller.dart';
import 'package:qart/utils/config.dart';
import 'package:qart/widgets/custom_scaffold.dart';
import 'package:qart/widgets/product_widget.dart';

class ProductSegmentation extends StatelessWidget {
  final String? segmentationParam;

  const ProductSegmentation({Key? key, this.segmentationParam})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _productController = Get.find<ProductController>();
    return CustomScaffold(
      hasBottomNavigationBar: false,
      body: Container(
          height: Get.height / 1.4,
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Config.getPageHeader("$segmentationParam Products"),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: GetX<ProductController>(
                  builder: (product) {
                    return product.isProductSegmentationLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              backgroundColor: Colors.red,
                            ),
                          )
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: product.productsSegmentation.length,
                            itemBuilder: (context, index) {
                              var mySegmentedProduct = _productController
                                  .productsSegmentation[index];
                              return ProductWidget(
                                index: _productController
                                    .getItemIndexByElement(mySegmentedProduct),
                                myProduct: mySegmentedProduct,
                              );
                            });
                  },
                ),
              ),
            ],
          )),
    );
  }
}
