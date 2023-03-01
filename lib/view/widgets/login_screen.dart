import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:note_it/constant.dart';
import 'package:note_it/routes_manager.dart';
import 'package:note_it/view/widgets/custom_text_form_field.dart';

import 'main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _visiblePassword = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: SingleChildScrollView(
        child: Column(
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
                      padding: const EdgeInsets.only(right: 110, top: 75),
                      child: Image.asset('assets/images/note-icon.png'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'NOTE-IT',
              style: TextStyle(
                fontFamily: FontConstants.hubballiFont,
                fontSize: 15.sp,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/images/Ellipse.svg',
                      alignment: Alignment.topLeft,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 95.h,
                              left: 40.w,
                              right: 40.w,
                            ),
                            child: CustomTextFormField(
                              controller: _emailController,
                              validator: (val) => val!.isEmpty
                                  ? 'please enter your Email or Username'
                                  : null,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: true,
                              hintText: 'Email or Username',
                              hintStyle: const TextStyle(color: Colors.black),
                              style: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 40.w,
                              right: 40.w,
                            ),
                            child: CustomTextFormField(
                              controller: _passwordController,
                              validator: (val) => val!.isEmpty
                                  ? 'please enter your password'
                                  : null,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: !_visiblePassword,
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.black),
                              style: const TextStyle(color: Colors.black),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black54,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _visiblePassword = !_visiblePassword;
                                  });
                                },
                                child: Icon(
                                  _visiblePassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            MainButton(
              backgroundColor: primary,
              textColor: Colors.white,
              text: 'log-in',
              onPressed: () {
                setState(() {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed(Routes.myNotesRoute);
                    _formKey.currentState!.reset();
                  } else {
                    debugPrint('there was an error');
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
