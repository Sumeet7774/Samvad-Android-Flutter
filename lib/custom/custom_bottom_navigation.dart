import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildNavItem(index: 0, icon: Icons.home_filled, label: "Home"),
            _buildNavItem(index: 1, icon: Icons.history, label: "Call History"),
            _buildNavItem(
              index: 2,
              icon: Icons.person_outline,
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = currentIndex == index;

    return Expanded(
      // <-- takes equal space
      child: InkWell(
        borderRadius: BorderRadius.circular(40), // ripple effect inside nav bar
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? _getFilledIcon(icon) : icon,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// helper to return filled icons when selected
  IconData _getFilledIcon(IconData icon) {
    if (icon == Icons.home_filled) return Icons.home_filled;
    if (icon == Icons.history) return Icons.history_rounded;
    if (icon == Icons.person_outline) return Icons.person;
    return icon;
  }
}
