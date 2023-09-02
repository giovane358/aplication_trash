import 'package:application_lixo/data/controller/controller_home.dart';
import 'package:application_lixo/pages/home/map.dart';
import 'package:application_lixo/pages/home/ranking.dart';
import 'package:application_lixo/pages/home/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(ControllerHome());
  int selectedIndex = 0;
  final page = PageController();
  List<Widget> screen = [
    const MapsPage(),
    const RankingPage(),
    const SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: page,
        children: screen,
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.green,
        onButtonPressed: (index) {
          setState(() {
            selectedIndex = index;
          });
          page.animateToPage(selectedIndex,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutQuad);
        },
        iconSize: 30,
        activeColor: Colors.white,
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(title: 'Inicio', icon: Icons.home),
          BarItem(title: 'Ranking', icon: Icons.trending_up),
          BarItem(title: 'Configurações', icon: Icons.settings),
        ],
      ),
    );
  }
}
