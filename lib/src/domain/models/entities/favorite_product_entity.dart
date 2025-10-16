import 'dart:convert';

import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_product_entity.g.dart';

@JsonSerializable()
class FavoriteProductEntity {
  final int id;
  final String title;
  final String imageUrl;
  final double price;

  FavoriteProductEntity({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  factory FavoriteProductEntity.fromJson(JSON json) => _$FavoriteProductEntityFromJson(json);

  JSON toJson() => _$FavoriteProductEntityToJson(this);

  static String encode(List<FavoriteProductEntity> items) =>
      json.encode(items.map((item) => item.toJson()).toList());

  static List<FavoriteProductEntity> decode(String items) =>
      (json.decode(items) as List<dynamic>)
          .map<FavoriteProductEntity>((item) => FavoriteProductEntity.fromJson(item))
          .toList();

  factory FavoriteProductEntity.mockData() {
    return FavoriteProductEntity(
      id: 0,
      price: 0,
      title: "Cart Item Entity Title",
      imageUrl: AppConstants.placeholerImg,
    );
  }
  factory FavoriteProductEntity.fromProductEntity({
    required ProductEntity productData,
  }) {
    return FavoriteProductEntity(
      id: productData.id,
      price: productData.price,
      title: productData.title,
      imageUrl: productData.image,
    );
  }
}
