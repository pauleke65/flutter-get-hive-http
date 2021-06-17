import 'package:api_learn/models/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'Product 1 is here',
          productImage: '...',
          productName: 'Product 1'),
      Product(
          id: 2,
          price: 50,
          productDescription: 'Product 2 is here',
          productImage: '...',
          productName: 'Product 2'),
      Product(
          id: 3,
          price: 25,
          productDescription: 'Product 3 is here',
          productImage: '...',
          productName: 'Product 3'),
    ];
    products.value = productResult;
  }
}
