import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/charity.dart';
import '../../../../routes/routes.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/charity/category_card.dart';
import '../../../widgets/charity/charity_screen_path.dart';

class StartCharityScreen extends StatelessWidget {
  const StartCharityScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      32.r,
                    ),
                    color: Colors.white,
                  ),
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Start a Charity',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            'Choose the type of your charity program',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CatrgoryCard(
                              charities[0],
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            CatrgoryCard(
                              charities[1],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CatrgoryCard(
                              charities[2],
                            ),
                            SizedBox(
                              width: 40.w,
                            ),
                            CatrgoryCard(
                              charities[3],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CatrgoryCard(
                              charities[4],
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 96.h,
                color: Colors.white,
                child: ClipPath(
                  clipper: CharityScreenPath(),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: AppColor.kPrimaryColor,
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 72.h,
            left: 0.5.sw - 46.w,
            width: 92.w,
            child: SizedBox(
              width: 92.w,
              height: 92.w,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(CircleBorder()),
                  minimumSize: MaterialStateProperty.all(Size(0, 0)),
                  backgroundColor: MaterialStateProperty.all(
                    AppColor.kPrimaryColor,
                  ),
                  elevation: MaterialStateProperty.all(0),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(RouteGenerator.stepOne),
                child: Icon(
                  Icons.arrow_forward,
                  size: 48.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
