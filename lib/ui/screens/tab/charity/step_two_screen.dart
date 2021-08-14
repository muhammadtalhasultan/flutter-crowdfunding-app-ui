import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../routes/routes.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/charity/charity_input_field.dart';
import '../../../widgets/charity/charity_scaffold.dart';
import '../../../widgets/charity/steps.dart';

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen();

  @override
  Widget build(BuildContext context) {
    return CharityScaffold(
      children: [
        Text(
          'Start a Charity',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 24.h,
        ),
        Text(
          'Complete your personal information to proceed to this charity program',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 24.h,
        ),
        Steps(1, 4),
        Spacer(),
        CharityInputField('Title for This Program'),
        Spacer(),
        CharityInputField('Who are the benefit recipients'),
        Spacer(),
        CharityInputField(
          'Target',
          assetName: 'assets/images/dollar.svg',
        ),
        Spacer(),
        CharityInputField(
          'Deadline',
          assetName: 'assets/images/calander.svg',
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.r),
              ),
              builder: (_) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewPadding.bottom,
                  top: 32.h,
                  left: 16.w,
                  right: 16.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CharityInputField(
                      'Date the program started',
                      hintText: 'DD/MM/YYYY',
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    CharityInputField(
                      'Date the program ended',
                      hintText: 'DD/MM/YYYY',
                    ),
                    SizedBox(
                      height: 8.h,
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Done',
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Spacer(),
      ],
      button: Container(
        decoration: BoxDecoration(
          color: AppColor.kPlaceholder1.withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            8.r,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.transparent,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    AppColor.kPlaceholder1,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Previous',
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(
                    AppColor.kAccentColor,
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    AppColor.kPrimaryColor,
                  ),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(RouteGenerator.stepThree),
                child: Text(
                  'Next',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
