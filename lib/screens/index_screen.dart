import 'package:flutter/material.dart';

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
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Login Screen
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 80),
                      backgroundColor: const Color(0xFF3A80C1),
                      side: BorderSide(color: Colors.black, width: 1.5),
                    ),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Signup Screen
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(350, 80),
                      backgroundColor: const Color(0xFF3A80C1),
                      side: BorderSide(color: Colors.black, width: 1.5),
                    ),
                    child: const Text(
                      "SIGNUP",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
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
