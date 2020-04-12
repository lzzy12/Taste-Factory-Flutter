import 'package:flutter/material.dart';
import 'package:taste_khajana/screens/category/RecipeListElement.dart';

import '../../models/dummy_data.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: DUMMY_FAVORITES.length,
        itemBuilder: (context, i) {
          return RecipeListElement(DUMMY_FAVORITES[i]);
        },
      ),
    );
  }
}
