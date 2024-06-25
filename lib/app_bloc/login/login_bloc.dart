import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubtale/basic_structure/failure/login/login_repository_failure.dart';
import 'package:cubtale/basic_structure/repository/login/i_login_repository.dart';
import 'package:cubtale/core/mixin/api_header_getter_mixin.dart';
import 'package:cubtale/core/model/user/user_model.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>
    with ApiHeaderCallbackGetterMixin {
  LoginBloc(
    this._iLoginRepository,
  ) : super(LoginState.initial()) {
    on<LoginEmailChangeEvent>(
      _onLoginEmailChangeEvent,
    );
    on<LoginPasswordChangeEvent>(
      _onLoginPasswordChangeEvent,
    );
    on<LoginClearEvent>(
      _onLoginClearEvent,
    );
    on<LoginCompleteEvent>(
      _onLoginCompleteEvent,
    );
  }
  final ILoginRepository _iLoginRepository;
  addLoginEmailChangeEvent({required String email}) {
    add(LoginEmailChangeEvent(email: email));
  }

  addLoginPasswordChangeEvent({required String password}) {
    add(LoginPasswordChangeEvent(password: password));
  }

  addLoginCompleteEvent() {
    add(const LoginCompleteEvent());
  }

  Future<void> _onLoginEmailChangeEvent(
      LoginEmailChangeEvent event, Emitter<LoginState> emit) async {
    if (event.email.length < 70) {
      emit(state.copyWith(email: event.email));
    }
  }

  Future<void> _onLoginPasswordChangeEvent(
      LoginPasswordChangeEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onLoginCompleteEvent(
      LoginCompleteEvent event, Emitter<LoginState> emit) async {
    if (state.email.isNotEmpty && state.password.isNotEmpty) {
      final checkLogin = await _iLoginRepository.login(
          email: state.email,
          password: state.password,
          apiHeaderCallback: apiHeaderCallback);

      emit(state.copyWith(processFailureOrUnitOption: some(checkLogin)));
    } else {
      emit(state.copyWith(
        processFailureOrUnitOption: some(
          left(
            const LoginRepositoryUnknownFailure("Email or password is empty"),
          ),
        ),
      ));
    }
  }

  Future<void> _onLoginClearEvent(
      LoginClearEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(processFailureOrUnitOption: none()));
  }
}
