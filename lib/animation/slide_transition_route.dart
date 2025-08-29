import 'package:flutter/material.dart';

class SlideTransitionRoute extends PageRouteBuilder {
  final Widget page;

  SlideTransitionRoute({required this.page})
    : super(
        transitionDuration: const Duration(milliseconds: 800), // slower speed
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // start from right
          const end = Offset.zero;
          const curve = Curves.easeInOut; // smooth curve

          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
}