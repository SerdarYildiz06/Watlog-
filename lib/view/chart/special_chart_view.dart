import 'package:flutter/material.dart';
import 'package:watlog/utils/colors.dart';
import 'package:watlog/utils/widget/chart.dart';
import 'package:watlog/utils/widget/phone_log_card.dart';
import 'daily_chart_view.dart';

class SpecialChartView extends StatelessWidget {
  const SpecialChartView({
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
