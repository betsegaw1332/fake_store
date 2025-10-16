import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_product_service.g.dart';

@RestApi(baseUrl: AppEndpoints.apiBaseUrl, parser: Parser.JsonSerializable)
abstract class APIProductService {
  factory APIProductService(Dio dio, {String baseUrl}) = _APIProductService;

  @GET(AppEndpoints.productsApi)
  Future<HttpResponse<List<APIProductResponse>>> getProducts();
}
