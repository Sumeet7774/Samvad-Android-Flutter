import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samvad/custom/custom_elevated_button.dart';
import 'package:samvad/screens/login/login_page.dart';
import 'package:samvad/screens/signup/signup_page.dart';
import 'package:samvad/animation/slide_transition_route.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  void _handleLogin() {
    Navigator.push(context,SlideTransitionRoute(page: const LoginPage()));
  }

  void _handleSignup() {
    Navigator.push(context, SlideTransitionRoute(page: const SignUpPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/samvad_splash.png", fit: BoxFit.cover),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 50.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomElevatedButton(text: "LOGIN", onPressed: _handleLogin),
                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    text: "SIGNUP",
                    onPressed: _handleSignup,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
