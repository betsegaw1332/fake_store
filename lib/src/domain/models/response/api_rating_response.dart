import 'package:fake_store/src/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_rating_response.g.dart';

@JsonSerializable()
class APIRatingResponse {
  final double rate;
  final int count;

  APIRatingResponse({required this.rate, required this.count});

  factory APIRatingResponse.fromJson(JSON json) =>
      _$APIRatingResponseFromJson(json);

  JSON toJson() => _$APIRatingResponseToJson(this);
}
