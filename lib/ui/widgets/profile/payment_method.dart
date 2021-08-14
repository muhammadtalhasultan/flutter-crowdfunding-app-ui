import 'package:afofa/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.kPlaceholder2,
        borderRadius: BorderRadius.circular(
          8.r,
        ),
      ),
      padding: EdgeInsets.only(
        left: 16.w,
        right: 40.w,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/image_placeholder.svg',
            width: 16.w,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '189 6798',
                  style: TextStyle(
                    color: AppColor.kTextColor1,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                ...List.generate(
                  5,
                  (index) => Row(
                    children: [
                      Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.kTextColor1,
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
