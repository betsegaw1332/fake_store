import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/domain/domain.dart';

abstract class APIAuthRepository {
  Future<DataState<void>> authSignIn({
    required APISignInRequest request,
  });
}
