import 'package:flutter/material.dart';
import 'fetch/slotsearched.dart';
import 'tab.dart';
import 'tabcontent.dart';

class AirbnbTabBar {
  static const TabBar tabBar = TabBar(
    isScrollable: true,
    padding: EdgeInsets.symmetric(horizontal: 5.0),
    labelColor: Colors.black,
    unselectedLabelColor: Color(0xFF717171),
    indicatorWeight: 3.0,
    indicatorColor: Colors.black,
    indicatorPadding: EdgeInsets.symmetric(horizontal: 20.0),
    tabs: [
      AirbnbTab(
        name: "Futebol",
        icon: Icons.sports_soccer,
        width: 60.0,
      ),
      AirbnbTab(
        name: "Vôlei",
        icon: Icons.sports_volleyball_outlined,
        width: 50.0,
      ),
      AirbnbTab(
        name: "Tênis",
        icon: Icons.sports_tennis,
        width: 50.0,
      ),
      AirbnbTab(
        name: "Basquete",
        icon: Icons.sports_basketball,
        width: 70.0,
      ),
      AirbnbTab(
        name: "Futebol Americano",
        icon: Icons.sports_football,
        width: 110.0,
      ),
    ],
  );

  Future<List<Widget>> getTabBarView() async {
    List<SlotSearched> list = await SlotSearched.fetchSearchedSlots();

    List<Widget> tabsContent = [];
    for (var element in list) {
      tabsContent.add(TabContent(slot: element));
    }

    return tabsContent;
  }
}
