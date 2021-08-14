import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_color.dart';

class CharityScaffold extends StatelessWidget {
  const CharityScaffold({
    required this.children,
    required this.button,
  });

  final List<Widget> children;
  final Widget button;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
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
                    children: children),
              ),
            ),
          ),
          Container(
            height: 120.h,
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Center(
              child: button,
            ),
          ),
        ],
      ),
    );
  }
}
