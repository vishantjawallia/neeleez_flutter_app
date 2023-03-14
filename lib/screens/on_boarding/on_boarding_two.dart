import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/screens/on_boarding/on_boarding_three.dart';
import 'package:sizer/sizer.dart';

class OnBoardingTwoScreen extends StatelessWidget {
  const OnBoardingTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage(MyImage.onBoarding2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      height: 180.sp,
                      MyImage.logo,
                    ),
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
                        'Lorem Ipsum',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 2.5.h),
                      ElevatedButton(
                        onPressed: () => nextHandler(context),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Palettes.red),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 38, vertical: 8),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: Palettes.red,
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          style: Theme.of(context).textTheme.headline4,
                          'NEXT',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextHandler(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const OnBoardingThreeScreen()));
  }
}
