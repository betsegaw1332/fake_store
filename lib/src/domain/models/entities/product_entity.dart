import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';

class ProductEntity {
  final int id;
  final double price;
  final String title;
  final String description;
  final String category;
  final String image;
  final RatingEntity rate;

  ProductEntity({
    required this.id,
    required this.price,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
  });

  factory ProductEntity.fromResponse({required APIProductResponse response}) {
    return ProductEntity(
      id: response.id,
      price: response.price,
      title: response.title,
      description: response.description.toNonNull,
      category: response.category.toNonNull,
      image: response.image,
      rate: RatingEntity.fromResponse(response: response.rating),
    );
  }
  factory ProductEntity.mockData() {
    return ProductEntity(
      id: 0,
      price: 0,
      title: '',
      description: AppConstants.mockText,
      category: AppConstants.mockText,
      image: AppConstants.placeholerImg,
      rate: RatingEntity(count: 0, rate: 0),
    );
  }

  ProductEntity copyWith({
    int? id,
    double? price,
    String? title,
    String? description,
    String? category,
    String? image,
    RatingEntity? rate,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      price: price ?? this.price,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rate: rate ?? this.rate,
    );
  }
}
