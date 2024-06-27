part of "../../login/login_view.dart";

BlocListener<LoginBloc, LoginState> _getLoginCheckListener() {
  return BlocListener<LoginBloc, LoginState>(
    listenWhen: (previous, current) {
      return previous.processFailureOrUnitOption !=
          current.processFailureOrUnitOption;
    },
    listener: (context, state) {
      if (state.processFailureOrUnitOption.isSome()) {
        final failure =
            state.processFailureOrUnitOption.fold(() => null, (a) => a);
        if (failure!.isRight()) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeView()));
          });
        }
      }
    },
  );
}

BlocListener<LoginBloc, LoginState> _getLoginCheckErrorListener() {
  return BlocListener<LoginBloc, LoginState>(listenWhen: (previous, current) {
    return previous.processFailureOrUnitOption !=
        current.processFailureOrUnitOption;
  }, listener: (context, state) {
    if (state.processFailureOrUnitOption.isSome()) {
      final failure =
          state.processFailureOrUnitOption.fold(() => null, (a) => a);
      if (failure!.isLeft()) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const ErrorView(errorMessage: "HATA");
            },
          );
          context.read<LoginBloc>().add(const LoginClearEvent());
        });
      }
    }
  });
}
