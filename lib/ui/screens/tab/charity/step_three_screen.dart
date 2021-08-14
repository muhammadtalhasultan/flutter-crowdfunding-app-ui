import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../routes/routes.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/charity/charity_scaffold.dart';
import '../../../widgets/charity/steps.dart';

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen();

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
        Steps(2, 4),
        SizedBox(
          height: 24.h,
        ),
        Text(
          'Upload a photo as a thumbnail',
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          child: DottedBorder(
            color: AppColor.kPlaceholder1,
            strokeWidth: 2.sp,
            borderType: BorderType.RRect,
            radius: Radius.circular(8.r),
            dashPattern: [15, 10],
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                child: Center(
                  child: Container(
                    width: 130.w,
                    height: 130.w,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        32.r,
                      ),
                      color: AppColor.kPlaceholder2,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/image.svg',
                          width: 32.w,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          'Drag & Drop your file here',
                          style: TextStyle(
                            color: AppColor.kTextColor2,
                            fontSize: 12.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          'Description',
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          child: TextField(
            expands: true,
            minLines: null,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.kPlaceholder2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
                borderSide: BorderSide.none,
              ),
              hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: AppColor.kTextColor1,
                  ),
            ),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
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
                    Navigator.of(context).pushNamed(RouteGenerator.stepFour),
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
