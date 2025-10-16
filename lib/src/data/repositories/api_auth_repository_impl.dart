import 'package:fake_store/service_locator.dart';
import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/domain/domain.dart';

class APIAuthRepositoryImpl extends APIBaseRepository
    implements APIAuthRepository {
  final APIAuthService _apiAuthService;
  APIAuthRepositoryImpl()
    : _apiAuthService = serviceLocator.get<APIAuthService>();

  @override
  Future<DataState<void>> authSignIn({
    required APISignInRequest request,
  }) {
    return getStateOf<void>(
      request: () => _apiAuthService.authSignIn(request: request),
    );
  }
}
