import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:qart/models/Product.dart';
import 'package:qart/utils/config.dart';

class ProductRepo {
  Future fetchProducts() async {
    try {
      var response = await http.get(Uri.parse(Config.productsApi));
      var jsonResponse = json.decode(response.body);
      var _productsList = jsonResponse["Products"] as List;
      List<Product> products =
          _productsList.map((item) => Product.fromJson(item)).toList();
      return products;
    } on HttpException {
      print("error => HttpException");
      return <Product>[];
    } on TimeoutException {
      print("error => Timeout");
      return <Product>[];
    } catch (error, _) {
      print("error => $error");
      return <Product>[];
      // print(error);
      // print(_);
    }
  }
}
