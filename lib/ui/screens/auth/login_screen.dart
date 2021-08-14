import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../routes/routes.dart';
import '../../../theme/app_color.dart';
import '../../widgets/authentication/custom_input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'AFOFA',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: Colors.white,
                    ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(
                        16.w,
                        24.h,
                        16.w,
                        16.h,
                      ),
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.0.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                      ),
                      child: Column(
                        children: [
                          LoginForm(),
                          SizedBox(
                            height: 32.h,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).pushReplacementNamed(
                              RouteGenerator.signup,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have account? ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: AppColor.kTextColor1,
                                      ),
                                ),
                                Text(
                                  'Create new account',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: AppColor.kAccentColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 24.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.kPrimaryColor.withOpacity(
                              0.5,
                            ),
                            offset: Offset(
                              0,
                              2.h,
                            ),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: LoginForm(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                'Or Login With',
                style: TextStyle(
                  color: AppColor.kTextColor1,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/image_placeholder.svg',
                      width: 24.w,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/image_placeholder.svg',
                      width: 24.w,
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/image_placeholder.svg',
                      width: 24.w,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign in',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: AppColor.kPrimaryColor,
              ),
        ),
        Text(
          'to continue',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: AppColor.kPrimaryColor,
              ),
        ),
        SizedBox(
          height: 40.h,
        ),
        CustomInputField(
          hintText: 'Phone, email or username',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed(
                RouteGenerator.forgetPw,
              ),
              child: Text(
                'Forgot password?',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: AppColor.kAccentColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
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
            'Login',
          ),
        ),
      ],
    );
  }
}
