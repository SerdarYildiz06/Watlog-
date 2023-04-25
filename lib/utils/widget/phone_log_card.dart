import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

class PhoneLogCard extends StatelessWidget {
  const PhoneLogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'detailed-statistics');
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorConstants.instance.cardBackgroundColor,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 19.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selma',
                          style: TextStyle(color: ColorConstants.instance.lightBlue, fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '1',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Supersky',
                          style: TextStyle(color: ColorConstants.instance.orange, fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          '0',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
