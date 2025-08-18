import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomElevatedButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(350, 80),
        backgroundColor: const Color(0xFF3A80C1),
        side: const BorderSide(color: Colors.black, width: 1.5),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: "Poppins",
          fontSize: 35,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
