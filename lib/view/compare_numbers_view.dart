import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
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
  DateTime _selectedDate = DateTime.now();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Date'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ScrollDatePicker(
                    selectedDate: _selectedDate,
                    locale: Locale('en'),
                    onDateTimeChanged: (DateTime value) {
                      _selectedDate = value;
                    },
                  ),
                ),
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    _dateController?.text = _selectedDate.toString();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await _showMyDialog();
              //here
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
