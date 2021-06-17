import 'package:api_learn/models/product.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  @override
  onInit() async {
    var box = await Hive.openBox('myBox5');

    if (box.get("Cart Items") != null) {
      cartItems.value =
          List<Product>.from(box.get("Cart Items").where((i) => i != null));
    }
  }

  addToCart(Product product) {
    cartItems.add(product);
  }
}
