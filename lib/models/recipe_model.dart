class Recipe {
  final String id;
  final String title;
  final String image;
  final String duration;
  final String category;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final double rating;
  final int servings;

  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.duration,
    required this.category,
    this.description = "",
    this.ingredients = const [],
    this.steps = const [],
    this.rating = 4.5,
    this.servings = 2,
  });
}
