import 'package:codigo6_alertas/pages/home_page.dart';
import 'package:codigo6_alertas/pages/map_page.dart';
import 'package:codigo6_alertas/pages/news_page.dart';
import 'package:codigo6_alertas/pages/profile_page.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int indexPage = 0;

  List<Widget> pages = [
    HomePage(),
    NewsPage(),
    MapPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.amber,
        type: BottomNavigationBarType.fixed,
        currentIndex: indexPage,
        iconSize: 22.0,
        onTap: (int value) {
          indexPage = value;
          setState(() {});
        },
        selectedFontSize: 16.0,
        selectedItemColor: Color(0xff605AF8),
        showSelectedLabels: true,
        selectedIconTheme: IconThemeData(
          size: 40.0,
        ),
        unselectedFontSize: 14,
        unselectedItemColor: Colors.black38,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "Noticias",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Mapa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
      body: pages[indexPage],
    );
  }
}
