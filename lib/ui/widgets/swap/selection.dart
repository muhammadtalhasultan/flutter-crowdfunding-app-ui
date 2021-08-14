import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/swap/swap_bloc.dart';
import '../../../theme/app_animation.dart';
import '../../../theme/app_color.dart';

class Selection extends StatelessWidget {
  const Selection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColor.kPrimaryColor.withOpacity(0.3),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<SwapBloc>(context)
                    .state
                    .controller
                    .animateToPage(
                      0,
                      duration: AppAnimation.kAnimationDuration,
                      curve: AppAnimation.kAnimationCurve,
                    );
                BlocProvider.of<SwapBloc>(context).add(
                  SetSwap(true),
                );
              },
              child: BlocBuilder<SwapBloc, SwapState>(
                builder: (context, state) {
                  return AnimatedContainer(
                    duration: AppAnimation.kAnimationDuration,
                    curve: AppAnimation.kAnimationCurve,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: state.isDonation ? AppColor.kPrimaryColor : null,
                    ),
                    child: Center(
                      child: Text(
                        'Donation',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
              child: GestureDetector(
            onTap: () {
              BlocProvider.of<SwapBloc>(context).state.controller.animateToPage(
                    1,
                    duration: AppAnimation.kAnimationDuration,
                    curve: AppAnimation.kAnimationCurve,
                  );
              BlocProvider.of<SwapBloc>(context).add(SetSwap(false));
            },
            child: BlocBuilder<SwapBloc, SwapState>(
              builder: (context, state) {
                return AnimatedContainer(
                  duration: AppAnimation.kAnimationDuration,
                  curve: AppAnimation.kAnimationCurve,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: !state.isDonation ? AppColor.kPrimaryColor : null,
                  ),
                  child: Center(
                    child: Text(
                      'My Charity',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
