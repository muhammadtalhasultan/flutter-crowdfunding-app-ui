import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../bloc/payment/payment_bloc.dart';
import '../../../models/payment_method.dart';
import '../../../theme/app_animation.dart';
import '../../../theme/app_color.dart';

final List<PaymentMethod> methods = [
  PaymentMethod(
    name: 'Credit Card',
    assetName: 'assets/images/visa.png',
  ),
  PaymentMethod(
    name: 'Bank Transfer',
    assetName: 'assets/images/bca.png',
  ),
  PaymentMethod(
    name: 'PayPal',
    assetName: 'assets/images/paypal.png',
  )
];

class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    final PaymentMethod method = methods[index];

    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                BlocProvider.of<PaymentBloc>(context).add(ChangePayment(index));
              },
              child: AnimatedContainer(
                duration: AppAnimation.kAnimationDuration,
                curve: AppAnimation.kAnimationCurve,
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: state.index == index
                        ? AppColor.kPrimaryColor
                        : AppColor.kPlaceholder2,
                    width: 2.sp,
                  ),
                ),
                child: Center(
                  child: state.index == index
                      ? Container(
                          width: 16.w,
                          height: 16.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.kPrimaryColor,
                          ),
                        )
                      : Container(),
                ),
              ),
            ),
            SizedBox(
              width: 16.w,
            ),
            Expanded(
              child: Container(
                height: 64.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: state.index == index
                      ? AppColor.kPrimaryColor
                      : AppColor.kPlaceholder2,
                  borderRadius: BorderRadius.circular(
                    12.r,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      method.name,
                      style: TextStyle(
                        color: state.index == index
                            ? Colors.white
                            : AppColor.kTextColor1,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 16.h,
                      child: Image.asset(
                        method.assetName,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
