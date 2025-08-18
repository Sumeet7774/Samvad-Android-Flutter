import 'package:flutter/material.dart';

import 'package:samvad/custom/custom_elevated_button.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/samvad_splash.png", fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomElevatedButton(
                    text: "LOGIN",
                    onPressed: () {
                      // Navigate to Login Screen
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomElevatedButton(
                    text: "SIGNUP",
                    onPressed: () {
                      // Navigate to Signup Screen
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
