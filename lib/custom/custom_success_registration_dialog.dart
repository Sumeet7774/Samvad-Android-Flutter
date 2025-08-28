import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samvad/custom/custom_button.dart';

class CustomSuccessRegistrationDialog extends StatelessWidget {
  final VoidCallback onOkPressed;

  const CustomSuccessRegistrationDialog({super.key, required this.onOkPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/success.png", width: 80.w, height: 80.w),

            SizedBox(height: 10.h),

            Text(
              "Success!",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 5.h),

            Text(
              "Registration Successful!",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),

            SizedBox(height: 20.h),

            CustomButton(
              text: "OK",
              backgroundColor: const Color(0xFF4F75FF),
              onPressed: onOkPressed,
            ),
          ],
        ),
      ),
    );
  }
}
