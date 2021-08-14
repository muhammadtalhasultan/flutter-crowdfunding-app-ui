import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../bloc/swap/swap_bloc.dart';
import '../../../theme/app_color.dart';

List<Widget> contents = [DonationContent(), CharityContent()];

class EmptyContent extends StatelessWidget {
  const EmptyContent();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: BlocProvider.of<SwapBloc>(context).state.controller,
      itemCount: contents.length,
      onPageChanged: (index) {
        BlocProvider.of<SwapBloc>(context).add(SetSwap(index == 0));
      },
      itemBuilder: (_, index) => contents[index],
    );
  }
}

class CharityContent extends StatelessWidget {
  const CharityContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/activity.svg',
            width: 120.w,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'You haven\'t start a charity',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColor.kForthColor,
                ),
          ),
          SizedBox(
            width: 200.w,
            child: Text(
              'Maybe you have someone to help? Go create charity program by your own.',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: AppColor.kForthColor,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DonationContent extends StatelessWidget {
  const DonationContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/activity.svg',
            width: 120.w,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'There is no latest activity',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColor.kForthColor,
                ),
          ),
          SizedBox(
            width: 200.w,
            child: Text(
              'There is no activity right now, start donate and spread your love with others.',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: AppColor.kForthColor,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
