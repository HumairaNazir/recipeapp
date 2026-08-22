import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Simple app-wide singleton that tracks favorited recipe ids and
/// persists them to device storage so they survive app restarts.

class FavoritesService extends ChangeNotifier {
  FavoritesService._internal();
  static final FavoritesService instance = FavoritesService._internal();

  static const _storageKey = 'favorite_recipe_ids';

  final Set<String> _favoriteIds = {};

  /// Read-only view of currently favorited recipe ids.
  Set<String> get favoriteIds => _favoriteIds;

  /// Call once at app startup (in main.dart), after ensureInitialized(),
  /// to load previously saved favorites from device storage.
  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_storageKey) ?? [];
    _favoriteIds
      ..clear()
      ..addAll(saved);
    notifyListeners();
  }

  bool isFavorite(String recipeId) => _favoriteIds.contains(recipeId);

  Future<void> toggleFavorite(String recipeId) async {
    if (_favoriteIds.contains(recipeId)) {
      _favoriteIds.remove(recipeId);
    } else {
      _favoriteIds.add(recipeId);
    }
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_storageKey, _favoriteIds.toList());
  }
}
