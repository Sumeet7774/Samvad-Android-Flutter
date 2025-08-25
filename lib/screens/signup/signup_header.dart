import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samvad/custom/custom_backbutton.dart';
import 'package:samvad/screens/index_screen.dart';
import 'package:samvad/animation/reverse_slide_transition_route.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: CustomBackButton(
            // color: Colors.white,
            size: 35,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                ReverseSlideTransitionRoute(page: const IndexScreen()),
              );
            },
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "Samvad",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 60.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
