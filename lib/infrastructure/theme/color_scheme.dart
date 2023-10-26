import 'package:stream/domain/library.dart';
import 'package:stream/infrastructure/config/pcolors.dart';

ColorScheme streamDark = ColorScheme.dark(
    brightness: Brightness.dark,
    background: black,
    onBackground: white,
    outline: white,
    onSurface: white,
    onSecondary: white,
    error: Colors.red,
    primary: primary,
    secondaryContainer: grey800,
    outlineVariant: grey600,
    surface: black,
    onPrimary: black,
    onError: black,
    tertiary: accent2,
    secondary: accent);

ColorScheme streamLight = ColorScheme.light(
    brightness: Brightness.light,
    background: white,
    onBackground: black,
    outline: black,
    onSurface: black,
    onSecondary: black,
    error: Colors.red,
    primary: primary,
    secondaryContainer: grey200,
    outlineVariant: grey400,
    surface: white,
    onPrimary: white,
    onError: white,
    tertiary: accent2,
    secondary: accent);
