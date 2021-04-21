import 'package:get/get.dart';
import 'package:qart/models/Cart.dart';

class CartController extends GetxController {
  List<Cart> productCart = <Cart>[].obs;

  void addProductToCart(int index, String qrCode, double mrp) {
    Cart cartProduct = Cart(qrCode, mrp, index, totalAmt: mrp);

    var cartItem = productCart.where((element) {
      if (element.qrCode == qrCode) {
        element.totalItems = element.totalItems + 1;
        element.totalAmt = element.mrp * element.totalItems;
        return true;
      }

      return false;
    });

    if (cartItem.isEmpty) {
      productCart.add(cartProduct);
    } else {}
  }

  int get getCartLength => productCart.length;

  void emptyCart() {
    productCart.clear();
  }
}
