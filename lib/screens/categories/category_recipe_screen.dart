import 'package:flutter/material.dart';

import '../../models/categories_model.dart';
import '../../models/recipe_model.dart';
import '../../widgets/recipe_card_widget.dart';
import '../../data/recipe_data.dart'; // 👈 import your actual data file

class CategoryRecipesScreen extends StatelessWidget {
  const CategoryRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)!.settings.arguments as String;

    final filteredRecipes = allRecipes
        .where((recipe) => recipe.category == categoryName)
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(title: Text(categoryName)),
      body: filteredRecipes.isEmpty
          ? const Center(child: Text("No recipes found in this category"))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: filteredRecipes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final recipe = filteredRecipes[index];
                  return RecipeCard(recipe: recipe);
                },
              ),
            ),
    );
  }
}
