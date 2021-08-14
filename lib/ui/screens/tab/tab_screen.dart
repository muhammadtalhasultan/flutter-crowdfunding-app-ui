import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../routes/routes.dart';
import '../../../theme/app_color.dart';
import 'home/home_screen.dart';
import 'profile/proflle_screen.dart';
import 'search/search_screen.dart';
import 'swap/swap_screen.dart';

final List<Widget> pages = [
  HomeScreen(),
  SearchScreen(),
  Scaffold(
    backgroundColor: AppColor.kPrimaryColor,
  ),
  SwapScreen(),
  ProfileScreen(),
];

class TabScreen extends StatefulWidget {
  const TabScreen();

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late int tabIndex;

  @override
  void initState() {
    tabIndex = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          iconSize: 24.w,
          backgroundColor: AppColor.kPrimaryColor,
          currentIndex: tabIndex,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) async {
            setState(() {
              tabIndex = index;
            });
            if (index == 2) {
              await Navigator.of(context)
                  .pushNamed(RouteGenerator.startCharity);

              setState(() {
                tabIndex = 0;
              });
            }
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          enableFeedback: true,
          items: [
            BottomNavigationBarItem(
              activeIcon: Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.kTitle.withOpacity(0.5),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/category.svg',
                    width: 24.w,
                    color: Colors.white,
                  ),
                ),
              ),
              label: '',
              icon: SvgPicture.asset(
                'assets/images/category.svg',
                width: 24.w,
                color: AppColor.kTextColor1,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.kTitle.withOpacity(0.5),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/search.svg',
                    width: 24.w,
                    color: Colors.white,
                  ),
                ),
              ),
              label: '',
              icon: SvgPicture.asset(
                'assets/images/search.svg',
                width: 24.w,
                color: AppColor.kTextColor1,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.kAccentColor,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/add.svg',
                    width: 24.w,
                  ),
                ),
              ),
              label: '',
              icon: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.kAccentColor,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.kAccentColor.withOpacity(0.6),
                        offset: Offset(
                          0,
                          2.h,
                        ),
                        blurRadius: 5,
                      )
                    ]),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/add.svg',
                    width: 24.w,
                  ),
                ),
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.kTitle.withOpacity(0.5),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/swap.svg',
                    width: 24.w,
                    color: Colors.white,
                  ),
                ),
              ),
              label: '',
              icon: SvgPicture.asset(
                'assets/images/swap.svg',
                width: 24.w,
                color: AppColor.kTextColor1,
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.kTitle.withOpacity(0.5),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/profile.svg',
                    width: 24.w,
                    color: Colors.white,
                  ),
                ),
              ),
              label: '',
              icon: SvgPicture.asset(
                'assets/images/profile.svg',
                width: 24.w,
                color: AppColor.kTextColor1,
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: pages.elementAt(tabIndex),
      ),
    );
  }
}
