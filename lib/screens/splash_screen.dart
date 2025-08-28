import 'dart:async';
import 'package:flutter/material.dart';
import 'package:samvad/animation/slide_transaition_route.dart';
import 'package:samvad/screens/index_screen.dart';
import 'package:samvad/screens/home_screen.dart';
import 'package:samvad/utils/session_manager.dart'; // <-- make sure to import SessionManager

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 4)); // splash delay

    String? email = await SessionManager.getUserEmail();

    if (!mounted) return;

    if (email != null) {
      // user already logged in -> go to HomeScreen
      Navigator.pushReplacement(
        context,
        SlideTransitionRoute(page: const HomeScreen()),
      );
    } else {
      // no session -> go to IndexScreen
      Navigator.pushReplacement(
        context,
        SlideTransitionRoute(page: const IndexScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/samvad_splash.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
