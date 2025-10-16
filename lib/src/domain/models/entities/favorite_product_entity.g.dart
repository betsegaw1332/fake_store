// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteProductEntity _$FavoriteProductEntityFromJson(
  Map<String, dynamic> json,
) => FavoriteProductEntity(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  imageUrl: json['imageUrl'] as String,
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$FavoriteProductEntityToJson(
  FavoriteProductEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'imageUrl': instance.imageUrl,
  'price': instance.price,
};
