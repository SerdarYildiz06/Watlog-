import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:watlog/utils/colors.dart';
import 'package:watlog/utils/widget/my_chart.dart';

import 'package:watlog/view/compare_numbers_view.dart';

class DailyChart extends StatelessWidget {
  const DailyChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const PhoneLogCard();
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('  13 April'),
              Text('Today'),
            ],
          ),
          const SizedBox(height: 20),
          MyChart(
            data: chartData,
          ),
          SizedBox(height: 20),
          MyChart(
            data: chartData2,
          ),
          SizedBox(height: 20),
          MyChart(
            data: chartData.sublist(0, 10),
          ),
          SizedBox(height: 200),
        ],
      ),
    );
  }
}

class MyChartData {
  final String title;
  final int value;
  MyChartData({
    required this.title,
    required this.value,
  });
}

List<MyChartData> chartData = [
  MyChartData(title: '07:00', value: 0),
  MyChartData(title: '08:00', value: 0),
  MyChartData(title: '09:00', value: 0),
  MyChartData(title: '10:00', value: 0),
  MyChartData(title: '11:00', value: 0),
  MyChartData(title: '12:00', value: 0),
  MyChartData(title: '13:00', value: 0),
  MyChartData(title: '14:00', value: 1),
  MyChartData(title: '15:00', value: 0),
  MyChartData(title: '16:00', value: 0),
  MyChartData(title: '17:00', value: 0),
  MyChartData(title: '18:00', value: 0),
  MyChartData(title: '19:00', value: 0),
  MyChartData(title: '20:00', value: 0),
  MyChartData(title: '21:00', value: 1),
  MyChartData(title: '22:00', value: 0),
];
List<MyChartData> chartData2 = [
  MyChartData(title: '06/Apr', value: 0),
  MyChartData(title: '07/Apr', value: 0),
  MyChartData(title: '08/Apr', value: 1),
  MyChartData(title: '09/Apr', value: 0),
  MyChartData(title: '10/Apr', value: 0),
  MyChartData(title: '11/Apr', value: 1),
  MyChartData(title: '12/Apr', value: 0),
  MyChartData(title: '13/Apr', value: 0),
];
