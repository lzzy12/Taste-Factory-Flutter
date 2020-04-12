import 'package:flutter/material.dart';
import './CategoryBox.dart';
import '../../models/dummy_data.dart';

class CategoryCatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: GridView.builder(
          itemCount: DUMMY_CATEGORIES.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3 / 2,
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          itemBuilder: (context, i) {
            return CategoryBox(DUMMY_CATEGORIES[i]);
          }),
    );
  }
}
