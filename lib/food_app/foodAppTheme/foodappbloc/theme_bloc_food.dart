import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mobile_team_ui_app/food_app/foodAppTheme/foodappbloc/theme_change_state.dart';

import 'theme_change_event_food.dart';

class FoodThemeChangeBloc
    extends HydratedBloc<FoodAppThemeChangeEvent, FoodThemeChangeState> {
  @override
  FoodThemeChangeState get initialState =>
      super.initialState ?? LightThemeState();

  @override
  FoodThemeChangeState fromJson(Map<String, dynamic> json) {
    bool isLightMode = json["isLightMode"] as bool;
    if (isLightMode) {
      return LightThemeState();
    } else {
      return DarkThemeState();
    }
  }

  @override
  Map<String, dynamic> toJson(FoodThemeChangeState state) {
    return {"isLightMode": state.themeState.isLightMode};
  }

  @override
  Stream<FoodThemeChangeState> mapEventToState(
      FoodAppThemeChangeEvent event) async* {
    if (event is FoodAppOnThemeChangedEvent) {
      yield* _onChangedTheme(event.lightMode);
    }
  }

  Stream<FoodThemeChangeState> _onChangedTheme(bool lightMode) async* {
    if (lightMode) {
      yield LightThemeState();
    } else {
      yield DarkThemeState();
    }
  }
}
