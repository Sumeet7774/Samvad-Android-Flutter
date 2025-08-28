import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:samvad/custom/custom_textfield.dart';
import 'package:samvad/custom/custom_button.dart';
import 'package:samvad/utils/lowercase_text_formatter.dart';
import 'package:samvad/screens/login/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailidController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  final LoginController _controller = LoginController();

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
          text: "Login",
          onPressed: () {
            _controller.validateAndLogin(
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
