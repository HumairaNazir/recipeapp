import 'package:flutter/material.dart';
import 'package:recipeapp/core/theme/app_text_styles.dart';

import '../models/onboarding_items.dart';

class OnboardItemWidget extends StatelessWidget {
  const OnboardItemWidget({
    super.key,
    required this.item,
    required this.isActive,
  });
  final OnboardingItems item;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        AnimatedScale(
          scale: isActive ? 1.0 : 0.85,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: isActive ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(item.images, fit: BoxFit.contain),
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: Text(
            item.title,
            key: ValueKey(item.title),
            textAlign: TextAlign.center,
            style: twentyEight700TextStyle(),
          ),
        ),
        SizedBox(height: 10),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 700),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.4),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: Text(
            item.subTitle,
            key: ValueKey(item.subTitle),
            textAlign: TextAlign.center,
            style: fourteen600TextStyle(color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
