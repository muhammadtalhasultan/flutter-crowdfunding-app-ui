import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_color.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    this.textInputAction,
    this.onSubmitted,
    this.controller,
    this.isPassword = false,
    this.hintText,
  });

  final bool isPassword;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      cursorColor: AppColor.kPrimaryColor,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.kPlaceholder3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.kTextColor1,
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 8.h,
        ),
      ),
    );
  }
}
