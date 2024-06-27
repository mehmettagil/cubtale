part of 'menu_burger_bloc.dart';

abstract class MenuBurgerEvent extends Equatable {
  const MenuBurgerEvent();

  @override
  List<Object> get props => [];
}

class MenuBurgerChangeStateEvent extends MenuBurgerEvent {
  const MenuBurgerChangeStateEvent();
}
