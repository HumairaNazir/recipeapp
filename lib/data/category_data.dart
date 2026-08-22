import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;

  const Category({required this.name, required this.icon, required this.color});
}

// Names here MUST exactly match the `category` field values
// used in recipe_data.dart, or filtering will silently return nothing.
const List<Category> categories = [
  Category(
    name: "Breakfast",
    icon: Icons.free_breakfast_rounded,
    color: Colors.orange,
  ),
  Category(
    name: "Lunch",
    icon: Icons.lunch_dining_rounded,
    color: Colors.green,
  ),
  Category(
    name: "Dinner",
    icon: Icons.dinner_dining_rounded,
    color: Colors.deepPurple,
  ),
  Category(name: "Salad", icon: Icons.eco_rounded, color: Colors.lightGreen),
  Category(name: "Vegetarian", icon: Icons.spa_rounded, color: Colors.teal),
  Category(name: "Soup", icon: Icons.soup_kitchen_rounded, color: Colors.brown),
  Category(name: "Snack", icon: Icons.cookie_rounded, color: Colors.amber),
  Category(
    name: "Beverage",
    icon: Icons.local_cafe_rounded,
    color: Colors.blue,
  ),
  Category(name: "Dessert", icon: Icons.icecream_rounded, color: Colors.pink),
];
