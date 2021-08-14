import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_color.dart';

final List<String> categories = [
  'Education',
  'Health',
  'Animal',
  'Environment',
];

class Category extends StatefulWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int selectedCat = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0.w,
      ),
      child: SizedBox(
        height: 56.h,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                categories.length,
                (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCat = index;
                        });
                      },
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.h,
                              horizontal: 8.w,
                            ),
                            decoration: BoxDecoration(
                              color: selectedCat == index
                                  ? AppColor.kPrimaryColor
                                  : AppColor.kPlaceholder2,
                              borderRadius: BorderRadius.circular(
                                8.r,
                              ),
                            ),
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                color: selectedCat == index
                                    ? Colors.white
                                    : AppColor.kTextColor1,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                        ],
                      ),
                    )),
          ),
        ),
      ),
    );
  }
}
