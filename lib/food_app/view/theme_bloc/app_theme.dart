part of 'bloc.dart';

final ThemeData lightTheme = _buildLightTheme();
final ThemeData darkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: kPrimaryColor,
    secondary: kAccentColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    colorScheme: colorScheme,
    primaryColor: kPrimaryColor,
    buttonColor: kPrimaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: kAccentColor,
    cardColor: Colors.white,
    splashColor: Colors.white24,
    accentColor: kAccentColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base;
}

ThemeData _buildDarkTheme() {
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: kPrimaryColor,
    secondary: kAccentColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    primaryColor: kPrimaryColor,
    cardColor: kCardColor,
    primaryColorDark: const Color(0xFF0050a0),
    primaryColorLight: kAccentColor,
    buttonColor: kPrimaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: kAccentColor,
    accentColor: kAccentColor,
    canvasColor: const Color(0xFF2A4058),
    scaffoldBackgroundColor: const Color(0xFF121A26),
    backgroundColor: const Color(0xFF0D1520),
    errorColor: const Color(0xFFB00020),
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base;
}
