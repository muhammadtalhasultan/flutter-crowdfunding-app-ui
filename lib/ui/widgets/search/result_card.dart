import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/result.dart';
import '../../../routes/routes.dart';
import '../../../theme/app_color.dart';

final List<Result> results = [
  Result(
    title: 'Realize Syirian children dream for school',
    target: '999.00',
    percent: '75',
    assetName: 'assets/images/image_placeholder.svg',
    categories: ['Children', 'Education'],
    days: 10,
    organizer: 'Black Heart Institution',
    remaining: '450.00',
    desc:
        'Make learning possible for students of all ages, from pre-school to graduate school.'
        ' They also provide otger educational servuces and opportunities that help make schools '
        'more effective and more accessible to students of all backgrounds.',
    people: 99,
  ),
  Result(
    title: 'Disaster on Two Coasts: Holding hands',
    target: '999.00',
    percent: '65',
    assetName: 'assets/images/image_placeholder.svg',
    categories: ['Children', 'Education'],
    days: 20,
    organizer: 'Love Bird Organization',
    remaining: '450.00',
    desc:
        'Make learning possible for students of all ages, from pre-school to graduate school.'
        ' They also provide otger educational servuces and opportunities that help make schools '
        'more effective and more accessible to students of all backgrounds.',
    people: 99,
  ),
  Result(
    title: 'This Island Has No Bridges With Handlers',
    target: '999.00',
    percent: '90',
    assetName: 'assets/images/image_placeholder.svg',
    categories: ['Children', 'Education'],
    days: 20,
    organizer: 'One Heart Way',
    remaining: '450.00',
    desc:
        'Make learning possible for students of all ages, from pre-school to graduate school.'
        ' They also provide otger educational servuces and opportunities that help make schools '
        'more effective and more accessible to students of all backgrounds.',
    people: 99,
  )
];

class ResultCard extends StatelessWidget {
  const ResultCard(this.result);

  final Result result;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(RouteGenerator.result, arguments: result);
      },
      child: Container(
        height: 104.h,
        child: Row(
          children: [
            Container(
              width: 104.h,
              height: 104.h,
              decoration: BoxDecoration(
                color: AppColor.kPlaceholder1,
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  result.assetName,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  result.title,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'By: ${result.organizer}',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: AppColor.kTextColor1,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      '${result.days} Days left',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      width: 4.w,
                      height: 4.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.kPrimaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      '\$${result.remaining} left',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 8.h,
                            decoration: ShapeDecoration(
                              shape: StadiumBorder(),
                              color: AppColor.kPlaceholder2,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: int.parse(result.percent),
                                child: Container(
                                  height: 8.h,
                                  width: 8,
                                  decoration: ShapeDecoration(
                                    shape: StadiumBorder(),
                                    color: AppColor.kPrimaryColor,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 100 - int.parse(result.percent),
                                child: Container(
                                  height: 8.h,
                                  width: 8,
                                  decoration: ShapeDecoration(
                                    shape: StadiumBorder(),
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      '${result.percent}%',
                      style: TextStyle(
                        color: AppColor.kTextColor1,
                      ),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
