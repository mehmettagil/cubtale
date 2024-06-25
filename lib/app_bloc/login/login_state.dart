part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState(
      {required this.email,
      required this.password,
      required this.processFailureOrUnitOption,
      required this.showError});

  factory LoginState.initial() {
    return const LoginState(
        email: "",
        password: "",
        processFailureOrUnitOption: None(),
        showError: false);
  }

  final String email;
  final String password;
  final Option<Either<LoginRepositoryFailure, UserModel>>
      processFailureOrUnitOption;
  final bool showError;

  LoginState copyWith(
      {String? email,
      String? password,
      Option<Either<LoginRepositoryFailure, UserModel>>?
          processFailureOrUnitOption,
      bool? showError}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        processFailureOrUnitOption:
            processFailureOrUnitOption ?? this.processFailureOrUnitOption,
        showError: showError ?? this.showError);
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,}$',
        caseSensitive: false);

    return emailRegex.hasMatch(email);
  }

  @override
  List<Object> get props => [email, password, processFailureOrUnitOption,showError];
}
