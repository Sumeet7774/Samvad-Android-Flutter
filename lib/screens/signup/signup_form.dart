import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samvad/custom/custom_textfield.dart';
import 'package:samvad/custom/custom_button.dart';
import 'package:samvad/custom/custom_motion_toast_message.dart';
import 'package:samvad/utils/lowercase_text_formatter.dart';
import 'package:samvad/screens/signup/signup_validator.dart';

class SignUpForm extends StatefulWidget {
  final XFile? selectedPhoto;

  const SignUpForm({super.key, required this.selectedPhoto});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _usernameController = TextEditingController();
  final _emailidController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _validateAndSignUp() {
    String username = _usernameController.text.trim();
    String emailid = _emailidController.text.trim();
    String password = _passwordController.text.trim();

    if (widget.selectedPhoto == null) {
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
    } else if (!SignUpValidator.isValidUsername(username)) {
      CustomToast.errorToast(context, "Username must contain only letters.");
    } else if (!SignUpValidator.isValidEmail(emailid)) {
      CustomToast.errorToast(context, "Please enter a valid email address.");
    } else if (!SignUpValidator.isValidPassword(password)) {
      CustomToast.errorToast(
        context,
        "Password must be 8 chars with A-Z,0-9 and symbols.",
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
              setState(() => _obscurePassword = !_obscurePassword);
            },
          ),
        ),
        SizedBox(height: 50.h),
        CustomButton(text: "Sign Up", onPressed: _validateAndSignUp),
      ],
    );
  }
}
