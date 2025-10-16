import 'package:fake_store/service_locator.dart';
import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/domain/domain.dart';

class GetProducts {
  final APIProductRepository _apiProductRepository;

  GetProducts()
    : _apiProductRepository = serviceLocator.get<APIProductRepositoryImpl>();

  Future<DataState<List<APIProductResponse>>> call() async {
    return _apiProductRepository.getProducts();
  }
}
