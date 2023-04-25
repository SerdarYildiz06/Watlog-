import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

ThemeData darkTheme = ThemeData(
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return ColorConstants.instance.green; //radio button selected color
        }
        return Colors.grey; // radio button unselected color
      },
    ),
  ),
  scaffoldBackgroundColor: ColorConstants.instance.bacgroundColors,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: ColorConstants.instance.bacgroundColors),
);
