import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String productName;

  @HiveField(2)
  final String productImage;

  @HiveField(3)
  final String productDescription;

  @HiveField(4)
  final double price;

  Product(
      {this.id,
      this.productName,
      this.productImage,
      this.productDescription,
      this.price});
}
