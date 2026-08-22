import 'package:flutter/material.dart';

import '../../core/theme/app_text_styles.dart';
import '../../models/recipe_model.dart';
import '../../utilities/app_routes.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/recipe_card_widget.dart';
import '../../widgets/recommended_list_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../categories/category_recipe_screen.dart';
import 'home-app_bar.dart';
import '../../data/recipe_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _selectedCategory = "All";

  // Icons that pair each category with a bit of visual warmth.
  final Map<String, IconData> categoryIcons = const {
    "All": Icons.grid_view_rounded,
    "Breakfast": Icons.free_breakfast_rounded,
    "Lunch": Icons.lunch_dining_rounded,
    "Dinner": Icons.dinner_dining_rounded,
    "Salad": Icons.eco_rounded,
    "Vegetarian": Icons.spa_rounded,
    "Soup": Icons.soup_kitchen_rounded,
    "Snack": Icons.cookie_rounded,
    "Beverage": Icons.local_cafe_rounded,
    "Dessert": Icons.icecream_rounded,
  };

  // Full category list (used by the icon lookup and the bottom-nav
  // categories screen). On the home screen we only preview a handful.
  List<String> get categories => categoryIcons.keys.toList();

  // Short preview shown inline — tweak this number to taste.
  static const int _categoryPreviewCount = 6;

  List<String> get _previewCategories =>
      categories.take(_categoryPreviewCount).toList();

  List<Recipe> get _filteredRecipes {
    if (_selectedCategory == "All") return allRecipes;
    return allRecipes.where((r) => r.category == _selectedCategory).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardListHeight = size.height * 0.31;
    final featured = allRecipes.isNotEmpty ? allRecipes.first : null;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              const SizedBox(height: 18),

              // Search bar with a soft shadow so it feels like a tappable surface.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CustomTextField(
                    controller: _searchController,
                    hintText: "Search recipes, ingredients...",
                    prefixIcon: Icons.search,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Featured hero card — gives the eye a clear place to land first.
              if (featured != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to recipe detail if you have that route.
                    },
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image: AssetImage(featured.image),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepOrange.withOpacity(0.25),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.65),
                            ],
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  "Recipe of the Day",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                featured.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.timer_outlined,
                                    color: Colors.white70,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    featured.duration,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 24),

              _SectionHeader(
                title: "Categories",
                onSeeAll: () {
                  Navigator.pushNamed(context, categoriesScreenRoute);
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 44,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _previewCategories.length,
                  itemBuilder: (context, index) {
                    final category = _previewCategories[index];
                    final isSelected = category == _selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        setState(() => _selectedCategory = category);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeOut,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.deepOrange
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.deepOrange.withOpacity(0.35),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : [],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              categoryIcons[category] ??
                                  Icons.restaurant_rounded,
                              size: 16,
                              color: isSelected ? Colors.white : Colors.black54,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              category,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                                fontSize: 13,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 26),

              _SectionHeader(
                title: "Recent Recipes",
                onSeeAll: () {
                  Navigator.pushNamed(context, categoriesScreenRoute);
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: cardListHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _filteredRecipes.length,
                  itemBuilder: (context, index) =>
                      RecipeCard(recipe: _filteredRecipes[index]),
                ),
              ),
              const SizedBox(height: 26),

              _SectionHeader(title: "Recommended For You"),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: _filteredRecipes.length,
                itemBuilder: (context, index) =>
                    RecommendedListWidget(recipe: _filteredRecipes[index]),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

/// Consistent section header with an optional "See all" action,

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;

  const _SectionHeader({required this.title, this.onSeeAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: sixteen700TextStyle()),
          if (onSeeAll != null)
            GestureDetector(
              onTap: onSeeAll,
              child: const Text(
                "See all",
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
