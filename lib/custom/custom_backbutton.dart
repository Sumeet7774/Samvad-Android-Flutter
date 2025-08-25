import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? size; // ✅ still nullable

  const CustomBackButton({
    Key? key,
    this.onPressed,
    this.size, // ✅ size comes from parent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        "assets/svg/white_backarrow.svg", // ✅ your svg path
        width: size ?? 30.0,
        height: size ?? 30.0,
        color: Colors.white, // ✅ force white color
      ),
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
    );
  }
}
