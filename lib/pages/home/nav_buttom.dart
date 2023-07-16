import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  final controller = PageController();
  List<Widget> screen = [];
  @override
  Widget build(BuildContext context) {
    return SlidingClippedNavBar(
      backgroundColor: Colors.white,
      onButtonPressed: (index) {
        setState(() {
          selectedIndex = index;
        });
        controller.animateToPage(selectedIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutQuad);
      },
      iconSize: 30,
      activeColor: Colors.black,
      selectedIndex: selectedIndex,
      barItems: [
        BarItem(title: 'Inicio', icon: Icons.abc),
        BarItem(title: 'Ranking', icon: Icons.abc),
        BarItem(title: 'Configurações', icon: Icons.abc),
      ],
    );
  }
}
