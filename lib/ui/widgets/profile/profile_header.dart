import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/profile/profile_bloc.dart';
import '../../../theme/app_color.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<ProfileBloc>(context).add(SetHome());
          },
          child: SizedBox(
            width: 24.w,
            child: SvgPicture.asset(
              'assets/images/back.svg',
              width: 24.w,
              color: AppColor.kTitle,
            ),
          ),
        ),
        Expanded(
          child: Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: AppColor.kTitle,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          width: 24.w,
        )
      ],
    );
  }
}
