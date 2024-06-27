part of 'menu_burger_bloc.dart';

class MenuBurgerState extends Equatable {
  const MenuBurgerState({
    required this.menuBurgerState,
    required this.userModel,
  });

  factory MenuBurgerState.initial() {
    return MenuBurgerState(
      menuBurgerState: false,
      userModel: none(),
    );
  }

  final bool menuBurgerState;
  final Option<UserModel> userModel;

  MenuBurgerState copyWith({
    bool? menuBurgerState,
    Option<UserModel>? userModel,
  }) {
    return MenuBurgerState(
      menuBurgerState: menuBurgerState ?? this.menuBurgerState,
      userModel: userModel ?? this.userModel,
    );
  }

  UserModel? get userModelValue => userModel.fold(() => null, (a) => a);

  @override
  List<Object> get props => [
        menuBurgerState,
        userModel,
      ];
}
