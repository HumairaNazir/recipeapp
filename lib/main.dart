import 'package:flutter/material.dart';
import 'package:recipeapp/screens/auth/login_screen.dart';
import 'package:recipeapp/screens/auth/signup_screen.dart';
import 'package:recipeapp/screens/auth/splash_screen.dart';
import 'package:recipeapp/screens/categories/categories_screen.dart';
import 'package:recipeapp/screens/categories/category_recipe_screen.dart';

import 'package:recipeapp/screens/main/main_screen.dart';
import 'package:recipeapp/screens/onboarding/onboarding_screen.dart';

import 'package:recipeapp/services/preferences_services.dart';
import 'package:recipeapp/utilities/app_routes.dart';

import 'models/recipe_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesServices.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splashScreenRoute,
      routes: {
        splashScreenRoute: (context) => const SplashScreen(),
        onboardingScreenRoute: (context) => const OnboardingScreen(),
        loginScreenRoute: (context) => LoginScreen(),
        signupScreenRoute: (context) => const SignupScreen(),
        homeScreenRoute: (context) => const MainScreen(),
        categoriesScreenRoute: (context) => CategoriesScreen(),
      },
    );
  }
}
