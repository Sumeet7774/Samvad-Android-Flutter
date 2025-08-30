import 'package:flutter/material.dart';
import 'package:samvad/custom/custom_button.dart';

class HomeFragmentPage extends StatelessWidget {
  const HomeFragmentPage({super.key});

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
            color: const Color(0xFF274B87), // darker shade
            child: Text(
              "Home",
              style: TextStyle(
                fontSize: screenWidth * 0.07, // 7% of screen width
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // ✅ Body content (Host + Join buttons centered)
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: screenWidth * 0.9, // 90% of screen width
                    child: CustomButton(
                      text: "Host",
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Host button pressed")),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05), // 5% spacing
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: CustomButton(
                      text: "Join",
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Join button pressed")),
                        );
                      },
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
