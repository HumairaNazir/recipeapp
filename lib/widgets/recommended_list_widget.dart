import 'package:flutter/material.dart';
import 'package:recipeapp/utilities/app_routes.dart';

import '../core/theme/app_text_styles.dart';
import '../models/recipe_model.dart';

class RecommendedListWidget extends StatelessWidget {
  const RecommendedListWidget({super.key, required this.recipe});

  final Recipe recipe;

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
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                recipe.image,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: sixteen700TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${recipe.category} · ${recipe.duration}",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: Colors.grey.shade400),
          ],
        ),
      ),
    );
  }
}
