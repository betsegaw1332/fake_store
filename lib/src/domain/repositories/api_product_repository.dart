import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/domain/domain.dart';

abstract class APIProductRepository {
  Future<DataState<List<APIProductResponse>>> getProducts();
}
