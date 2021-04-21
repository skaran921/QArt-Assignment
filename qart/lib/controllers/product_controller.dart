import 'package:get/get.dart';
import 'package:qart/models/Product.dart';
import 'package:qart/repository/products_repo.dart';

class ProductController extends GetxController {
  var isFetchingData = false.obs;
  var isFetchingDataWithSplashScreen = false.obs;

  var isProductSegmentationLoading = false.obs;

  List<Product> products = <Product>[].obs;
  List<Product> productsSegmentation = <Product>[].obs;

  /// getter for getting  total no of products
  int get getProductsLength => products.length;

  ///
  int getItemIndexByElement(Product element) => products.indexOf(element);

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchSegmentedProducts(String segmentValue) {
    isProductSegmentationLoading.value = true;
    var segmentedProducts = products.where((element) =>
        element.category.toLowerCase().startsWith(segmentValue.toLowerCase()));
    productsSegmentation.clear();
    productsSegmentation.addAll(segmentedProducts);
    isProductSegmentationLoading.value = false;
  }

  void fetchProduct({bool isFetchDataOnSplashScreen = true}) async {
    if (isFetchDataOnSplashScreen)
      this.isFetchingDataWithSplashScreen.value = true;
    this.isFetchingData.value = true;
    List<Product> results = await ProductRepo().fetchProducts();
    products.clear();
    products.addAll(results);
    print(products.length);
    this.isFetchingData.value = false;
    if (isFetchDataOnSplashScreen)
      this.isFetchingDataWithSplashScreen.value = false;
  }
}
