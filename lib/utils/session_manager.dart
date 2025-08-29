import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:samvad/screens/fragments/home/home_screen.dart';
import 'package:samvad/screens/index_screen.dart';

class SessionManager {
  static const String _keyEmail = "user_email";

  /// Save user email
  static Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyEmail, email);
  }

  /// Get user email
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyEmail);
  }

  /// Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyEmail);
  }

  /// Clear session (Logout)
  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyEmail);
  }

  /// Handle redirection after splash
  static Future<void> handleSession(BuildContext context) async {
    bool loggedIn = await isLoggedIn();

    if (loggedIn) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
    } else {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const IndexScreen()));
    }
  }
}
