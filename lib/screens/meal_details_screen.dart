import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(text,
          style: const TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold)),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final routeMealId =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealId = routeMealId['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle("Ingredients"),
          buildContainer(ListView.builder(
            itemBuilder: (ctx, index) => Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  selectedMeal.ingredients[index],
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            itemCount: selectedMeal.ingredients.length,
          )),
          buildSectionTitle("Steps"),
          buildContainer(ListView.builder(
            itemBuilder: (ctx, index) => ListTile(
              leading: CircleAvatar(
                child: Text('# ${(index + 1)}'),
              ),
              title: Text(selectedMeal.steps[index]),
            ),
            itemCount: selectedMeal.steps.length,
          ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
