import 'package:flutter/material.dart';

import '../../data/recipe_data.dart';
import '../../services/favorites_services.dart';
import '../../widgets/recipe_card_widget.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text('Favorites'),
        elevation: 0,
        backgroundColor: const Color(0xFFFAFAFA),
      ),
      body: ListenableBuilder(
        listenable: FavoritesService.instance,
        builder: (context, _) {
          final favoriteRecipes = allRecipes
              .where(
                (recipe) => FavoritesService.instance.isFavorite(recipe.id),
              )
              .toList();

          if (favoriteRecipes.isEmpty) {
            return const _EmptyFavorites();
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: favoriteRecipes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return RecipeCard(recipe: favoriteRecipes[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite_border, size: 72, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            Text(
              "No favorites yet",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Tap the heart on any recipe to save it here.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
          ],
        ),
      ),
    );
  }
}
