// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIProductResponse _$APIProductResponseFromJson(Map<String, dynamic> json) =>
    APIProductResponse(
      id: (json['id'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: APIRatingResponse.fromJson(
        json['rating'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$APIProductResponseToJson(APIProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };
