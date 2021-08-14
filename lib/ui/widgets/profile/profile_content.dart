import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/profile/profile_bloc.dart';
import '../../../theme/app_color.dart';
import 'details.dart';
import 'profile_card.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacer(),
        ProfileCard(),
        Spacer(),
        Details(
          title: 'Email address',
          desc: 'chiromorgan@gmail.com',
        ),
        Spacer(),
        Details(
          title: 'Account ID',
          desc: '18-92768AC009',
        ),
        Spacer(),
        Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Method',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppColor.kTextColor1,
                      ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/image_placeholder.svg',
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    SvgPicture.asset(
                      'assets/images/image_placeholder.svg',
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    SvgPicture.asset(
                      'assets/images/image_placeholder.svg',
                      width: 20.w,
                    ),
                  ],
                )
              ],
            )),
            GestureDetector(
              onTap: () =>
                  BlocProvider.of<ProfileBloc>(context).add(SetPayment()),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.w,
                  horizontal: 8.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4.r,
                  ),
                  color: AppColor.kPlaceholder2,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14.sp,
                  color: AppColor.kTextColor1,
                ),
              ),
            )
          ],
        ),
        Spacer(),
        Row(
          children: [
            Expanded(
              child: Details(
                title: 'Help and support',
                desc: 'afofa@ymail.com',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 8.w,
                  horizontal: 8.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4.r,
                  ),
                  color: AppColor.kPlaceholder2,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14.sp,
                  color: AppColor.kTextColor1,
                ),
              ),
            )
          ],
        ),
        Spacer(),
        Details(
          title: 'Version',
          desc: '1.01.2',
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/logout.svg',
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                'Logout',
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }
}
