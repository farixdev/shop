import 'package:flutter/material.dart';

import 'package:shop/utils/theme/custom_themes/appbar_theme.dart';
import 'package:shop/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:shop/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:shop/utils/theme/custom_themes/chip_theme.dart';
import 'package:shop/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:shop/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:shop/utils/theme/custom_themes/text_field_theme.dart';
import 'package:shop/utils/theme/custom_themes/text_theme.dart';
import 'package:shop/utils/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: FTextAppTheme.lightTextTheme, 
    elevatedButtonTheme: FAppElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: FAppBarTheme.lightBarTheme,
    bottomSheetTheme: FBottomSheetTheme.lightTBottomSheetTheme,
    checkboxTheme: FCheckboxTheme.lightCheckboxTheme,
    chipTheme: FChipTheme.lightChipTheme,
    outlinedButtonTheme: FOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: FTextFormFeildTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(

    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: FColors.dark,
    textTheme: FTextAppTheme.darkTextTheme, 
    elevatedButtonTheme: FAppElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: FAppBarTheme.darkBarTheme,
    bottomSheetTheme: FBottomSheetTheme.darkTBottomSheetTheme,
    checkboxTheme: FCheckboxTheme.darkCheckboxTheme,
    chipTheme: FChipTheme.darkChipTheme,
    outlinedButtonTheme: FOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: FTextFormFeildTheme.darkInputDecorationTheme
  );
}
