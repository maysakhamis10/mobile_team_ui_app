part of 'bloc.dart';


abstract class FoodThemeChangeState extends Equatable {
  final ThemeStateFood themeState;

  FoodThemeChangeState(this.themeState);

  @override
  List<Object> get props => [themeState];
}

class LightThemeState extends FoodThemeChangeState {
  static final state = ThemeStateFood.light();

  LightThemeState() : super(state);
}

class DarkThemeState extends FoodThemeChangeState {
  static final state = ThemeStateFood.dark();

  DarkThemeState() : super(state);
}
