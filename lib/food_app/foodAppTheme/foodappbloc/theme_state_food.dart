import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeStateFood extends Equatable{
  final bool isLightMode;
  final ThemeMode themeMode;
  const ThemeStateFood(this.isLightMode, this.themeMode);

  factory ThemeStateFood.light() {
    return ThemeStateFood(true, ThemeMode.light);
  }
  factory ThemeStateFood.dark() {
    return ThemeStateFood(false, ThemeMode.dark);
  }
  @override
  List<Object> get props => [isLightMode,themeMode];

}

