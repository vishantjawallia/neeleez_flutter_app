// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../config/palettes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool? rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(MyImage.splashBackground1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 34),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(
                    height: 180.sp,
                    MyImage.logo,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Log in',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedadipiscing elit",
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4.h),
                      CustomTextField(
                        controller: _email,
                        name: 'Username / Email:',
                      ),
                      SizedBox(height: 2.h),
                      CustomTextField(
                        controller: _password,
                        name: 'Password',
                        obscureText: true,
                      ),
                      Align(
                        widthFactor: 0.246.w,
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                Checkbox(
                                  fillColor: MaterialStateProperty.all(Palettes.white),
                                  focusNode: FocusNode(),
                                  focusColor: Palettes.primary,
                                  checkColor: Palettes.primary,
                                  visualDensity: VisualDensity.standard,
                                  value: rememberMe,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      rememberMe = !rememberMe!;
                                    });
                                  },
                                ),
                                Text(
                                  'Remember Me',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forgot Password ?',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6.h),
                      ElevatedButton(
                        onPressed: () => nextHandler(context),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Palettes.white),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 38, vertical: 8),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: Palettes.white,
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          style: Theme.of(context).textTheme.headline5!.copyWith(color: Palettes.red),
                          'Log in Now',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      "Sign Up",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CustomTextField _textfield(BuildContext context) {
    return const CustomTextField(
      name: 'Username / Email:',
    );
  }

  nextHandler(BuildContext context) {}
}
