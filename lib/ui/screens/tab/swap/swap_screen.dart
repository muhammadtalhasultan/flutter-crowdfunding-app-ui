import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../bloc/swap/swap_bloc.dart';
import '../../../../theme/app_color.dart';
import '../../../widgets/swap/empty_content.dart';
import '../../../widgets/swap/page_content.dart';
import '../../../widgets/swap/selection.dart';

class SwapScreen extends StatefulWidget {
  const SwapScreen({Key? key}) : super(key: key);

  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  late final PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwapBloc(controller),
      child: Container(
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
              BlocBuilder<SwapBloc, SwapState>(
                builder: (context, state) {
                  return GestureDetector(
                    onLongPress: () {
                      BlocProvider.of<SwapBloc>(context)
                          .add(SetEmpty(!state.isEmpty));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: state.isDetail
                          ? Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<SwapBloc>(context)
                                        .add(SetDetail(false));
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
                                    'My Charity',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(
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
                            )
                          : Text(
                              'Activity',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Selection(),
              ),
              SizedBox(
                height: 16.h,
              ),
              BlocBuilder<SwapBloc, SwapState>(
                builder: (context, state) {
                  return Expanded(
                    child: state.isEmpty ? EmptyContent() : PageContent(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
