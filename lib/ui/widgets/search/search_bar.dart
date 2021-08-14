import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/app_color.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    this.textInputAction,
    this.onSubmitted,
    this.onTap,
    this.controller,
    this.hintText,
  });

  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
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
                vertical: 16.h,
              )),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 8.w,
          child: Center(
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: 40.h,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColor.kPrimaryColor,
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/search.svg',
                    width: 20.w,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
