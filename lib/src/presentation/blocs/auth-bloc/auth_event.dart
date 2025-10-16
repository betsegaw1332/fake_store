part of "auth_bloc.dart";

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class UserSignInEvent extends AuthEvent {
  UserSignInEvent({required this.username, required this.password});
  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}

class LogoutEvent extends AuthEvent{
}