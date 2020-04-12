import 'package:flutter/material.dart';
import 'package:taste_khajana/models/SettingsData.dart';
import 'package:taste_khajana/screens/meal_details/MealDetailsScreen.dart';
import 'package:taste_khajana/screens/settings/SettingsScreen.dart';
import 'package:taste_khajana/screens/tabs.dart';

import './screens/category/CategoryScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  // This widget is the root of your application.
  var settings = SettingsData.all(false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taste Khajana',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {
        '/': (_) => TabsScreen(), // home
        CategoryScreen.route: (_) => CategoryScreen(settings),
        MealDetailsScreen.route: (_) => MealDetailsScreen(),
        SettingsScreen.route: (_) => SettingsScreen(settings, (value) {
              setState(() {
                settings = value;
              });
            })
      },
    );
  }
}
