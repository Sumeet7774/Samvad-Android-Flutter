import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToast {
  static TextStyle _titleStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
    );

    static TextStyle _descriptionStyle = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );


  static void successToast(BuildContext context, String message) {
    MotionToast.success(
      title: Text("Success", style: _titleStyle),
      description: Text(message, style: _descriptionStyle),
      toastAlignment: Alignment.bottomCenter,
      animationType: AnimationType.slideInFromBottom,
      animationCurve: Curves.easeInOut,
      barrierColor: Colors.black.withOpacity(0.3),
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }

  static void errorToast(BuildContext context, String message) {
    MotionToast.error(
      title: Text("Error", style: _titleStyle),
      description: Text(message, style: _descriptionStyle),
      toastAlignment: Alignment.bottomCenter,
      animationType: AnimationType.slideInFromBottom,
      animationCurve: Curves.easeInOut,
      barrierColor: Colors.black.withOpacity(0.3),
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }

  static void warningToast(BuildContext context, String message) {
    MotionToast.warning(
      title: Text("Warning", style: _titleStyle),
      description: Text(message, style: _descriptionStyle),
      toastAlignment: Alignment.bottomCenter,
      animationType: AnimationType.slideInFromBottom,
      animationCurve: Curves.easeInOut,
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }

  static void infoToast(BuildContext context, String message) {
    MotionToast.info(
      title: Text("Info", style: _titleStyle),
      description: Text(message, style: _descriptionStyle),
      toastAlignment: Alignment.bottomCenter,
      animationType: AnimationType.slideInFromBottom,
      animationCurve: Curves.easeInOut,
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }
}
