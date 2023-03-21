// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helper/helper.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
// import 'package:neeleez_flutter_app/screens/dashboard/dashbard_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(MyImage.splashBackground1),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          // physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      height: 220,
                      MyImage.logo,
                    ),
                    GestureDetector(
                      onTap: () => Get.locale == const Locale('ur', 'PK') ? Get.updateLocale(const Locale('en', 'US')) : Get.updateLocale(const Locale('ur', 'PK')),
                      child: Text(
                        'registerNow'.tr,
                        style: Get.textTheme.headline1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 280,
                      child: Text(
                        'registerText'.tr,
                        style: Get.textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'General Info:'.tr,
                        style: Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 4,
                        width: 35,
                        decoration: const BoxDecoration(
                          color: Palettes.white,
                        ),
                        // child: ,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    CustomTextField(
                      name: 'Company Name:',
                      prefixIconPath: MyIcon.imgCompany,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    CustomTextField(
                      name: 'Business Type:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    CustomTextField(
                      name: 'Gender:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    CustomTextField(
                      name: 'WhatsApp:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    CustomTextField(
                      name: 'Telephone:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    CustomTextField(
                      name: 'Email:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location:'.tr,
                        style: Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 4,
                        width: 35,
                        decoration: const BoxDecoration(
                          color: Palettes.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const CustomTextField(
                      name: 'Country:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    const CustomTextField(
                      name: 'State/Province:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    const CustomTextField(
                      name: 'City:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 200,
                      decoration: BoxDecoration(
                        color: Palettes.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login Information:'.tr,
                        style: Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 4,
                        width: 35,
                        decoration: const BoxDecoration(
                          color: Palettes.white,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const CustomTextField(
                      name: 'Username / Email:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    const CustomTextField(
                      name: 'Password:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      onTap: () {},
                      text: 'register'.tr,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                _bottomLine(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _bottomLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${'alreadyHaveAnAccount'.tr} ',
          style: Get.textTheme.bodyText2,
        ),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Text(
            'logIn'.tr,
            style: Get.textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
