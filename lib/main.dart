import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:watlog/utils/theme.dart';
import 'package:watlog/view/buy_premium_view.dart';
import 'package:watlog/view/compare_numbers_view.dart';
import 'package:watlog/view/persons_view.dart';
import 'package:watlog/view/statics/detailed_statistics.dart';
import 'package:watlog/view/help_center_view.dart';
import 'package:watlog/view/select_person_view.dart';
import 'package:watlog/view/settings_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          routes: {
            'premium': (context) => const BuyPremiumView(),
            'help-center': (context) => const HelpCenterView(),
            'detailed-statistics': (context) => const DetailedStatisticsView(),
            'compare-numbers': (context) => const CompareNumbersView(),
            'settings': (context) => const SettingView(),
            'persons-list': (context) => const SelectPersonScreen(),
            'person': (context) => const PersonsView(),
          },
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: darkTheme,
          home: child,
        );
      },
      child: const SelectPersonScreen(),
    );
  }
}
