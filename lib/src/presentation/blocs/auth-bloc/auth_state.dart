part of 'auth_bloc.dart';


class AuthState extends Equatable {
  final AppStateStatus stateStatus;
  final AppError? error;

  const AuthState({
    required this.stateStatus,
    this.error,
  });

  @override
  List<Object?> get props => [stateStatus, error,];

  AuthState copyWith(
      {AppStateStatus? stateStatus,
      AppError? error,
    }) {
    return AuthState(
        stateStatus: stateStatus ?? this.stateStatus,
        error: error ?? this.error,
      );
  }
}