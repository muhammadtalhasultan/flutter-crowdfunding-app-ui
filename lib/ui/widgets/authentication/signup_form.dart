import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routes/routes.dart';
import '../../../theme/app_color.dart';
import 'custom_input_field.dart';

class SignupForm extends StatelessWidget {
  const SignupForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create New',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: AppColor.kPrimaryColor,
              ),
        ),
        Text(
          'Account',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: AppColor.kPrimaryColor,
              ),
        ),
        SizedBox(
          height: 40.h,
        ),
        CustomInputField(
          hintText: 'Phone or email',
          textInputAction: TextInputAction.next,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomInputField(
          hintText: 'Username',
          textInputAction: TextInputAction.next,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomInputField(
          hintText: 'Password',
          isPassword: true,
          textInputAction: TextInputAction.done,
        ),
        SizedBox(
          height: 120.h,
        ),
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
          onPressed: () => Navigator.of(context).pushReplacementNamed(
            RouteGenerator.main,
          ),
          child: Text(
            'Create Account',
          ),
        ),
      ],
    );
  }
}
