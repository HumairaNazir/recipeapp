import 'package:flutter/material.dart';
import 'package:recipeapp/utilities/app_routes.dart';
import '../models/recipe_model.dart';

import '../services/favorites_services.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          detailRecipeScreenRoute,
          arguments: recipe,
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200, width: 1),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 8, top: 6, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        recipe.image,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      top: 8,
                      right: 8,
                      child: ListenableBuilder(
                        listenable: FavoritesService.instance,
                        builder: (context, _) {
                          final isFav = FavoritesService.instance.isFavorite(
                            recipe.id,
                          );
                          return GestureDetector(
                            onTap: () {
                              FavoritesService.instance.toggleFavorite(
                                recipe.id,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                size: 20,
                                color: isFav ? Colors.red : Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Text(
                recipe.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.schedule, size: 16, color: Colors.orange),
                  const SizedBox(width: 5),
                  Text(recipe.duration, style: const TextStyle(fontSize: 13)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
