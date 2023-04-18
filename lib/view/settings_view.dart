import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 18.sp),
                ),
                leading: Icon(
                  Icons.book,
                  color: ColorConstants.instance.iconColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'EULA',
                  style: TextStyle(fontSize: 18.sp),
                ),
                leading: Icon(
                  Icons.book,
                  color: ColorConstants.instance.iconColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Security Code',
                  style: TextStyle(fontSize: 16.sp),
                ),
                leading: Icon(
                  Icons.book,
                  color: ColorConstants.instance.iconColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Help Center',
                  style: TextStyle(fontSize: 18.sp),
                ),
                leading: Icon(
                  Icons.book,
                  color: ColorConstants.instance.iconColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Share With Your Friends',
                  style: TextStyle(fontSize: 18.sp),
                ),
                leading: Icon(
                  Icons.book,
                  color: ColorConstants.instance.iconColor,
                ),
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  'Rate Us',
                  style: TextStyle(fontSize: 18.sp),
                ),
                leading: Icon(
                  Icons.book,
                  color: ColorConstants.instance.iconColor,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/premium');
                },
                title: Text(
                  'Buy Premium',
                  style: TextStyle(fontSize: 18.sp),
                ),
                leading: Icon(
                  Icons.book,
                  color: ColorConstants.instance.iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
