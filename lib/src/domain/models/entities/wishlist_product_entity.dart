import 'dart:convert';

import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wishlist_product_entity.g.dart';

@JsonSerializable()
class WishlistProductEntity {
  final int id;
  final String title;
  final String imageUrl;
  final double price;

  WishlistProductEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  factory WishlistProductEntity.fromJson(JSON json) => _$WishlistProductEntityFromJson(json);

  JSON toJson() => _$WishlistProductEntityToJson(this);

  static String encode(List<WishlistProductEntity> items) =>
      json.encode(items.map((item) => item.toJson()).toList());

  static List<WishlistProductEntity> decode(String items) =>
      (json.decode(items) as List<dynamic>)
          .map<WishlistProductEntity>((item) => WishlistProductEntity.fromJson(item))
          .toList();

  factory WishlistProductEntity.mockData() {
    return WishlistProductEntity(
      id: 0,
      price: 0,
      title: "Cart Item Entity Title",
      imageUrl: AppConstants.placeholerImg,
    );
  }
  factory WishlistProductEntity.fromProductEntity({
    required ProductEntity productData,
  }) {
    return WishlistProductEntity(
      id: productData.id,
      price: productData.price,
      title: productData.title,
      imageUrl: productData.image,
    );
  }
}
