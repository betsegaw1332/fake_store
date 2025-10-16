import 'package:fake_store/service_locator.dart';
import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/domain/domain.dart';

class SignInUser {
  final APIAuthRepository _apiAuthRepository;

  SignInUser()
    : _apiAuthRepository = serviceLocator.get<APIAuthRepositoryImpl>();

  Future<DataState<void>> call({required APISignInRequest request}) async {
    return _apiAuthRepository.authSignIn(request: request);
  }
}
