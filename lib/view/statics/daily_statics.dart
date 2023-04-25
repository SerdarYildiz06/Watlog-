import 'package:flutter/material.dart';
import 'package:watlog/utils/widget/chart.dart';

import '../../utils/colors.dart';
import '../chart/daily_chart_view.dart';

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
              return const TimeSpendCard();
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
          const SizedBox(
            height: 15,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Recent Activities',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff232323),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Online Time ',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '50 sec',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.ads_click,
                                color: ColorConstants.instance.green,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Online',
                                style: TextStyle(color: ColorConstants.instance.green, fontSize: 18),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '21:37',
                            style: TextStyle(color: ColorConstants.instance.green, fontSize: 18),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Offline',
                                style: TextStyle(color: ColorConstants.instance.red, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.ads_click,
                                color: ColorConstants.instance.red,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '21:37',
                            style: TextStyle(color: ColorConstants.instance.red, fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '13 Apr 2023',
                    style: TextStyle(color: ColorConstants.instance.textColor),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
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
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.instance.cardBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.ads_click,
                color: ColorConstants.instance.green,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                '50 sec',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
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
