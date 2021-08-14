import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class AppTheme {
  AppTheme(this.context);

  BuildContext context;

  ThemeData initTheme() {
    return ThemeData(
      primarySwatch: Colors.green,
      primaryColor: AppColor.kPrimaryColor,
      buttonColor: AppColor.kPrimaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(0, 0.h),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          backgroundColor: MaterialStateProperty.all(
            AppColor.kAccentColor,
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            AppColor.kAccentColor,
          ),
          minimumSize: MaterialStateProperty.all(
            Size(0, 56.h),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: AppColor.kAccentColor,
            ),
          ),
        ),
      ),
      textTheme: GoogleFonts.openSansTextTheme(
        TextTheme().copyWith(
          headline1: TextStyle(
            fontSize: 32.sp,
            color: AppColor.kTitle,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 32.sp,
            color: AppColor.kTitle,
          ),
          headline3: TextStyle(
            fontSize: 24.sp,
            color: AppColor.kTitle,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 24.sp,
            color: AppColor.kTitle,
          ),
          headline5: TextStyle(
            fontSize: 20.sp,
            color: AppColor.kTitle,
          ),
          headline6: TextStyle(
            fontSize: 16.sp,
            color: AppColor.kTitle,
          ),
          bodyText1: TextStyle(
            fontSize: 12.sp,
            color: AppColor.kTitle,
          ),
          bodyText2: TextStyle(
            fontSize: 14.sp,
            color: AppColor.kTitle,
          ),
        ),
      ),
    );
  }
}
