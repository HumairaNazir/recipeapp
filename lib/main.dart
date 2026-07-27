import 'package:flutter/material.dart';
import 'package:recipeapp/screens/home_screen.dart';
import 'package:recipeapp/screens/onboarding/onboading_screen.dart';
import 'package:recipeapp/services/preferences_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PreferencesServices.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool?>(
      future: PreferencesServices.instance.getBool('isOnboardingCompleted'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        final isCompleted = snapshot.data ?? false;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: isCompleted ? const HomeScreen() : const OnboadingScreen(),
        );
      },
    );
  }
}
