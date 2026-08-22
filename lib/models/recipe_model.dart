class Recipe {
  final String title;
  final String image;
  final String duration;
  final String category;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final double rating; // 👈 is this double or int?
  final int servings; // 👈 does this have "= 2" as default?

  Recipe({
    required this.title,
    required this.image,
    required this.duration,
    required this.category,
    this.description = "",
    this.ingredients = const [],
    this.steps = const [],
    this.rating = 4.5, // 👈 must have a default value
    this.servings = 2, // 👈 must have a default value
  });
}
