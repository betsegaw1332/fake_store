import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_product_response.g.dart';

@JsonSerializable()
class APIProductResponse {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final APIRatingResponse rating;

  APIProductResponse({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory APIProductResponse.fromJson(JSON json) =>
      _$APIProductResponseFromJson(json);

  JSON toJson() => _$APIProductResponseToJson(this);
}
