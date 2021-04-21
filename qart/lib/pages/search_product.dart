import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qart/controllers/product_controller.dart';
import 'package:qart/widgets/product_widget.dart';

class SearchProduct extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(query),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final _productController = Get.find<ProductController>();
    final suggestionList = query.isEmpty
        ? _productController.products
        : _productController.products
            .where((product) =>
                "${product.name} ${product.qRCode} ${product.brand} ${product.category} ${product.collection} ${product.color}"
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();

    return Scrollbar(
        child: ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (context, index) {
              int productIndex =
                  _productController.products.indexOf(suggestionList[index]);
              return ProductWidget(
                index: productIndex,
                myProduct: suggestionList[index],
              );
            }));
  }
}
