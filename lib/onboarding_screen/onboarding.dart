import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> images = [
    "assets/images/OnBoarding.png", // صفحة 1
    "assets/images/OnBoarding2.png", // صفحة 2
    "assets/images/OnBoarding3.png", // صفحة 3
    "assets/images/OnBoarding4.png",
    "assets/images/OnBoarding5.png",
  ];

  void nextPage() {
    if (currentPage < images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Navigator.push(context, AppRoutes.login);
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        onPageChanged: (index) {
          setState(() => currentPage = index);
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              // الصورة fullscreen
              SizedBox.expand(
                child: Image.asset(images[index], fit: BoxFit.cover),
              ),

              // الأزرار أسفل الشاشة
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Builder(
                    builder: (context) {
                      if (currentPage == 0) {
                        // الصفحة الأولى => Explore
                        return buildPrimaryButton("Explore Now", nextPage);
                      } else if (currentPage == 1) {
                        // الصفحة التانية => Next بس
                        return buildPrimaryButton("Next", nextPage);
                      } else {
                        // من الصورة التالتة => Next/Finish فوق و Back تحت
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildPrimaryButton(
                              currentPage == images.length - 1
                                  ? "Finish"
                                  : "Next",
                              nextPage,
                            ),
                            const SizedBox(height: 12),
                            buildBackButton("Back", previousPage),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // زرار أصفر (Next / Finish / Explore)
  Widget buildPrimaryButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellow,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }

  // زرار Back (أسود ببوردر أصفر)
  Widget buildBackButton(String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.black,
          side: const BorderSide(color: AppColors.yellow, width: 2),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.yellow,
          ),
        ),
      ),
    );
  }
}
