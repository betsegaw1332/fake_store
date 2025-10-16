// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishlistProductEntity _$WishlistProductEntityFromJson(
  Map<String, dynamic> json,
) => WishlistProductEntity(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  imageUrl: json['imageUrl'] as String,
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$WishlistProductEntityToJson(
  WishlistProductEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'imageUrl': instance.imageUrl,
  'price': instance.price,
};
