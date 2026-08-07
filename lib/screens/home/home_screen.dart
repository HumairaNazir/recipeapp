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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Recipe> recipes = [
    Recipe(
      title: "Avocado Toast",
      image: "assets/images/login.png",
      duration: "10 min",
      category: "Breakfast",
    ),
    Recipe(
      title: "Pancakes with Maple Syrup",
      image: "assets/images/login.png",
      duration: "20 min",
      category: "Breakfast",
    ),
    Recipe(
      title: "Greek Salad",
      image: "assets/images/login.png",
      duration: "15 min",
      category: "Salad",
    ),
    Recipe(
      title: "Vegetable Stir Fry",
      image: "assets/images/login.png",
      duration: "25 min",
      category: "Lunch",
    ),
    Recipe(
      title: "Grilled Salmon",
      image: "assets/images/login.png",
      duration: "35 min",
      category: "Dinner",
    ),
    Recipe(
      title: "Beef Tacos",
      image: "assets/images/login.png",
      duration: "30 min",
      category: "Dinner",
    ),
    Recipe(
      title: "Mushroom Risotto",
      image: "assets/images/login.png",
      duration: "40 min",
      category: "Dinner",
    ),
    Recipe(
      title: "Chickpea Curry",
      image: "assets/images/login.png",
      duration: "35 min",
      category: "Vegetarian",
    ),
    Recipe(
      title: "Tomato Basil Soup",
      image: "assets/images/login.png",
      duration: "25 min",
      category: "Soup",
    ),
    Recipe(
      title: "Chicken Caesar Wrap",
      image: "assets/images/login.png",
      duration: "15 min",
      category: "Snack",
    ),
    Recipe(
      title: "Banana Smoothie",
      image: "assets/images/login.png",
      duration: "5 min",
      category: "Beverage",
    ),
    Recipe(
      title: "Tiramisu",
      image: "assets/images/login.png",
      duration: "50 min",
      category: "Dessert",
    ),
  ];
  String _selectedCategory = "All";

  final List<String> categories = [
    "All",
    "Breakfast",
    "Lunch",
    "Dinner",
    "Salad",
    "Vegetarian",
    "Soup",
    "Snack",
    "Beverage",
    "Dessert",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardListHeight = size.height * 0.31;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  controller: _searchController,
                  hintText: "Search recipes",
                  prefixIcon: Icons.search,
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Categories",
                  style: sixteen700TextStyle(color: Colors.deepOrange),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = category == _selectedCategory;
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          categoryRecipesScreenRoute,
                          arguments: {'category': category, 'recipes': recipes},
                        );
                      },
                      child: Container(
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
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("Recent Recipes", style: sixteen700TextStyle()),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: cardListHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: recipes.length,
                  itemBuilder: (context, index) =>
                      RecipeCard(recipe: recipes[index]),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Recommended For you",
                  style: sixteen700TextStyle(),
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: recipes.length,
                itemBuilder: (context, index) =>
                    RecommendedListWidget(recipe: recipes[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
