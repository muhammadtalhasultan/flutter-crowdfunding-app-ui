import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/app_color.dart';
import '../charity/charity_input_field.dart';

class EditContent extends StatelessWidget {
  const EditContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: 120.w,
          height: 120.w,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 120.w,
                width: 120.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                  color: AppColor.kBlue,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/image_placeholder.svg',
                    width: 32.w,
                  ),
                ),
              ),
              Positioned(
                right: -12.w,
                bottom: -12.w,
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    'assets/images/edit.svg',
                    width: 32.w,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Spacer(),
        Row(
          children: [
            Expanded(
              child: CharityInputField(
                'First Name',
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: CharityInputField(
                'Last Name',
              ),
            ),
          ],
        ),
        Spacer(),
        CharityInputField('Email'),
        Spacer(),
        CharityInputField(
          'Phone Number',
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
        ),
      ],
    );
  }
}
