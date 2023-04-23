import 'package:flutter/material.dart';
import 'package:watlog/utils/widget/chart.dart';

import '../utils/colors.dart';
import 'daily_chart_page.dart';

class DailyStatics extends StatelessWidget {
  const DailyStatics({
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
          SizedBox(height: 200),
        ],
      ),
    );
  }
}

class TimeSpendCard extends StatelessWidget {
  const TimeSpendCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.instance.cardBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.ads_click,
                color: ColorConstants.instance.green,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '50 sec',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Night',
                style: TextStyle(color: ColorConstants.instance.textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
