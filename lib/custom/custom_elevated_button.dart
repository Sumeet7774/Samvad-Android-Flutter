import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          0.85.sw,
          60.h,
        ), 
        backgroundColor: const Color(0xFF3A80C1),
        side: BorderSide(color: Colors.black, width: 1.w),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 30.sp, 
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
