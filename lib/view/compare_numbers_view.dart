import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watlog/view/special_chart_view.dart';
import 'package:watlog/view/weekly_chart_view.dart';

import '../utils/colors.dart';
import '../utils/widget/card_phone.dart';
import 'daily_chart_page.dart';

class CompareNumbersView extends StatefulWidget {
  const CompareNumbersView({super.key});

  @override
  State<CompareNumbersView> createState() => _CompareNumbersViewState();
}

// Data must be sorted.
final smallDataList = [
  DateTimeRange(
    start: DateTime(2021, 2, 24, 23, 15),
    end: DateTime(2021, 2, 25, 7, 30),
  ),
  DateTimeRange(
    start: DateTime(2021, 2, 22, 1, 55),
    end: DateTime(2021, 2, 22, 9, 12),
  ),
  DateTimeRange(
    start: DateTime(2021, 2, 20, 0, 25),
    end: DateTime(2021, 2, 20, 7, 34),
  ),
  DateTimeRange(
    start: DateTime(2021, 2, 17, 21, 23),
    end: DateTime(2021, 2, 18, 4, 52),
  ),
  DateTimeRange(
    start: DateTime(2021, 2, 13, 6, 32),
    end: DateTime(2021, 2, 13, 13, 12),
  ),
  DateTimeRange(
    start: DateTime(2021, 2, 1, 9, 32),
    end: DateTime(2021, 2, 1, 15, 22),
  ),
  DateTimeRange(
    start: DateTime(2021, 1, 22, 12, 10),
    end: DateTime(2021, 1, 22, 16, 20),
  ),
];

List<DateTimeRange> getRandomSampleDataList() {
  final List<DateTimeRange> list = [];
  final random = Random();

  for (int i = 0; i < 10000; ++i) {
    final int randomMinutes1 = random.nextInt(59);
    final int randomMinutes2 = random.nextInt(59);
    final start = DateTime(2021, 2, 1 - i, 0, randomMinutes1);
    final end = DateTime(2021, 2, 1 - i, 7, randomMinutes2 + randomMinutes1);

    list.add(DateTimeRange(
      start: start,
      end: end,
    ));
  }
  return list;
}

final List<DateTimeRange> bigDataList = getRandomSampleDataList();

class _CompareNumbersViewState extends State<CompareNumbersView> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  TextEditingController? _dateController;
  final CupertinoDatePickerMode _datePickerMode = CupertinoDatePickerMode.dateAndTime;
  final DateTime _selectedDate = DateTime.now();

  void _showMyDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xff232323),
          title: const Text(
            'Select Date',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          content: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              children: [
                Expanded(
                  child: Theme(
                    data: ThemeData(
                      cupertinoOverrideTheme: const CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                      initialDateTime: _selectedDate,
                      onDateTimeChanged: (dateTime) {},
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Do something with the selected date
                    print('Selected date: $_selectedDate');
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
        );
      },
    );
  }

  final List<LunarData> data = [
    LunarData('Monday', 0),
    LunarData('Tuesday', 0),
    LunarData('Wed', 0),
    LunarData('Thursday', 0),
    LunarData('Friday', 0),
    LunarData('Saturday', 0),
    LunarData('Sunday', 1),
  ];

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
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              _showMyDialog();
            },
            icon: const Icon(Icons.calendar_month),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: const Text('Compare Numbers'),
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
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      DailyChart(),
                      WeeklyChart(),
                      SpecialChartView(),
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

class LunarData {
  final String day;
  final double value;

  LunarData(this.day, this.value);
}
