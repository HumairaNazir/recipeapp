import 'package:flutter/material.dart';

import '../../core/theme/app_text_styles.dart';
import '../../models/recipe_model.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/recipe_card_widget.dart';
import '../../widgets/recommended_list_widget.dart';
import '../../widgets/text_field_widget.dart';
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
      title: "Chicken Biryani",
      image: "assets/images/login.png",
      duration: "45 min",
      category: "Dinner",
    ),
    Recipe(
      title: "Cheese Pizza",
      image: "assets/images/login.png",
      duration: "30 min",
      category: "Lunch",
    ),
    Recipe(
      title: "Chocolate Cake",
      image: "assets/images/login.png",
      duration: "60 min",
      category: "Dessert",
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cardListHeight = size.height * 0.30;

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
                  "Recent Recipes",
                  style: sixteen700TextStyle(color: Colors.deepOrange),
                ),
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Recommended For you",
                  style: sixteen700TextStyle(color: Colors.deepOrange),
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
