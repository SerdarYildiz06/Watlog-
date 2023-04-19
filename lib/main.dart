import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watlog/view/buy_premium_view.dart';
import 'package:watlog/view/detailed_statistics.dart';
import 'package:watlog/view/help_center_view.dart';
import 'package:watlog/view/select_person_view.dart';
import 'package:watlog/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          routes: {
            '/premium': (context) => const BuyPremiumView(),
            'help_center': (context) => const HelpCenterView(),
            'detailed_statistics': (context) => const DetailedStatisticsView(),
          },
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return ColorConstants.instance.green; // selected color
                  }
                  return Colors.grey; // unselected color
                },
              ),
            ),
            scaffoldBackgroundColor: ColorConstants.instance.bacgroundColors,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: ColorConstants.instance.bacgroundColors),
          ),
          home: child,
        );
      },
      child: const SlectPersonScreen(),
    );
  }
}
