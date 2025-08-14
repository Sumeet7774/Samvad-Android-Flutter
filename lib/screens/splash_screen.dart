import 'dart:async';
import 'package:flutter/material.dart';
import 'package:samvad/animation/slide_transaition_route.dart';
// import 'package:samvad/screens/home_screen.dart';
import 'package:samvad/screens/index_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        SlideTransitionRoute(page: const IndexScreen()),
      );
    });
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