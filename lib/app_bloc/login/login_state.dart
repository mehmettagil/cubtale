part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.email,
    required this.password,
    required this.processFailureOrUnitOption,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: "",
      password: "",
      processFailureOrUnitOption: None(),
    );
  }

  final String email;
  final String password;
  final Option<Either<LoginRepositoryFailure, bool>> processFailureOrUnitOption;

  LoginState copyWith({
    String? email,
    String? password,
    Option<Either<LoginRepositoryFailure, bool>>? processFailureOrUnitOption,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      processFailureOrUnitOption:
          processFailureOrUnitOption ?? this.processFailureOrUnitOption,
    );
  }

  bool get isLogin {
    return processFailureOrUnitOption.fold(
        () => false, (a) => a.fold((l) => false, (r) => r));
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$',
        caseSensitive: false);

    return emailRegex.hasMatch(email);
  }

  @override
  List<Object> get props => [email, password, processFailureOrUnitOption];
}
