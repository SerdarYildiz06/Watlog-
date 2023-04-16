import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watlog/utils/colors.dart';
import 'package:watlog/utils/widget/custom_button.dart';

import 'list_screen.dart';

class SlectPersonScreen extends StatelessWidget {
  const SlectPersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.instance.bacgroundColors,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add the person you \n want to follow',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Type the name and number of the person \n whose online analytics you want to see',
              style: TextStyle(
                color: ColorConstants.instance.primaryColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 15.h),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            SizedBox(height: 15.h),
            const Text(
              'I want to folow.',
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.instance.iconBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                const Text('Supersky', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.instance.iconBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.phone_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                const Text('5347244865', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              text: 'CONTINUE',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ListScreen()));
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(children: [
                Icon(
                  Icons.info_outline,
                  color: ColorConstants.instance.blue,
                  size: 30.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Tracking can take up to 15 minutes\nto start.',
                  style: TextStyle(color: ColorConstants.instance.blue, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
