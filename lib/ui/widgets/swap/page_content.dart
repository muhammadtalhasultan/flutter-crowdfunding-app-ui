import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../bloc/swap/swap_bloc.dart';
import '../../../models/donation.dart';
import '../../../models/donator.dart';
import '../../../theme/app_color.dart';
import 'charity_card.dart';

List<Widget> contents = [DonationContent(), CharityContent()];

class PageContent extends StatelessWidget {
  const PageContent();

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

class CharityContent extends StatefulWidget {
  const CharityContent();

  @override
  _CharityContentState createState() => _CharityContentState();
}

class _CharityContentState extends State<CharityContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: BlocBuilder<SwapBloc, SwapState>(
        builder: (context, state) {
          return Column(
            children: [
              state.isDetail
                  ? DonatorContent()
                  : CharityCard(
                      onTap: () {
                        BlocProvider.of<SwapBloc>(context).add(SetDetail(true));
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}

class DonationContent extends StatelessWidget {
  const DonationContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          dates.length,
          (dateIndex) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd('en_US').format(
                  dates[dateIndex],
                ),
                style: TextStyle(
                  color: AppColor.kTextColor1,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ...List.generate(filterDonation(dates[dateIndex]).length,
                  (donationIndex) {
                final Donation donation =
                    filterDonation(dates[dateIndex])[donationIndex];
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                donation.organizer,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                donation.desc,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: AppColor.kTextColor1,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '\$${donation.total}',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.kPrimaryColor,
                                  ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                );
              }),
              SizedBox(
                height: 16.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DonatorContent extends StatelessWidget {
  const DonatorContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          donatorsDates.length,
          (dateIndex) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd('en_US').format(
                  donatorsDates[dateIndex],
                ),
                style: TextStyle(
                  color: AppColor.kTextColor1,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              ...List.generate(filterDonators(donatorsDates[dateIndex]).length,
                  (donationIndex) {
                final Donator donator =
                    filterDonators(donatorsDates[dateIndex])[donationIndex];
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                donator.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                donator.phoneNo,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: AppColor.kTextColor1,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '\$${donator.total}',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.kPrimaryColor,
                                  ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                );
              }),
              SizedBox(
                height: 16.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
