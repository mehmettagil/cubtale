part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginFetchEvent extends LoginEvent {
  const LoginFetchEvent();
}

class LoginEmailChangeEvent extends LoginEvent {
  final String email;

  const LoginEmailChangeEvent({required this.email});
}

class LoginEmailCheckEvent extends LoginEvent {
  const LoginEmailCheckEvent();
}

class LoginPasswordChangeEvent extends LoginEvent {
  final String password;

  const LoginPasswordChangeEvent({required this.password});
}

class LoginClearEvent extends LoginEvent {
  const LoginClearEvent();
}

class LoginCompleteEvent extends LoginEvent {
  const LoginCompleteEvent();
}
