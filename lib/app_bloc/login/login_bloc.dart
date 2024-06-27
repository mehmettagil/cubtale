import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubtale/basic_structure/failure/login/login_repository_failure.dart';
import 'package:cubtale/basic_structure/manager/cache_key.dart';
import 'package:cubtale/basic_structure/manager/i_cache_manager.dart';
import 'package:cubtale/basic_structure/repository/login/i_login_repository.dart';
import 'package:cubtale/core/mixin/api_header_getter_mixin.dart';
import 'package:cubtale/core/model/user/user_model.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>
    with ApiHeaderCallbackGetterMixin {
  LoginBloc(this._iLoginRepository, this._iCacheManager)
      : super(LoginState.initial()) {
    on<LoginFetchEvent>(
      _onLoginFetchEvent,
    );

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
    on<LoginLogoutEvent>(
      _onLoginLogoutEvent,
    );
  }
  final ILoginRepository _iLoginRepository;
  final ICacheManager _iCacheManager;
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
      if (checkLogin.isRight()) {
        final userData = checkLogin.fold((l) => null, (r) => r);
        if (userData != null) {
          await _iCacheManager.writeMap(
              key: CacheKey.USER_DATA, value: userData.toMap());
          await _iCacheManager.writeString(
              key: CacheKey.LAST_LOGIN, value: DateTime.now().toString());
        }
      }

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

  Future<void> _onLoginLogoutEvent(
      LoginLogoutEvent event, Emitter<LoginState> emit) async {
    await _iCacheManager.delete(key: CacheKey.USER_DATA);
    await _iCacheManager.delete(key: CacheKey.LAST_LOGIN);
    emit(state.copyWith(processFailureOrUnitOption: none()));
  }

  Future<void> _onLoginFetchEvent(
      LoginFetchEvent event, Emitter<LoginState> emit) async {
    final userData = _iCacheManager.readMap(key: CacheKey.USER_DATA);
    if (userData != null) {
      final lastLogin = _iCacheManager.readString(key: CacheKey.LAST_LOGIN);
      if (lastLogin != null) {
        final lastLoginDate = DateTime.parse(lastLogin);
        if (lastLoginDate
            .isBefore(DateTime.now().subtract(const Duration(days: 14)))) {
          await _iCacheManager.delete(key: CacheKey.USER_DATA);
          return;
        }
      }
      emit(state.copyWith(
        processFailureOrUnitOption: some(right(UserModel.fromMap(userData))),
      ));
      await _iCacheManager.writeString(
          key: CacheKey.LAST_LOGIN, value: DateTime.now().toString());
    }
  }
}
