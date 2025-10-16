// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_rating_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIRatingResponse _$APIRatingResponseFromJson(Map<String, dynamic> json) =>
    APIRatingResponse(
      rate: (json['rate'] as num).toDouble(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$APIRatingResponseToJson(APIRatingResponse instance) =>
    <String, dynamic>{'rate': instance.rate, 'count': instance.count};
