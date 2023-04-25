import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watlog/utils/colors.dart';
import 'package:watlog/view/settings_view.dart';

class PersonsView extends StatefulWidget {
  const PersonsView({super.key});

  @override
  State<PersonsView> createState() => _PersonsViewState();
}

class _PersonsViewState extends State<PersonsView> {
  bool _switchOnlineNotifcaiton = false;
  bool _switchOfflineNotifcaiton = false;
  bool _switchOnlineSound = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () async {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return AlertDialog(
                      backgroundColor: ColorConstants.instance.cardBackgroundColor,
                      content: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                              ),
                              title: const Text(
                                'Online Notification',
                                maxLines: 1,
                              ),
                              trailing: Transform.scale(
                                scale: 1.5, // Set the desired scale value here
                                child: Switch(
                                  focusColor: Colors.red,
                                  hoverColor: Colors.orange,
                                  thumbColor: MaterialStateProperty.all<Color>(Colors.white),
                                  value: _switchOnlineNotifcaiton,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _switchOnlineNotifcaiton = value;
                                    });
                                  },
                                  activeColor: ColorConstants.instance.green,
                                ),
                              ),
                            ),
                            Divider(
                              color: ColorConstants.instance.textColor,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                              ),
                              title: const Text(
                                'Offline Notification',
                                maxLines: 1,
                              ),
                              trailing: Transform.scale(
                                scale: 1.5, // Set the desired scale value here
                                child: Switch(
                                  focusColor: Colors.red,
                                  hoverColor: Colors.orange,
                                  thumbColor: MaterialStateProperty.all<Color>(Colors.white),
                                  value: _switchOfflineNotifcaiton,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _switchOfflineNotifcaiton = value;
                                    });
                                  },
                                  activeColor: ColorConstants.instance.green,
                                ),
                              ),
                            ),
                            Divider(
                              color: ColorConstants.instance.textColor,
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: const Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                              ),
                              title: const Text(
                                'Notification Sound',
                                maxLines: 1,
                              ),
                              trailing: Transform.scale(
                                scale: 1.5, // Set the desired scale value here
                                child: Switch(
                                  focusColor: Colors.red,
                                  hoverColor: Colors.orange,
                                  thumbColor: MaterialStateProperty.all<Color>(Colors.white),
                                  value: _switchOnlineSound,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _switchOnlineSound = value;
                                    });
                                  },
                                  activeColor: ColorConstants.instance.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
          icon: const Icon(
            Icons.system_security_update_warning,
            size: 30,
          ),
        ),
        title: Text(
          'Watlog',
          style: TextStyle(fontSize: 25.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingView()));
            },
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'compare-numbers');
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: ColorConstants.instance.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                            ),
                            child: Container(
                              width: 8.w,
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: ColorConstants.instance.red,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.r),
                                  bottomRight: Radius.circular(10.r),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorConstants.instance.bacgroundColors,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black, width: 2),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.person_outline_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Serdar',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 5.w),
                                          child: Icon(
                                            Icons.delete_outline,
                                            color: ColorConstants.instance.red,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      '+1234567890',
                                      style: TextStyle(
                                        color: ColorConstants.instance.primaryColor,
                                        fontSize: 15.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.rectangle_outlined, color: ColorConstants.instance.red),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10.w),
                                          child: Text(
                                            'Offline',
                                            style: TextStyle(
                                              color: ColorConstants.instance.red,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.notifications_none,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'Open',
                              style: TextStyle(
                                color: ColorConstants.instance.green,
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text('48 second ago',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  color: ColorConstants.instance.primaryColor,
                                  fontSize: 13.sp,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorConstants.instance.iconBackgroundColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                bottom: 20.h,
                left: 20.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Compare \nNumbers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstants.instance.grey,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.r),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/chat_image.png',
                    fit: BoxFit.fitWidth,
                    width: 125.w,
                  )
                ],
              ),
            )),
      ),
    );
  }
}
