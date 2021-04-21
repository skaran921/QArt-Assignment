import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart/controllers/cart_controller.dart';
import 'package:qart/controllers/product_controller.dart';
import 'package:qart/models/Product.dart';
import 'package:qart/utils/config.dart';
import 'package:qart/widgets/custom_scaffold.dart';
import 'package:qart/widgets/custom_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsPage extends StatelessWidget {
  final int? index;

  const ProductDetailsPage({Key? key, this.index}) : super(key: key);

  Widget _buildInfoContainer(String heading, Widget child) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          color: Config.grayColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "$heading",
            fontWeight: FontWeight.w500,
          ),
          child
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _cartController = Get.find<CartController>();
    final _productController = Get.find<ProductController>();
    Product _product = _productController.products[index!];
    return CustomScaffold(
      hasBottomNavigationBar: false,
      body: Container(
          height: Get.height / 1.4,
          padding: EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: "${_product.qRCode}",
                  child: CachedNetworkImage(
                    imageUrl: "${_product.imageUrl}",
                    width: (Get.width),
                    height: (Get.width / 1.5),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low,
                  ),
                ),
                Config.getPageHeader("Product Details"),
                Divider(),
                _buildInfoContainer(
                    "Name",
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "${_product.name}",
                        ),
                        CustomText(
                          text: "${_product.description}",
                        ),
                      ],
                    )),
                _buildInfoContainer(
                    "Brand",
                    CustomText(
                      text: "${_product.brand}",
                    )),
                _buildInfoContainer(
                    "Category",
                    CustomText(
                      text: "${_product.category}",
                    )),
                _buildInfoContainer(
                    "Collection",
                    CustomText(
                      text: "${_product.collection}",
                    )),
                _buildInfoContainer(
                  "Rating",
                  RatingBar.builder(
                    initialRating: _product.likeabilty,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                _buildInfoContainer(
                    "Color",
                    CustomText(
                      text: "${_product.color}",
                    )),
                _buildInfoContainer(
                    "Option",
                    CustomText(
                      text: "${_product.option}",
                    )),
                _buildInfoContainer(
                    "Available Sizes",
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: _product.availableSizes
                            .map((size) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: CustomText(
                                      text: size,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    )),
              ],
            ),
          )),
      bottomWidget: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: "₹ ${_product.mrp}",
              textColor: Colors.red,
              fontSize: 20,
            ),
            // Expanded(child: Container()),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  _cartController.addProductToCart(
                      index!, _product.qRCode, _product.mrp);
                  Get.snackbar("Success", "Product added in cart",
                      backgroundColor: Config.textColor.withAlpha(150),
                      snackPosition: SnackPosition.TOP);
                },
                child: CustomText(
                  textColor: Colors.white,
                  text: "Add to Cart",
                ))
          ],
        ),
      ),
    );
  }
}
