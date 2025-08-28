import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSuccessLoginDialog extends StatefulWidget {
  final VoidCallback onRedirect; // will navigate to Home

  const CustomSuccessLoginDialog({super.key, required this.onRedirect});

  @override
  State<CustomSuccessLoginDialog> createState() =>
      _CustomSuccessLoginDialogState();
}

class _CustomSuccessLoginDialogState extends State<CustomSuccessLoginDialog> {
  int countdown = 3; // Start countdown from 3
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start countdown
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown == 1) {
        timer.cancel();
        widget.onRedirect(); // Navigate after countdown ends
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
            // ✅ Success image
            Image.asset("assets/success.png", width: 80.w, height: 80.w),

            SizedBox(height: 10.h),

            // ✅ Success text
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
              "Login Successful!",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 15.h),

            // ✅ Redirect countdown
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(strokeWidth: 2),
                SizedBox(width: 10.w),
                Text(
                  "Redirecting to Home in $countdown...",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
