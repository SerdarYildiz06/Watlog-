import 'package:flutter/material.dart';
import 'package:watlog/utils/widget/chart.dart';

import '../utils/colors.dart';
import 'daily_chart_page.dart';
import 'daily_statics.dart';

class WeeklyStatics extends StatelessWidget {
  const WeeklyStatics({
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
              return TimeSpendCard();
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '  06 April - 13 April',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('Last Week', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: ColorConstants.instance.orange)),
            ],
          ),
          const SizedBox(height: 20),
          Chart(
            data: chartData2,
          ),
          SizedBox(height: 20),
          Chart(
            data: chartData2,
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xff232323),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No match found.',
                    style: TextStyle(color: ColorConstants.instance.textColor, fontSize: 18),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 200),
        ],
      ),
    );
  }
}
