import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samvad/screens/login/login_header.dart';
import 'package:samvad/screens/login/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF1C3D6D),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const LoginHeader(),
              SizedBox(height: 40.h),

              const LoginForm(), // ✅ no photo picker, no username
            ],
          ),
        ),
      ),
    );
  }
}
