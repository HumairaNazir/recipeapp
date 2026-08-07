import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';
import '../../widgets/recipe_card_widget.dart';

class CategoryRecipesScreen extends StatelessWidget {
  final String category;
  final List<Recipe> recipes;

  const CategoryRecipesScreen({
    super.key,
    required this.category,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = recipes.where((r) => r.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: filtered.isEmpty
          ? const Center(child: Text("No recipes found"))
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filtered.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) =>
                  RecipeCard(recipe: filtered[index]),
            ),
    );
  }
}
