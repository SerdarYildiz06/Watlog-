import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:watlog/utils/widget/custom_button.dart';

import '../utils/colors.dart';

class BuyPremiumView extends StatefulWidget {
  const BuyPremiumView({super.key});

  @override
  State<BuyPremiumView> createState() => _BuyPremiumViewState();
}

class _BuyPremiumViewState extends State<BuyPremiumView> {
  final PageController _controller = PageController();
  int _pageIndicator = 0;
  int _selected = 0;
  int selectedPackage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 150.h,
                    child: PageView(
                      controller: _controller,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndicator = index;
                        });
                      },
                      children: [
                        Image.asset(
                          'assets/images/slider-images/slider_image_1.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 100,
                        ),
                        Image.asset(
                          'assets/images/slider-images/slider_image_1.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 100,
                        ),
                        Image.asset(
                          'assets/images/slider-images/slider_image_1.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildIndicator(_pageIndicator == 0),
                      const SizedBox(width: 8.0),
                      buildIndicator(_pageIndicator == 1),
                      const SizedBox(width: 8.0),
                      buildIndicator(_pageIndicator == 2),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Detaillierte Statistiken',
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'View all activities with graphical statistics',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: ColorConstants.instance.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  slectNumber(),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: selectedPackage == 0 ? ColorConstants.instance.darkGreen : ColorConstants.instance.primarContailerColor,
                              width: 2,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPackage = 0;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Weekly",
                                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "59.99\$",
                                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: selectedPackage == 2 ? ColorConstants.instance.darkGreen : ColorConstants.instance.primarContailerColor,
                              width: 2,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPackage = 2;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Weekly",
                                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "59.99\$",
                                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: selectedPackage == 2 ? ColorConstants.instance.darkGreen : ColorConstants.instance.primarContailerColor,
                              width: 2,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPackage = 2;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Weekly",
                                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "59.99\$",
                                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomButton(
                    text: 'CONTINUE',
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(color: ColorConstants.instance.grey, fontSize: 12.sp),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Terms',
                      style: TextStyle(color: ColorConstants.instance.grey, fontSize: 12.sp),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Restore',
                      style: TextStyle(color: ColorConstants.instance.grey, fontSize: 12.sp),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row slectNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selected = 0;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.instance.black,
                border: Border.all(
                  color: _selected == 0 ? Colors.white : Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 0,
                    groupValue: _selected,
                    onChanged: (value) {
                      setState(() {
                        _selected = value!;
                      });
                    },
                    activeColor: ColorConstants.instance.green,
                    hoverColor: Colors.green,
                    focusColor: Colors.yellow,
                    autofocus: false,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  const Text('Number 3'),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selected = 1;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstants.instance.black,
                border: Border.all(
                  color: _selected == 1 ? Colors.white : Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 1,
                    groupValue: _selected,
                    onChanged: (value) {
                      setState(() {
                        _selected = value!;
                      });
                    },
                    activeColor: ColorConstants.instance.green,
                    hoverColor: Colors.green,
                    focusColor: Colors.yellow,
                    autofocus: false,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  const Text('Number 5'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CheckRadio extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;
  final String label;

  const CheckRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: groupValue == value ? Colors.red : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Radio(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              autofocus: false,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            if (groupValue == value)
              const Icon(
                Icons.check,
                color: Colors.white,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildIndicator(bool isActive) {
  return Padding(
    padding: EdgeInsets.only(top: 15.h),
    child: Container(
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? ColorConstants.instance.green : Colors.grey,
      ),
    ),
  );
}
