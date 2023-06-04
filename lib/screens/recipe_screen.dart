import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/recipe.dart';

class RecipeListWidget extends StatefulWidget {
  @override
  _RecipeListWidgetState createState() => _RecipeListWidgetState();
}

class _RecipeListWidgetState extends State<RecipeListWidget> {
  late Future<List<Recipe>> _recipes;

  @override
  void initState() {
    super.initState();
    _recipes = _loadRecipes();
  }

  Future<List<Recipe>> _loadRecipes() async {
    String jsonString =
        await rootBundle.loadString('assets/sample_data/sample_recipes.json');
    dynamic jsonData = json.decode(jsonString)['recipes'];
    if (jsonData is List) {
      return jsonData.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
      future: _recipes,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Recipe> recipes = snapshot.data!;
          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              Recipe recipe = recipes[index];
              return ListTile(
                leading: Image.asset(recipe.dishImage),
                title: Text(recipe.title),
                subtitle: Text(recipe.duration),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
