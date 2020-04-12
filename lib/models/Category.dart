import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category(
      {@required this.id, @required this.title, @required this.color});

  Category.from(Category c)
      : id = c.id,
        title = c.title,
        color = c.color;

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': title, 'color': color};
  }
}
