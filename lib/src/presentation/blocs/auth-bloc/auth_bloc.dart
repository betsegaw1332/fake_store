import 'package:equatable/equatable.dart';
import 'package:fake_store/service_locator.dart';
import 'package:fake_store/src/config/config.dart';
import 'package:fake_store/src/data/data.dart';
import 'package:fake_store/src/domain/domain.dart';
import 'package:fake_store/src/utils/utils.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
    : _signInUserUsecase = serviceLocator<SignInUser>(),

      super(const AuthState(stateStatus: AppStateStatus.initial)) {
    on<UserSignInEvent>(_onSignInUser);
    on<LogoutEvent>(_onUserLogout);
  }

  final prefs = SharedPrefService();
  final SignInUser _signInUserUsecase;

  Future<void> _onSignInUser(
    UserSignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(stateStatus: AppStateStatus.loadingBody));

    final signInResponse = await _signInUserUsecase(
      request: APISignInRequest(
        username: event.username,
        password: event.password,
      ),
    );

    if (signInResponse is DataSuccess) {
      await prefs.setString(AppConstants.usernameKey, event.username);
      await prefs.setBool(AppConstants.isLoggedInKey, true);
      emit(AuthState(stateStatus: AppStateStatus.successSubmit));
    } else {
      emit(
        state.copyWith(
          stateStatus: AppStateStatus.error,
          error: UserSigninFailed(),
        ),
      );
    }
  }

  Future<void> _onUserLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    await prefs.clear();
  }
}
