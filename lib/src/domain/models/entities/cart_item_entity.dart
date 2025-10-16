import 'dart:convert';

import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_entity.g.dart';

@JsonSerializable()
class CartItemEntity {
  final int id;
  final String title;
  final String imageUrl;
  final double price;
  int quantity;

  CartItemEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory CartItemEntity.fromJson(JSON json) => _$CartItemEntityFromJson(json);

  JSON toJson() => _$CartItemEntityToJson(this);

  static String encode(List<CartItemEntity> items) =>
      json.encode(items.map((item) => item.toJson()).toList());

  static List<CartItemEntity> decode(String items) =>
      (json.decode(items) as List<dynamic>)
          .map<CartItemEntity>((item) => CartItemEntity.fromJson(item))
          .toList();

  factory CartItemEntity.mockData() {
    return CartItemEntity(
      id: 0,
      price: 0,
      title: "Cart Item Entity Title",
      imageUrl: AppConstants.placeholerImg,
      quantity: 1,
    );
  }
  factory CartItemEntity.fromProductEntity({
    required ProductEntity productData,
  }) {
    return CartItemEntity(
      id: productData.id,
      price: productData.price,
      title: productData.title,
      imageUrl: productData.image,
      quantity: 1,
    );
  }
}
