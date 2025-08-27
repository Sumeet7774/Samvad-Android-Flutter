import 'package:flutter/material.dart';
import 'package:samvad/custom/custom_motion_toast_message.dart';
import 'package:samvad/screens/signup/signup_validator.dart';
import 'package:samvad/services/signup/signup_service.dart';
import 'package:samvad/custom/custom_success_dialog.dart';
import 'package:samvad/screens/index_screen.dart';

class SignupController {
  final SignupService _signupService = SignupService();

  Future<void> validateAndSignUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      CustomToast.errorToast(context, "Please provide all credentials.");
    } else if (email.contains(" ") || password.contains(" ")) {
      CustomToast.errorToast(context, "Spaces are not allowed.");
    } else if (!SignUpValidator.isValidEmail(email)) {
      CustomToast.errorToast(context, "Please enter a valid email address.");
    } else if (!SignUpValidator.isValidPassword(password)) {
      CustomToast.errorToast(
        context,
        "Password must be 8 chars with A-Z,0-9 and symbols.",
      );
    } else {
      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) =>
              const Center(child: CircularProgressIndicator()),
        );

        final user = await _signupService.registerUser(
          email: email,
          password: password,
        );

        Navigator.pop(context);

        if (user != null) {
          CustomToast.successToast(
            context,
            "Signup Successful! Welcome ${user.email_id}. Click OK to redirect.",
          );

          await Future.delayed(const Duration(milliseconds: 300));

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => CustomSuccessDialog(
              onOkPressed: () {
                Navigator.pop(context);
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const IndexScreen()),
                  (route) => false,
                );
              },
            ),
          );
        }
      } catch (e) {
        Navigator.pop(context);
        CustomToast.errorToast(context, e.toString());
      }
    }
  }
}
