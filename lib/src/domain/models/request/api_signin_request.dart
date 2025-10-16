import 'package:fake_store/src/utils/app_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_signin_request.g.dart';

@JsonSerializable()
class APISignInRequest {
  final String username;
  final String password;

  const APISignInRequest({required this.username, required this.password});

  JSON toJson() => _$APISignInRequestToJson(this);
}
