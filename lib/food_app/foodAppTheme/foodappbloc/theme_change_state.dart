import 'package:equatable/equatable.dart';
import 'package:mobile_team_ui_app/food_app/foodAppTheme/foodappbloc/theme_state_food.dart';

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
