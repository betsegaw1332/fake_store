import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_auth_service.g.dart';

@RestApi(baseUrl: AppEndpoints.apiBaseUrl, parser: Parser.JsonSerializable)
abstract class APIAuthService {
  factory APIAuthService(Dio dio, {String baseUrl}) = _APIAuthService;

  @POST(AppEndpoints.signInApi)
  @FormUrlEncoded()
  Future<HttpResponse<void>> authSignIn({
    @Body() required APISignInRequest request,
  });
}
