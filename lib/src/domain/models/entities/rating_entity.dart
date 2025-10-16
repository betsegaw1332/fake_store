import 'package:fake_store/src/domain/domain.dart';

class RatingEntity {
  final double rate;
  final int count;

  RatingEntity({required this.count, required this.rate});

  factory RatingEntity.fromResponse({required APIRatingResponse response}) {
    return RatingEntity(count: response.count, rate: response.rate);
  }
  factory RatingEntity.mockData() {
    return RatingEntity(count: 0, rate: 0);
  }

  RatingEntity copyWith({int? count, double? rate}) {
    return RatingEntity(count: count ?? this.count, rate: rate ?? this.rate);
  }
}
