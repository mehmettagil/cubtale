import 'package:cubtale/app_bloc/login/login_bloc.dart';
import 'package:cubtale/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

BlocListener<LoginBloc, LoginState> getAuthListener() {
  return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          previous.processFailureOrUnitOption !=
          current.processFailureOrUnitOption,
      listener: (context, state) {

        if (state.processFailureOrUnitOption.isNone()) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ), (route) => false);
        }
      });
}
