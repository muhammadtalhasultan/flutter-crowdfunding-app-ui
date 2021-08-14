import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../routes/routes.dart';
import '../../../theme/app_color.dart';
import '../../widgets/authentication/custom_input_field.dart';

class ForgetPwScreen extends StatelessWidget {
  const ForgetPwScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh -
                MediaQuery.of(context).viewPadding.bottom -
                MediaQuery.of(context).viewPadding.top,
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                    ),
                    child: Center(
                      child: Container(
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
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Forget',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: AppColor.kPrimaryColor,
                                  ),
                            ),
                            Text(
                              'Password?',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    color: AppColor.kPrimaryColor,
                                  ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              'Enter your email associated with your account and we\'ll '
                              'send an email with instruction to reset your password.',
                              style: TextStyle(
                                color: AppColor.kTextColor1,
                              ),
                            ),
                            SizedBox(
                              height: 64.h,
                            ),
                            CustomInputField(
                              hintText: 'email address',
                              textInputAction: TextInputAction.done,
                            ),
                            SizedBox(
                              height: 24.h,
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
                              onPressed: () =>
                                  Navigator.of(context).pushReplacementNamed(
                                RouteGenerator.main,
                              ),
                              child: Text(
                                'Submit',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
