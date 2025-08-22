import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samvad/custom/custom_elevated_button.dart';
// import 'package:samvad/custom/custom_motion_toast_message.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background Image
          Positioned.fill(
            child: Image.asset("assets/samvad_splash.png", fit: BoxFit.cover),
          ),

          /// Buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 50.h,
              ), 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomElevatedButton(
                    text: "LOGIN",
                    onPressed: () {
                      // TODO: Navigate to Login Screen
                    },
                  ),
                  SizedBox(height: 20.h), // responsive spacing
                  CustomElevatedButton(
                    text: "SIGNUP",
                    onPressed: () {
                      // TODO: Navigate to Signup Screen
                    },
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
