import 'package:flutter/material.dart';
import 'package:taste_khajana/models/SettingsData.dart';
import 'package:taste_khajana/models/dummy_data.dart';
import 'package:taste_khajana/screens/category/RecipeListElement.dart';

import '../../models/Category.dart';

class CategoryScreen extends StatelessWidget {
  static const String route = '/category-screen';
  final SettingsData settings;

  CategoryScreen(this.settings);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    var data = [];
    data = DUMMY_MEALS.where((e) {
      if (e.categories.contains(category.id)) {
        if (settings.onlyGlutenFree && !e.isGlutenFree) return false;
        if (settings.onlyIsVegan && !e.isVegan) return false;
        if (settings.onlyLactoseFree && !e.isLactoseFree) return false;
        return true;
      }
      return false;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, i) {
              return RecipeListElement(data[i]);
            }),
      ),
    );
  }
}
