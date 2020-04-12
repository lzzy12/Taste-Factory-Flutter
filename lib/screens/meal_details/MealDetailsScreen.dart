import 'package:flutter/material.dart';
import 'package:taste_khajana/models/Meal.dart';

import '../../models/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const route = '/meal-details';

  Widget Title(String text) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }

  Widget cardDesign(Widget child, Size size) {
    return Container(
      height: size.height / 3,
      width: size.width,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: Card(
        child: Padding(padding: const EdgeInsets.all(16.0), child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 254, 229, 1),
      appBar: AppBar(
        title: Text(meal.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DUMMY_FAVORITES.add(meal);
        },
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.favorite),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: <Widget>[
              Image.network(
                meal.imageUrl,
                fit: BoxFit.fill,
                height: size.height / 3,
                width: size.width,
              ),
              Title('Ingredients (${meal.ingredients.length})'),
              cardDesign(
                  ListView.builder(
                      itemCount: meal.ingredients.length,
                      itemBuilder: (ctx, i) {
                        return Card(
                          color: Colors.amberAccent,
                          child: Container(
                            margin: EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              meal.ingredients[i],
                            ),
                          ),
                        );
                      }),
                  size),
              SizedBox(
                height: 8,
              ),
              Title('Steps (${meal.steps.length})'),
              cardDesign(
                  ListView.builder(
                      itemCount: meal.steps.length,
                      itemBuilder: (context, i) {
                        return Container(
                          color: Colors.amberAccent,
                          margin: EdgeInsets.all(4),
                          child: ListTile(
                            leading: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: Center(
                                child: Text('#${i + 1}'),
                              ),
                            ),
                            title: Text(
                              meal.steps[i],
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        );
                      }),
                  size)
            ],
          ),
        ),
      ),
    );
  }
}
