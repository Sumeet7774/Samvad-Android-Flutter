import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samvad/custom/custom_textfield.dart';
import 'package:samvad/custom/custom_button.dart';
import 'package:samvad/utils/lowercase_text_formatter.dart';
import 'package:samvad/screens/signup/signup_controller.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailidController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  final SignupController _controller = SignupController();

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
        CustomButton(
          text: "Sign Up",
          onPressed: () {
            _controller.validateAndSignUp(
              context: context,
              email: _emailidController.text.trim(),
              password: _passwordController.text.trim(),
            );
          },
        ),
      ],
    );
  }
}
