import 'package:flutter/material.dart';
import 'package:recipeapp/screens/home/home-app_bar.dart';
import 'package:recipeapp/widgets/text_field_widget.dart';

import '../../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      body: Column(
        children: [
          HomeAppBar(),
          SizedBox(height: 20),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              controller: _searchController,
              hintText: 'Search For recipes',
              prefixIcon: Icons.search,
            ),
          ),
          // Recent Recipes
          // Categories
        ],
      ),
    );
    //   Scaffold(
    //   appBar: AppBar(title: const Text('Home')),
    //   drawer: const AppDrawer(),
    //   body: const Center(child: Text('Welcome to the home screen')),
    // );
  }
}
