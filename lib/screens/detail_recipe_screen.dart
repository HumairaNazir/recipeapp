import 'package:flutter/material.dart';
import '../../models/recipe_model.dart';
import '../services/favorites_services.dart';

class RecipeDetailScreen extends StatelessWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 280,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
              child: _CircleIconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () => Navigator.pop(context),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ListenableBuilder(
                  listenable: FavoritesService.instance,
                  builder: (context, _) {
                    final isFav = FavoritesService.instance.isFavorite(
                      recipe.id,
                    );
                    return _CircleIconButton(
                      icon: isFav ? Icons.favorite : Icons.favorite_border,
                      iconColor: isFav ? Colors.red : Colors.black87,
                      onTap: () {
                        FavoritesService.instance.toggleFavorite(recipe.id);
                      },
                    );
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(recipe.image, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _InfoChip(icon: Icons.schedule, label: recipe.duration),
                      const SizedBox(width: 10),
                      _InfoChip(
                        icon: Icons.people_outline,
                        label: "${recipe.servings} servings",
                      ),
                      const SizedBox(width: 10),
                      _InfoChip(
                        icon: Icons.star,
                        label: recipe.rating.toString(),
                        iconColor: Colors.amber,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  if (recipe.description.isNotEmpty) ...[
                    const Text(
                      "About",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      recipe.description,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  if (recipe.ingredients.isNotEmpty) ...[
                    const Text(
                      "Ingredients",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...recipe.ingredients.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 6,
                              color: Colors.deepOrange,
                            ),
                            const SizedBox(width: 10),
                            Expanded(child: Text(item)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  if (recipe.steps.isNotEmpty) ...[
                    const Text(
                      "Steps",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ...recipe.steps.asMap().entries.map((entry) {
                      final index = entry.key;
                      final step = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.deepOrange,
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                step,
                                style: const TextStyle(height: 1.4),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const _InfoChip({
    required this.icon,
    required this.label,
    this.iconColor = Colors.deepOrange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    this.iconColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 8),
          ],
        ),
        child: Icon(icon, size: 18, color: iconColor),
      ),
    );
  }
}
