import 'package:flutter/material.dart';
import 'package:taste_khajana/screens/components/AppDrawer.dart';
import 'package:taste_khajana/screens/favorite/FavoriteScreen.dart';

import './categories_catalog/CategoryCatalogScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final _screens = [CategoryCatalogScreen(), FavoriteScreen()];

  int _selectedIndex = 0;

  void selectTab(int i) {
    setState(() {
      _selectedIndex = i;
    });
  }

  BottomNavigationBarItem MyTab(IconData icon, String text) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).primaryColor,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      activeIcon: Icon(
        icon,
        color: Colors.blue,
        size: 35,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taste Factory'),
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: selectTab,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          MyTab(Icons.category, 'Catalog'),
          MyTab(Icons.favorite, 'Favorites')
        ],
      ),
      body: _screens[_selectedIndex],
    );
  }
}
