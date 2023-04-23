import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watlog/view/daily_statics.dart';
import 'package:watlog/view/special_statics.dart';
import 'package:watlog/view/weekly_statics.dart';

import '../utils/colors.dart';

class DetailedStatisticsView extends StatefulWidget {
  const DetailedStatisticsView({super.key});

  @override
  State<DetailedStatisticsView> createState() => _DetailedStatisticsViewState();
}

class _DetailedStatisticsViewState extends State<DetailedStatisticsView> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        actions: const [],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Text('Detailed Statistics'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: ColorConstants.instance.cardBackgroundColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
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
                                          Text(
                                            '48 second ago',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              color: ColorConstants.instance.primaryColor,
                                              fontSize: 13.sp,
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.instance.cardBackgroundColor,
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorConstants.instance.grey,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 2.0,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: 'Daily'),
                      Tab(text: 'Weekly'),
                      Tab(text: 'Special Date'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      DailyStatics(),
                      WeeklyStatics(),
                      SpecialStatics(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
