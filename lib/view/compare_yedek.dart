import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/colors.dart';

class CompareNumbersView extends StatefulWidget {
  const CompareNumbersView({super.key});

  @override
  State<CompareNumbersView> createState() => _CompareNumbersViewState();
}

class _CompareNumbersViewState extends State<CompareNumbersView> with SingleTickerProviderStateMixin {
  final List<ChartData> data = [
    ChartData(day: 'Mon', value: 50),
    ChartData(day: 'Tue', value: 70),
    ChartData(day: 'Wed', value: 90),
    ChartData(day: 'Thu', value: 80),
    ChartData(day: 'Fri', value: 60),
    ChartData(day: 'Sat', value: 40),
    ChartData(day: 'Sun', value: 30),
  ];

  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Text('Compare Numbers View'),
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
              children: <Widget>[
                Row(
                  children: [
                    CardPhoneCard(
                      name: 'John Doe',
                      number: '+1 234 567 890',
                      color: ColorConstants.instance.lightBlue,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CardPhoneCard(
                      name: 'John Doe',
                      number: '+1 234 567 890',
                      color: ColorConstants.instance.orange,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  decoration: BoxDecoration(
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
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const PhoneLogCard();
                        },
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const PhoneLogCard();
                        },
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return const PhoneLogCard();
                        },
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('  13 April'),
                    Text('Today'),
                  ],
                ),
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    ColumnSeries<ChartData, String>(
                      dataSource: data,
                      xValueMapper: (ChartData chartData, _) => chartData.day,
                      yValueMapper: (ChartData chartData, _) => chartData.value,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneLogCard extends StatelessWidget {
  const PhoneLogCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
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
    );
  }
}

class CardPhoneCard extends StatelessWidget {
  final String name;
  final String number;
  final Color color;
  const CardPhoneCard({
    super.key,
    required this.name,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstants.instance.cardBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Container(
                      width: 8.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        number,
                        style: TextStyle(color: ColorConstants.instance.textColor),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.instance.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String day;
  final double value;

  ChartData({required this.day, required this.value});
}
