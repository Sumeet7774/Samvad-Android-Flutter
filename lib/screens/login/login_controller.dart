import 'package:flutter/material.dart';
import 'package:samvad/custom/custom_motion_toast_message.dart';
import 'package:samvad/screens/login/login_validator.dart';
import 'package:samvad/services/login_service.dart';
import 'package:samvad/custom/custom_success_login_dialog.dart';
import 'package:samvad/screens/home_screen.dart';
import 'package:samvad/utils/session_manager.dart';
import 'package:samvad/animation/slide_transaition_route.dart';

class LoginController {
  final LoginService _loginService = LoginService();

  Future<void> validateAndLogin({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      CustomToast.errorToast(context, "Please provide all credentials.");
    } else if (email.contains(" ") || password.contains(" ")) {
      CustomToast.errorToast(context, "Spaces are not allowed.");
    } else if (!LoginValidator.isValidEmail(email)) {
      CustomToast.errorToast(context, "Please enter a valid email address.");
    } else if (!LoginValidator.isValidPassword(password)) {
      CustomToast.errorToast(
        context,
        "Password must be 8 chars with A-Z, 0-9 and symbols.",
      );
    } else {
      try {
        // Show loader
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );

        final user = await _loginService.loginUser(
          email: email,
          password: password,
        );

        Navigator.pop(context); // Close loader

        if (user != null) {
          // ✅ Save session
          await SessionManager.saveUserEmail(user.email_id);

          CustomToast.successToast(
            context,
            "Login Successful! Welcome back ${user.email_id}.",
          );

          await Future.delayed(const Duration(milliseconds: 300));

          // ✅ Show success dialog with countdown
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => CustomSuccessLoginDialog(
              onRedirect: () {
                Navigator.pop(context); // close dialog
                Navigator.of(context).pushAndRemoveUntil(
                  SlideTransitionRoute(
                    page: const HomeScreen(),
                  ), // ✅ animated route
                  (route) => false,
                );
              },
            ),
          );
        }
      } catch (e) {
        Navigator.pop(context); // Close loader
        CustomToast.errorToast(context, e.toString());
      }
    }
  }
}
