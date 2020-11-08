import 'package:equatable/equatable.dart';

abstract class FoodAppThemeChangeEvent extends Equatable {}

class FoodAppOnThemeChangedEvent extends FoodAppThemeChangeEvent {
  final bool lightMode;

  FoodAppOnThemeChangedEvent(this.lightMode);

  @override
  List<Object> get props => [lightMode];
}
