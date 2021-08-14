import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/profile/profile_bloc.dart';
import '../../../theme/app_color.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80.w,
          width: 80.w,
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
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chiro Morganisa',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '🇷🇺 +768-907-6969',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColor.kTextColor1,
                    ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => BlocProvider.of<ProfileBloc>(context).add(SetEdit()),
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
    );
  }
}
