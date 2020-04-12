import 'package:flutter/cupertino.dart';

enum Affordability { Affordable, Pricey, Expensive, Luxurious }

enum Complexity { Simple, Challenging, Hard }

extension on Complexity {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

extension on Affordability {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

class Meal {
  String id;
  String title;
  Affordability affordability;
  Complexity complexity;
  String imageUrl;
  bool isGlutenFree;
  bool isVegan;
  bool isVegetarian;
  bool isLactoseFree;
  int duration;
  List<String> categories;
  List<String> ingredients;
  List<String> steps;

  Meal(
      {@required this.id,
      @required this.title,
      @required this.affordability,
      @required this.complexity,
      @required this.imageUrl,
      @required this.isGlutenFree,
      @required this.isVegan,
      @required this.isVegetarian,
      @required this.isLactoseFree,
      @required this.duration,
      @required this.categories,
      @required this.ingredients,
      @required this.steps});

  Meal.fromJson(Map<String, dynamic> json)
      : this.id = json['id'],
        this.title = json['title'],
        this.affordability = json['affordability'],
        this.complexity = json['complexity'],
        this.imageUrl = json['imageUrl'],
        this.isGlutenFree = json['isGlutenFree'],
        this.isVegan = json['isVegan'],
        this.isVegetarian = json['isVegetarian'],
        this.isLactoseFree = json['isLactoseFree'],
        this.duration = json['duration'] {
    List<dynamic> categoriesList = json['categories'];

    this.categories = new List();

    this.categories.addAll(categoriesList.map((o) => o.toString()));

    List<dynamic> ingredientsList = json['ingredients'];

    this.ingredients = new List();

    this.ingredients.addAll(ingredientsList.map((o) => o.toString()));

    List<dynamic> stepsList = json['steps'];

    this.steps = new List();

    this.steps.addAll(stepsList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['affordability'] = this.affordability;
    data['complexity'] = this.complexity;
    data['imageUrl'] = this.imageUrl;
    data['isGlutenFree'] = this.isGlutenFree;
    data['isVegan'] = this.isVegan;
    data['isVegetarian'] = this.isVegetarian;
    data['isLactoseFree'] = this.isLactoseFree;
    data['duration'] = this.duration;
    data['categories'] = this.categories;
    data['ingredients'] = this.ingredients;
    data['steps'] = this.steps;
    return data;
  }
}
