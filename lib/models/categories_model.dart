import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;

  Category({required this.name, required this.icon, required this.color});
}

final List<Category> categories = [
  Category(name: "Breakfast", icon: Icons.free_breakfast, color: Colors.orange),
  Category(name: "Lunch", icon: Icons.lunch_dining, color: Colors.green),
  Category(name: "Dinner", icon: Icons.dinner_dining, color: Colors.deepPurple),
  Category(name: "Desserts", icon: Icons.cake, color: Colors.pink),
  Category(name: "Drinks", icon: Icons.local_bar, color: Colors.blue),
  Category(name: "Snacks", icon: Icons.fastfood, color: Colors.amber),
  Category(name: "Vegan", icon: Icons.eco, color: Colors.teal),
  Category(name: "Soups", icon: Icons.soup_kitchen, color: Colors.brown),
];
