
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:watlog/utils/colors.dart';
import 'package:watlog/view/daily_chart_page.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.data,
  });

  final List<ChartData> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(4).add(EdgeInsets.only(top: 10)).subtract(EdgeInsets.only(bottom: 4)),
      decoration: BoxDecoration(color: Color(0xff232323), borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 25,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return DottedBorder(
                      strokeWidth: 0.8,
                      dashPattern: [2, 2],
                      strokeCap: StrokeCap.round,
                      color: Color(0xff383838),
                      child: Container(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      for (ChartData chartData in data)
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Builder(builder: (context) {
                                  if (chartData.value == 0) {
                                    return Text(
                                      chartData.value.toString(),
                                      style: TextStyle(color: Colors.white, fontSize: 10),
                                      textAlign: TextAlign.end,
                                    );
                                  } else {
                                    return Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            height: 10,
                                            decoration: BoxDecoration(
                                              color: ColorConstants.instance.orange,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: Text('1', style: TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.end),
                                        ),
                                      ],
                                    );
                                  }
                                }),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Color(0xff383838), thickness: 2, height: 0),
          SizedBox(height: 8),
          Container(
            height: 60,
            // decoration: BoxDecoration(color: Colors.yellow),
            child: Row(
              children: [
                for (ChartData chartData in data)
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          // color: data.indexOf(chartData) % 2 == 0 ? Colors.red : Colors.blue,
                          ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            chartData.title,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
