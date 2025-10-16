import 'package:fake_store/service_locator.dart';
import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/domain/domain.dart';

class APIProductRepositoryImpl extends APIBaseRepository
    implements APIProductRepository {
  final APIProductService _apiProductService;
  APIProductRepositoryImpl()
    : _apiProductService = serviceLocator.get<APIProductService>();

  @override
  Future<DataState<List<APIProductResponse>>> getProducts() {
    return getStateOf<List<APIProductResponse>>(
      request: () => _apiProductService.getProducts(),
    );
  }
}
