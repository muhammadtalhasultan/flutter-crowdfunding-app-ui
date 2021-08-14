import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_color.dart';
import 'payment_method.dart';

class PaymentContent extends StatelessWidget {
  const PaymentContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        ...List.generate(
          3,
          (index) => Column(
            children: [
              PaymentMethod(),
              SizedBox(
                height: 8.h,
              )
            ],
          ),
        ),
        DottedBorder(
          color: AppColor.kTextColor1,
          strokeWidth: 2.sp,
          borderType: BorderType.RRect,
          radius: Radius.circular(8.r),
          dashPattern: [15, 10],
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 60.h,
              child: Center(
                child: Text(
                  'Add new method',
                  style: TextStyle(
                    color: AppColor.kTextColor1,
                  ),
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              AppColor.kPrimaryColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              Size(
                double.infinity,
                56.h,
              ),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Save Change',
          ),
        ),
        SizedBox(
          height: 40.h,
        )
      ],
    );
  }
}
