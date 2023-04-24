import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:watlog/utils/colors.dart';
import 'package:watlog/view/daily_chart_page.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
    required this.data,
    this.circular = true,
  });

  final List<ChartData> data;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(4).add(const EdgeInsets.only(top: 10)).subtract(const EdgeInsets.only(bottom: 4)),
      decoration: BoxDecoration(color: const Color(0xff232323), borderRadius: circular ? BorderRadius.circular(16) : BorderRadius.circular(0)),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 25,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    return DottedBorder(
                      strokeWidth: 0.8,
                      dashPattern: const [2, 2],
                      strokeCap: StrokeCap.round,
                      color: const Color(0xff383838),
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
                            decoration: const BoxDecoration(),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Builder(builder: (context) {
                                  if (chartData.value == 0) {
                                    return Text(
                                      chartData.value.toString(),
                                      style: const TextStyle(color: Colors.white, fontSize: 10),
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
                                        const SizedBox(width: 10),
                                        const RotatedBox(
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
          const Divider(color: Color(0xff383838), thickness: 2, height: 0),
          const SizedBox(height: 8),
          SizedBox(
            height: 60,
            // decoration: BoxDecoration(color: Colors.yellow),
            child: Row(
              children: [
                for (ChartData chartData in data)
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          // color: data.indexOf(chartData) % 2 == 0 ? Colors.red : Colors.blue,
                          ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            chartData.title,
                            style: const TextStyle(color: Colors.white, fontSize: 10),
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
