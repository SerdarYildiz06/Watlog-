import 'package:flutter/material.dart';
import 'package:watlog/utils/widget/chart.dart';

import '../utils/colors.dart';
import '../utils/widget/phone_log_card.dart';

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
            itemCount: 3,
            itemBuilder: (context, index) {
              return const PhoneLogCard();
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '  13 April',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('Today', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorConstants.instance.orange)),
            ],
          ),
          const SizedBox(height: 20),
          Chart(
            data: chartData,
          ),
          const FlutterLogo(),

          // Chart(
          //   data: chartData2,
          // ),
          // SizedBox(height: 20),
          // Chart(
          //   data: chartData.sublist(0, 10),
          // ),
          const SizedBox(height: 200),
        ],
      ),
    );
  }
}

class ChartData {
  final String title;
  final int value;
  ChartData({
    required this.title,
    required this.value,
  });
}

List<ChartData> chartData = [
  ChartData(title: '07:00', value: 0),
  ChartData(title: '08:00', value: 0),
  ChartData(title: '09:00', value: 0),
  ChartData(title: '10:00', value: 0),
  ChartData(title: '11:00', value: 0),
  ChartData(title: '12:00', value: 0),
  ChartData(title: '13:00', value: 0),
  ChartData(title: '14:00', value: 1),
  ChartData(title: '15:00', value: 0),
  ChartData(title: '16:00', value: 0),
  ChartData(title: '17:00', value: 0),
  ChartData(title: '18:00', value: 0),
  ChartData(title: '19:00', value: 0),
  ChartData(title: '20:00', value: 0),
  ChartData(title: '21:00', value: 1),
  ChartData(title: '22:00', value: 0),
];
List<ChartData> chartData2 = [
  ChartData(title: '06/Apr', value: 0),
  ChartData(title: '07/Apr', value: 0),
  ChartData(title: '08/Apr', value: 1),
  ChartData(title: '09/Apr', value: 0),
  ChartData(title: '10/Apr', value: 0),
  ChartData(title: '11/Apr', value: 1),
  ChartData(title: '12/Apr', value: 0),
  ChartData(title: '13/Apr', value: 0),
];
