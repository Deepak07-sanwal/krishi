import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {
  final String itemName;
  final int itemPrice;
  final int itemQuantity;
  final String imageUrl;
  final String description;
  final String productId;
  ProductsModel({
    required this.itemName,
    required this.itemPrice,
    required this.itemQuantity,
    required this.imageUrl,
    required this.description,
    required this.productId,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      itemName: json['itemName'] as String,
      itemPrice: json['itemPrice'] as int,
      itemQuantity: json['itemQuantity'] as int,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      productId: json['productId'] as String,
    );
  }
  factory ProductsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductsModel(
      itemName: data['itemName'] as String,
      itemPrice: data['itemPrice'] as int,
      itemQuantity: data['itemQuantity'] as int,
      imageUrl: data['imageUrl'] as String,
      description: data['description'] as String,
      productId: data['productId'] as String,
    );
  }
}
