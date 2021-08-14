import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/charity.dart';
import '../../../theme/app_color.dart';

class CatrgoryCard extends StatelessWidget {
  const CatrgoryCard(this.charity);

  final Charity charity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 96.w,
          height: 96.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.kPlaceholder1,
          ),
          child: Center(
            child: SizedBox(
              width: 48.w,
              height: 48.w,
              child: Image.asset(
                charity.assetName,
              ),
            ),
          ),
        ),
        Text(
          charity.name,
          style: TextStyle(
            color: AppColor.kTextColor1,
          ),
        ),
      ],
    );
  }
}
