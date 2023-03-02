import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_it/constant.dart';
import 'package:note_it/view/widgets/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  SvgPicture.asset('assets/images/Rectangle.svg'),
                  Padding(
                    padding: const EdgeInsets.only(right: 110),
                    child: Image.asset('assets/images/note-icon.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 180, top: 240),
                    child: Text(
                      'NOTE-IT',
                      style: TextStyle(
                        fontFamily: FontConstants.hubballiFont,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Stay',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: FontConstants.rulukoFont,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                'centered',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: primary,
                  fontFamily: FontConstants.rulukoFont,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SvgPicture.asset('assets/images/Ellipse.svg'),
              const SizedBox(
                width: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 46),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      })),
                      child: const Text(
                        'log-in',
                        style: TextStyle(
                          fontFamily: FontConstants.montserratFont,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'create a new account',
                        style: TextStyle(
                          fontFamily: FontConstants.montserratFont,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontFamily: FontConstants.montserratFont,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Image.asset(
                      'assets/images/google.png',
                      height: 25,
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sign in with Google',
                      style: TextStyle(
                        fontFamily: FontConstants.montserratFont,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Image.asset(
                      'assets/images/facebook.png',
                      height: 25,
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
