import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/app_color.dart';

class CharityInputField extends StatelessWidget {
  const CharityInputField(
    this.title, {
    this.assetName,
    this.onTap,
    this.hintText,
  });

  final String title;
  final String? assetName;
  final void Function()? onTap;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(),
        ),
        SizedBox(
          height: 2.h,
        ),
        Stack(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.kPlaceholder2,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                  borderSide: BorderSide.none,
                ),
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColor.kTextColor1,
                    ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
              ),
            ),
            if (assetName != null)
              Positioned(
                top: 0,
                bottom: 0,
                left: 8.w,
                child: Center(
                  child: GestureDetector(
                    onTap: onTap,
                    child: Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.r,
                        ),
                        color: AppColor.kPrimaryColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          assetName!,
                          width: 16.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        )
      ],
    );
  }
}
