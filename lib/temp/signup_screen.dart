import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samvad/custom/custom_textfield.dart';
import 'package:samvad/custom/custom_button.dart';
import 'package:samvad/custom/custom_motion_toast_message.dart';
import 'package:samvad/screens/index_screen.dart';
import 'package:samvad/utils/lowercase_text_formatter.dart';
import 'package:samvad/custom/custom_backbutton.dart';
import 'package:samvad/animation/reverse_slide_transition_route.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailidController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  XFile? _profilePhoto;
  bool _obscurePassword = true;

  Future<void> _pickProfilePhoto() async {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Select Profile Photo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.blue),
                title: const Text("Take a photo"),
                onTap: () async {
                  Navigator.pop(ctx);
                  final pickedImage = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                  );
                  if (pickedImage != null) {
                    setState(() {
                      _profilePhoto = pickedImage;
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.green),
                title: const Text("Choose from gallery"),
                onTap: () async {
                  Navigator.pop(ctx);
                  final pickedImage = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedImage != null) {
                    setState(() {
                      _profilePhoto = pickedImage;
                    });
                  }
                },
              ),
              if (_profilePhoto != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text("Remove photo"),
                  onTap: () {
                    Navigator.pop(ctx);
                    setState(() {
                      _profilePhoto = null;
                    });
                    CustomToast.warningToast(context, "Profile photo removed.");
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  bool _isValidUsername(String username) {
    final regex = RegExp(r'^[a-zA-Z]+$');
    return regex.hasMatch(username);
  }

  bool _isValidEmail(String emailid) {
    final emailPattern = RegExp(r'^[a-z][a-z0-9]*@gmail\.com$');
    return emailPattern.hasMatch(emailid);
  }

  bool _isValidPassword(String password) {
    if (password.length < 8) return false;
    final regex = RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$');
    return regex.hasMatch(password);
  }

  void _validateAndSignUp() {
    String username = _usernameController.text.trim();
    String emailid = _emailidController.text.trim();
    String password = _passwordController.text.trim();

    if (_profilePhoto == null) {
      CustomToast.errorToast(context, "Please select a profile photo.");
    } else if (username.isEmpty || emailid.isEmpty || password.isEmpty) {
      CustomToast.errorToast(
        context,
        "Please provide all of your credentials.",
      );
    } else if (username.contains(" ") ||
        emailid.contains(" ") ||
        password.contains(" ")) {
      CustomToast.errorToast(context, "Spaces are not allowed.");
    } else if (!_isValidUsername(username)) {
      CustomToast.errorToast(context, "Username must contain only letters.");
    } else if (!_isValidEmail(emailid)) {
      CustomToast.errorToast(context, "Please enter a valid email address.");
    } else if (!_isValidPassword(password)) {
      CustomToast.errorToast(
        context,
        "Password must be 8 chars with A-Z,0-9 and symbols",
      );
    } else if (username.length > 12) {
      CustomToast.warningToast(
        context,
        "Username cannot exceed 12 characters.",
      );
    } else {
      CustomToast.successToast(
        context,
        "Validation Passed! Ready for Firebase Register.",
      );
      // TODO: Call Firebase Register here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C3D6D),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ✅ Custom Back Button at the top left
              Align(
                alignment: Alignment.centerLeft,
                child: CustomBackButton(
                  // color: Colors.white,
                  size: 35, // ✅ control size here
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      ReverseSlideTransitionRoute(
                        page: const IndexScreen(), // go back with animation
                      ),
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
              SizedBox(height: 40.h),

              GestureDetector(
                onTap: _pickProfilePhoto,
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundColor: Colors.white24,
                  backgroundImage: _profilePhoto != null
                      ? FileImage(File(_profilePhoto!.path))
                      : null,
                  child: _profilePhoto == null
                      ? Icon(Icons.camera_alt, size: 40.sp, color: Colors.white)
                      : null,
                ),
              ),
              SizedBox(height: 30.h),

              CustomTextField(
                controller: _usernameController,
                hintText: "Username",
                inputFormatters: [LowerCaseTextFormatter()],
              ),
              SizedBox(height: 25.h),

              CustomTextField(
                controller: _emailidController,
                hintText: "Email ID",
                inputFormatters: [LowerCaseTextFormatter()],
              ),
              SizedBox(height: 25.h),

              CustomTextField(
                controller: _passwordController,
                hintText: "Password",
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
              SizedBox(height: 50.h),

              CustomButton(
                text: "Sign Up",
                onPressed: () {
                  _validateAndSignUp();
                },
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
