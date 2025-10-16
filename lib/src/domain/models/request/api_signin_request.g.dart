// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_signin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APISignInRequest _$APISignInRequestFromJson(Map<String, dynamic> json) =>
    APISignInRequest(
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$APISignInRequestToJson(APISignInRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };
