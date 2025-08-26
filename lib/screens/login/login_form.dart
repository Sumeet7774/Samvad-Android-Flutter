import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samvad/custom/custom_textfield.dart';
import 'package:samvad/custom/custom_button.dart';
import 'package:samvad/custom/custom_motion_toast_message.dart';
import 'package:samvad/utils/lowercase_text_formatter.dart';
import 'package:samvad/screens/login/login_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailidController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _validateAndLogin() {
    String emailid = _emailidController.text.trim();
    String password = _passwordController.text.trim();

    if (emailid.isEmpty || password.isEmpty) 
    {
      CustomToast.errorToast(context, "Please provide all credentials.");
    } 
    else if (emailid.contains(" ") || password.contains(" ")) 
    {
      CustomToast.errorToast(context, "Spaces are not allowed.");
    } 
    else if (!LoginValidator.isValidEmail(emailid)) 
    {
      CustomToast.errorToast(context, "Please enter a valid email address.");
    } 
    else if (!LoginValidator.isValidPassword(password)) 
    {
      CustomToast.errorToast(context,"Password must be 8 chars with A-Z, 0-9 and symbols.",);
    } 
    else 
    {
      CustomToast.successToast(context,"Validation Passed! Ready for Firebase Login.",);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        CustomButton(text: "Login", onPressed: _validateAndLogin),
      ],
    );
  }
}
