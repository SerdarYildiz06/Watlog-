import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:watlog/utils/colors.dart';
import 'package:watlog/utils/widget/custom_button.dart';
import 'person_list.dart';

class SlectPersonScreen extends StatefulWidget {
  const SlectPersonScreen({super.key});

  @override
  State<SlectPersonScreen> createState() => _SlectPersonScreenState();
}

class _SlectPersonScreenState extends State<SlectPersonScreen> {
  final TextEditingController _controller = TextEditingController(text: '5347244865');
  int? _countryCode = 90;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.instance.bacgroundColors,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add the person you \n want to follow',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Type the name and number of the person \n whose online analytics you want to see',
              style: TextStyle(
                color: ColorConstants.instance.primaryColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 15.h),
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            SizedBox(height: 15.h),
            const Text(
              'I want to folow.',
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.instance.iconBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.person_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                const Text('Supersky', style: TextStyle(fontSize: 20)),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            IntlPhoneField(
              cursorColor: Colors.white,
              autofocus: false,
              showCursor: false,
              flagsButtonMargin: EdgeInsets.zero,
              flagsButtonPadding: EdgeInsets.zero,
              controller: _controller,
              pickerDialogStyle: PickerDialogStyle(
                searchFieldInputDecoration: const InputDecoration(
                  icon: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                ),
                countryNameStyle: const TextStyle(
                  color: Colors.white,
                ),
                countryCodeStyle: const TextStyle(
                  color: Colors.white,
                ),
                backgroundColor: ColorConstants.instance.bacgroundColors,
              ),
              textAlignVertical: TextAlignVertical.top,
              textInputAction: TextInputAction.done,
              disableLengthCheck: true,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              dropdownIcon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
              ),
              showDropdownIcon: true,
              dropdownTextStyle: const TextStyle(color: Colors.transparent),
              enabled: true,
              keyboardType: TextInputType.phone,
              showCountryFlag: false,
              style: const TextStyle(color: Colors.white),
              obscureText: false,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  labelText: '',
                  hintText: '',
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: ColorConstants.instance.iconBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.phone_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10), // add spacing between icon and text
                      Text(
                        '+$_countryCode',
                        style: TextStyle(
                          color: ColorConstants.instance.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
              onChanged: (phone) {},
              onSaved: (phone) {},
              onCountryChanged: (country) {
                setState(() {
                  _countryCode = int.parse(country.dialCode);
                });
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              text: 'CONTINUE',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ListScreen()));
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(children: [
                Icon(
                  Icons.info_outline,
                  color: ColorConstants.instance.blue,
                  size: 30.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Tracking can take up to 15 minutes\nto start.',
                  style: TextStyle(color: ColorConstants.instance.blue, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
