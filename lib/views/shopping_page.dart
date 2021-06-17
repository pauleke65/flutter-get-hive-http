import 'dart:convert';

import 'package:api_learn/controllers/cart_controller.dart';
import 'package:api_learn/controllers/shopping_controller.dart';
import 'package:api_learn/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        child: Column(
                          children: [
                            Text(controller.products[index].productName),
                            Text('\$${controller.products[index].price}'),
                            MaterialButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              child: Text("Buy Now"),
                            ),
                          ],
                        ),
                      );
                    });
              }),
            ),
            GetX<CartController>(builder: (controller) {
              return Column(
                children: [
                  RaisedButton(
                    onPressed: () {
                      var box = Hive.box('myBox5');

                      box.put("Cart Items", controller.cartItems);
                    },
                    child: Text("Store Values"),
                  ),
                  Text(
                      'Total Amount: \$${controller.totalPrice}, Items ${controller.cartItems.length}'),
                ],
              );
            }),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
