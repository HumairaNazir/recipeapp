import 'package:flutter/material.dart';
import 'package:recipeapp/models/onboarding_items.dart';
import 'package:recipeapp/widgets/onboard_item_widget.dart';

import '../../services/preferences_services.dart';
import '../home_screen.dart';

class OnboadingScreen extends StatefulWidget {
  const OnboadingScreen({super.key});

  @override
  State<OnboadingScreen> createState() => _OnboardingScreenState();
}

final List<Color> pageColors = [
  // const Color(0xFFFFB74D), // Deep Orange
  // const Color(0xFF81C784), // Fresh Green
  // const Color(0xFFFFD54F), // Golden Yellow
  // const Color(0xFFFFA726), // Orange
  // const Color(0xFF66BB6A), // Green
  // const Color(0xFFFFCA28), // Amber
  const Color(0xFFFFA726), // Appetizing Orange
  const Color(0xFF66BB6A), // Fresh Green
  const Color(0xFFFFD54F), // Warm Yellow
];
final List<OnboardingItems> _pages = [
  const OnboardingItems(
    title: 'Explore Millions of Recipes',
    subTitle:
        'Discover a huge collection of delicious recipes from around the world. Find next favorite meal.',
    images: 'assets/images/onboarding1.png',
  ),
  OnboardingItems(
    title: 'Step_by_Step Guidance',
    subTitle:
        'Easy to follow ins instructions and helpful tips make cooking simple and enjoyable for everyone.',
    images: 'assets/images/onboarding2.png',
  ),
  OnboardingItems(
    title: 'Save & preservation',
    subTitle:
        'Save your favorite recipes ,create collections and get personalized recommendations just for you.',
    images: 'assets/images/onboarding3.png',
  ),
];

class _OnboardingScreenState extends State<OnboadingScreen>
    with SingleTickerProviderStateMixin {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;
  @override
  void initState() {
    super.initState();

    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _buttonAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  Future<void> _next() async {
    if (_currentPage < _pages.length - 1) {
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      await PreferencesServices.instance.setBool('isOnboardingCompleted', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 300),

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [pageColors[_currentPage], Colors.white],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            spacing: 30,
            children: [
              Flexible(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (value) => setState(() {
                    _currentPage = value;
                  }),
                  itemBuilder: (context, index) {
                    return OnboardItemWidget(
                      item: _pages[index],
                      isActive: _currentPage == index,
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: List.generate(
                  _pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 8,
                    width: _currentPage == index ? 18 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              ScaleTransition(
                scale: _buttonAnimation,
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _next,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    child: Text(
                      _currentPage == _pages.length - 1
                          ? 'Get Started'
                          : 'Next',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class OnboardingScreenOne extends StatelessWidget {
//   const OnboardingScreenOne({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           child: Column(
//             children: [
//               const SizedBox(height: 30),
//
//               /// Welcome
//               const Text(
//                 "Welcome 👋",
//                 style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
//               ),
//
//               const SizedBox(height: 40),
//
//               /// Image
//               Expanded(
//                 child: Image.asset(
//                   "assets/images/onboarding1.png",
//                   fit: BoxFit.contain,
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//
//               /// Description
//               const Text(
//                 "Discover thousands of delicious recipes with smart search, step-by-step cooking, and everything you need in one place.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 17, color: Colors.grey, height: 1.5),
//               ),
//
//               const Spacer(),
//
//               /// Bottom Row
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   /// Skip
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       "Skip",
//                       style: TextStyle(fontSize: 16, color: Colors.orange),
//                     ),
//                   ),
//
//                   /// Pagination
//                   Row(
//                     children: [
//                       buildDot(true),
//                       buildDot(false),
//                       buildDot(false),
//                     ],
//                   ),
//
//                   /// Next Button
//                   CircleAvatar(
//                     radius: 25,
//                     backgroundColor: Colors.orange,
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.arrow_forward_ios,
//                         color: Colors.white,
//                         size: 20,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildDot(bool active) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 4),
//       width: active ? 22 : 10,
//       height: 10,
//       decoration: BoxDecoration(
//         color: active ? Colors.orange : const Color(0xffD9A441), // Mustard
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );
//   }
// }
