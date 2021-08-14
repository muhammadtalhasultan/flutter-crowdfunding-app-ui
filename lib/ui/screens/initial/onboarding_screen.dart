import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../routes/routes.dart';
import '../../../theme/app_animation.dart';
import '../../../theme/app_color.dart';

typedef PageDetail = Map<String, Object>;

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<PageDetail> pages = [
    {
      'text': 'Spread Love Easier',
      'desc': 'If you don\'t know how to help people in easiest way, '
          'now you can do it by donating thrigh AFOFA.',
      'bgImg': 'assets/images/image1.svg',
      'foreImg': 'assets/images/image_placeholder.svg',
      'isFirst': true,
      'isLast': false
    },
    {
      'text': 'Trusted Institution',
      'desc': 'It is normal to feel doubt with fundraising institution. '
          'But our institution is overseen bu the financial services authority.',
      'bgImg': 'assets/images/image2.svg',
      'foreImg': 'assets/images/image_placeholder.svg',
      'isFirst': false,
      'isLast': false
    },
    {
      'text': 'Start to help',
      'desc':
          'It is easier now to help people in the midst of your busy life by '
              'using AFOFA your trusted fundraising online apps.',
      'bgImg': 'assets/images/image3.svg',
      'foreImg': 'assets/images/image_placeholder.svg',
      'isFirst': false,
      'isLast': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'AFOFA',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: pages.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
                itemBuilder: (_, int index) =>
                    PageScaffold(pages[index], pageController),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (rowIndex) => Row(
                        children: [
                          AnimatedContainer(
                            duration: AppAnimation.kAnimationDuration,
                            curve: AppAnimation.kAnimationCurve,
                            width: rowIndex == pageIndex ? 24.w : 8.w,
                            height: 8.w,
                            decoration: rowIndex == pageIndex
                                ? ShapeDecoration(
                                    shape: const StadiumBorder(),
                                    color: Colors.white,
                                  )
                                : ShapeDecoration(
                                    shape: const CircleBorder(),
                                    color:
                                        AppColor.kPlaceholder1.withOpacity(0.5),
                                  ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: pageIndex == pages.length - 1
                        ? Container(
                            decoration: BoxDecoration(
                              color: AppColor.kAccentColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(
                                8.r,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        AppColor.kAccentColor,
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                        Colors.white,
                                      ),
                                    ),
                                    onPressed: () => Navigator.of(context)
                                        .pushReplacementNamed(
                                            RouteGenerator.login),
                                    child: Text(
                                      'Login',
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8.r,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.transparent,
                                      ),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                        AppColor.kPlaceholder1,
                                      ),
                                    ),
                                    onPressed: () => Navigator.of(context)
                                        .pushReplacementNamed(
                                            RouteGenerator.signup),
                                    child: Text(
                                      'Sign up',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Row(
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    AppColor.kPlaceholder1.withOpacity(0.2),
                                  ),
                                  foregroundColor: MaterialStateProperty.all(
                                    AppColor.kPlaceholder1.withOpacity(0.5),
                                  ),
                                ),
                                onPressed: () => Navigator.of(context)
                                    .pushReplacementNamed(RouteGenerator.login),
                                child: Text(
                                  'Skip',
                                ),
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () => pageController.nextPage(
                                  duration: AppAnimation.kAnimationDuration,
                                  curve: AppAnimation.kAnimationCurve,
                                ),
                                child: Text(
                                  'Next',
                                ),
                              ),
                            ],
                          ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageScaffold extends StatelessWidget {
  const PageScaffold(this.pageDetail, this.pageController);

  final PageDetail pageDetail;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        SizedBox(
          height: 300.h,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  pageDetail['bgImg'] as String,
                  width: 236.w,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  pageDetail['foreImg'] as String,
                  width: 100.w,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Text(
          pageDetail['text'] as String,
          style: Theme.of(context).textTheme.headline2!.copyWith(
                color: AppColor.kTextColor1,
                fontWeight: FontWeight.w600,
              ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Text(
            pageDetail['desc'] as String,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: AppColor.kTextColor1,
                ),
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(),
      ],
    );
  }
}
