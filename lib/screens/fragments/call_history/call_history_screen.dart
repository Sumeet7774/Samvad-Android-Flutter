import 'package:flutter/material.dart';

class CallHistoryScreen extends StatelessWidget {
  const CallHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF1C3D6D), // main background
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ✅ Responsive Custom Toolbar
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02, // 2% of screen height
              horizontal: screenWidth * 0.05, // 5% of screen width
            ),
            color: const Color(0xFF274B87), // darker shade for header
            child: Text(
              "Call History",
              style: TextStyle(
                fontSize: screenWidth * 0.07, // 7% of screen width
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // ✅ Body content (replace with your call history list later)
          Expanded(
            child: Center(
              child: Text(
                "No Calls Found",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
