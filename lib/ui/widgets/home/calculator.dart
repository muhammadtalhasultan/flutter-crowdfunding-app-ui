import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/app_color.dart';

class Calculator extends StatefulWidget {
  const Calculator(
    this.callback,
  );

  final void Function(String) callback;

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<String> moneyChar = ['0', '0', '0'];

  String constructMoney() {
    int totalChar = moneyChar.length;
    String answer = '';

    for (int i = 0; i < totalChar - 2; i++) {
      answer += moneyChar[i];
    }

    answer +=
        '.' + moneyChar[moneyChar.length - 2] + moneyChar[moneyChar.length - 1];

    return answer;
  }

  void buttonHandler(int index) {
    if (index == 0 &&
        moneyChar.length == 3 &&
        moneyChar.every((element) => element == '0')) {
      return;
    }
    if (moneyChar.length == 3 &&
        moneyChar[0] == '0' &&
        moneyChar[1] == '0' &&
        moneyChar[2] == '0') {
      setState(() {
        moneyChar[2] = index.toString();
      });
      return;
    }
    if (moneyChar.length == 3 && moneyChar[0] == '0' && moneyChar[1] == '0') {
      setState(() {
        moneyChar[1] = moneyChar[2];
        moneyChar[2] = index.toString();
      });
      return;
    }
    if (moneyChar.length == 3 && moneyChar[0] == '0') {
      setState(() {
        moneyChar[0] = moneyChar[1];
        moneyChar[1] = moneyChar[2];
        moneyChar[2] = index.toString();
      });
      return;
    }
    setState(() {
      moneyChar.add(index.toString());
    });

    widget.callback(constructMoney());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 32.w,
        vertical: 24.h,
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppColor.kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                constructMoney(),
                style: TextStyle(
                  fontSize: 40.sp,
                  color: AppColor.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0.w),
            child: Divider(
              thickness: 2.sp,
              color: AppColor.kPlaceholder2,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              children: [
                Expanded(
                  child: _buildButton(1),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: _buildButton(2)),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: _buildButton(3))
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              children: [
                Expanded(child: _buildButton(4)),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: _buildButton(5)),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: _buildButton(6))
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              children: [
                Expanded(child: _buildButton(7)),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: _buildButton(8)),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: _buildButton(9))
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Row(
              children: [
                Expanded(
                  child: _buildThreeZero(context),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: _buildButton(0),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: _buildBackspace(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackspace() {
    return GestureDetector(
      onTap: () {
        if (moneyChar.length == 3 &&
            moneyChar[0] == '0' &&
            moneyChar[1] == '0' &&
            moneyChar[2] == '0') {
          return;
        }
        if (moneyChar.length == 3) {
          moneyChar.removeLast();
          moneyChar.insert(0, '0');
          setState(() {});
          return;
        }
        setState(() {
          moneyChar.removeLast();
        });
        widget.callback(constructMoney());
      },
      child: Container(
        height: 48.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.kPlaceholder2,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SvgPicture.asset(
          'assets/images/backspace.svg',
          width: 32.w,
        ),
      ),
    );
  }

  Widget _buildThreeZero(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (moneyChar.length == 3 &&
            moneyChar.every((element) => element == '0')) {
          return;
        }
        if (moneyChar.length == 3 &&
            moneyChar[0] == '0' &&
            moneyChar[1] == '0') {
          setState(() {
            moneyChar[0] = moneyChar[2];
            moneyChar[1] = '0';
            moneyChar[2] = '0';
            moneyChar.add('0');
          });
          return;
        }
        if (moneyChar.length == 3 && moneyChar[0] == '0') {
          setState(() {
            moneyChar[0] = moneyChar[1];
            moneyChar[1] = moneyChar[2];
            moneyChar[2] = '0';
            moneyChar.add('0');
            moneyChar.add('0');
          });
          return;
        }
        for (int i = 0; i < 3; i++) {
          moneyChar.add('0');
        }
        setState(() {});
        widget.callback(constructMoney());
      },
      child: Container(
        height: 48.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.kPlaceholder2,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Text(
          '000',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: AppColor.kPrimaryColor,
              ),
        ),
      ),
    );
  }

  Widget _buildButton(int index) {
    return GestureDetector(
      onTap: () => buttonHandler(index),
      child: Container(
        height: 48.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColor.kPlaceholder2,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: Text(
          '$index',
          style: Theme.of(context).textTheme.headline3!.copyWith(
                color: AppColor.kPrimaryColor,
              ),
        ),
      ),
    );
  }
}
