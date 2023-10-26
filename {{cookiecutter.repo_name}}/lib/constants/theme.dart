// Flutter imports:
import 'package:flutter/material.dart';
// Project imports:
import 'package:{{cookiecutter.repo_name}}/config/assets/colors.gen.dart';
// import 'package:{{cookiecutter.repo_name}}/config/assets/fonts.gen.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // fontFamily: AppFonts.frankRuhlLibreRegular,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primaryDark,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: AppColors.primaryDark),

    //!appbar
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.purpleDark),
      color: AppColors.white,
      titleTextStyle: TextStyle(color: AppColors.purpleDark, fontSize: 20),
      elevation: 0,
    ),

    //! Text
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600, color: AppColors.purpleDark,
        //  fontFamily: AppFonts.frankRuhlLibreRegular
      ),
      displayLarge: TextStyle(letterSpacing: 1, fontWeight: FontWeight.w600, color: AppColors.purpleDark),
    ).apply(bodyColor: AppColors.primaryDark),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primaryDark),
            shape: MaterialStateProperty.all(const StadiumBorder()),
            textStyle: MaterialStateProperty.all(const TextStyle(color: AppColors.white)))),
    //! dialog
    dialogTheme: const DialogTheme(
        backgroundColor: AppColors.white,
        contentTextStyle: TextStyle(color: AppColors.primaryDark),
        titleTextStyle: TextStyle(color: AppColors.primaryDark)),

    //! Input decoration
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.primaryLight),
      fillColor: AppColors.transparent,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.red,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryLight,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.red,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryDark,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    ),
  );
}
