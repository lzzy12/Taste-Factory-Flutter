import 'package:flutter/material.dart';
import 'package:taste_khajana/models/Category.dart';
import 'package:taste_khajana/screens/category/CategoryScreen.dart';

class CategoryBox extends StatelessWidget {
  final Category category;

  CategoryBox(this.category);

  void onSelected(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryScreen.route, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelected(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.grey,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [category.color.withOpacity(0.65), category.color])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            category.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
