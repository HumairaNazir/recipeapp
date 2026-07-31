import 'package:flutter/material.dart';
import 'package:recipeapp/screens/auth/signup_screen.dart';

import '../../core/theme/app_colors.dart';
import '../../services/preferences_services.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _decideNextScreen();
  }

  Future<void> _decideNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 800));

    final isCompleted =
        await PreferencesServices.instance.getBool('isOnboardingCompleted') ??
        false;

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            isCompleted ? const SignupScreen() : const OnboardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: Image.asset('assets/images/login.png', height: 120)),
    );
  }
}
