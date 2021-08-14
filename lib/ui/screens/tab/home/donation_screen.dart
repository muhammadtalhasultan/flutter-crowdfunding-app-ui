import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../bloc/payment/payment_bloc.dart';
import '../../../../routes/routes.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/home/payment_method_widget.dart';

class DonationScreen extends StatelessWidget {
  DonationScreen(this.total);

  final String total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    32.r,
                  ),
                  bottomRight: Radius.circular(
                    32.r,
                  ),
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
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
                            'Donation Detail',
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
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
                    ),
                    Spacer(),
                    SizedBox(
                      height: 72.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            width: 104.w,
                            height: 72.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                8.r,
                              ),
                              color: AppColor.kPlaceholder1,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/images/image_placeholder.svg',
                                width: 48.w,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Help our buddy get better education',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'By: White Hat Organization',
                                  style: TextStyle(
                                    color: AppColor.kTextColor1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                      child: Text(
                        'Donate as anonymous',
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Payment Method',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 18.sp,
                            color: AppColor.kTitle,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Spacer(),
                    BlocProvider(
                      create: (context) => PaymentBloc(),
                      child: Column(
                        children: List.generate(
                          methods.length,
                          (index) => Column(
                            children: [
                              PaymentMethodWidget(index),
                              SizedBox(
                                height: 8.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    Row(
                      children: [
                        Text('Total',
                            style: Theme.of(context).textTheme.headline6),
                        Spacer(),
                        Text(
                          '\$$total',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 120.h,
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ),
                    ),
                  ),
                  foregroundColor: MaterialStateProperty.all(
                    AppColor.kPrimaryColor,
                  ),
                  minimumSize: MaterialStateProperty.all(
                    Size(
                      double.infinity,
                      48.h,
                    ),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(
                      horizontal: 24.w,
                    ),
                  ),
                ),
                onPressed: () {
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
                          SvgPicture.asset(
                            'assets/images/check.svg',
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Thank You',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            'Your donation has been succeed and will be '
                            'transferred soon to the needy.',
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 64.h,
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
                              Navigator.pushNamedAndRemoveUntil(context,
                                  RouteGenerator.main, (route) => false);
                            },
                            child: Text(
                              'Home',
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                child: Text('Donate'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
