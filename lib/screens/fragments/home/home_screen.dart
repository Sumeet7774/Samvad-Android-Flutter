import 'package:flutter/material.dart';
import 'package:samvad/screens/fragments/home/home_fragment.dart';
import 'package:samvad/screens/fragments/call_history/call_history_screen.dart';
import 'package:samvad/screens/fragments/profile/profile_screen.dart';
import 'package:samvad/custom/custom_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeFragmentPage(),
    CallHistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          final inFromRight =
              Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );

          final inFromLeft =
              Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              );

          // Decide direction based on tab index movement
          return SlideTransition(
            position: _currentIndex > (_pages.indexOf(child))
                ? inFromLeft
                : inFromRight,
            child: child,
          );
        },
        child: _pages[_currentIndex], // widget keyed below
        switchInCurve: Curves.easeInOut,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30.0), // ✅ space at the bottom
        child: CustomBottomNavigation(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
