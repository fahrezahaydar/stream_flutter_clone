// ignore_for_file: prefer_const_constructors

import 'package:stream/domain/library.dart';

import 'package:stream/infrastructure/config/sizes.dart';
import 'package:stream/infrastructure/config/pcolors.dart';
import 'package:stream/infrastructure/theme/color_scheme.dart';
import 'package:stream/infrastructure/theme/text_theme.dart';

class Themes {
  //App Basic Color

  static final light = ThemeData(
      brightness: Brightness.light,
      primaryColor: white,
      colorScheme: streamLight,
      iconTheme: IconThemeData(color: black),
      appBarTheme: AppBarTheme(
          color: white,
          shadowColor: transparent,
          iconTheme: const IconThemeData(color: black),
          actionsIconTheme: const IconThemeData(color: black),
          titleTextStyle: GoogleFonts.ptSans(fontSize: 20, color: black)),
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              alignment: Alignment.center,
              padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
              backgroundColor: MaterialStatePropertyAll<Color>(primary),
              foregroundColor: MaterialStatePropertyAll<Color>(white),
              textStyle: MaterialStatePropertyAll(TextStyle(
                  color: white,
                  fontSize: buttonSmall,
                  fontWeight: FontWeight.w700)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        alignment: Alignment.center,
        overlayColor: MaterialStateProperty.all(transparent),
        splashFactory: NoSplash.splashFactory,
        foregroundColor: MaterialStateProperty.all(transparent),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      )),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.zero,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: grey600!)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primary)),
          hintStyle: GoogleFonts.ptSans(
              color: grey400, fontSize: 16, fontWeight: FontWeight.w400)),
      textTheme: textThemeLight,
      dividerTheme:
          DividerThemeData(color: streamLight.outline, thickness: 1, space: 0));

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: black,
    iconTheme: IconThemeData(color: white),
    colorScheme: streamDark,
    appBarTheme: AppBarTheme(
        color: black,
        shadowColor: transparent,
        iconTheme: const IconThemeData(color: white),
        actionsIconTheme: const IconThemeData(color: white),
        titleTextStyle: GoogleFonts.ptSans(fontSize: 20, color: white)),
    scaffoldBackgroundColor: black,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            alignment: Alignment.center,
            padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
            backgroundColor: MaterialStatePropertyAll<Color>(primary),
            foregroundColor: MaterialStatePropertyAll<Color>(white),
            textStyle: MaterialStatePropertyAll(TextStyle(
                color: white,
                fontSize: buttonSmall,
                fontWeight: FontWeight.w700)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))))),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      alignment: Alignment.center,
      overlayColor: MaterialStateProperty.all(transparent),
      splashFactory: NoSplash.splashFactory,
      foregroundColor: MaterialStateProperty.all(transparent),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
    )),
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: grey400!)),
        focusedBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: primary)),
        hintStyle: GoogleFonts.ptSans(
            color: grey600, fontSize: 16, fontWeight: FontWeight.w400)),
    textTheme: textThemeDark,
    dividerTheme:
        DividerThemeData(color: streamLight.outline, thickness: 1, space: 0),
  );
}

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.isTrue ? ThemeMode.dark : ThemeMode.light);
  }

  @override
  void onInit() {
    super.onInit();
    // You can initialize the theme mode based on user preferences or system settings here.
  }
}
