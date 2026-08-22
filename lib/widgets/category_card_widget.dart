import 'package:flutter/material.dart';
import 'package:recipeapp/utilities/app_routes.dart';

import '../data/category_data.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.pushNamed(
          context,
          categoryRecipeScreenRoute,
          arguments: category.name,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: category.color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: category.color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(category.icon, size: 32, color: category.color),
            ),
            const SizedBox(height: 12),
            Text(
              category.name,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
