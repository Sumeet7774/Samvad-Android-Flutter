import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samvad/screens/signup/signup_header.dart';
import 'package:samvad/screens/signup/signup_profile_picker.dart';
import 'package:samvad/screens/signup/signup_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  XFile? _selectedPhoto;

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
              const SignUpHeader(),
              SizedBox(height: 40.h),

              SignUpProfilePicker(
                onPhotoSelected: (photo) {
                  setState(() {
                    _selectedPhoto = photo;
                  });
                },
              ),

              SizedBox(height: 30.h),

              SignUpForm(selectedPhoto: _selectedPhoto),
            ],
          ),
        ),
      ),
    );
  }
}
