import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding_content.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/app_theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', true);
    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRouter.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 600;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _completeOnboarding,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Text(
                    'Skip',
                    style: AppTheme.bodyLarge.copyWith(
                      color: AppTheme.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: onboardingContents.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: screenHeight - 200, // Account for top and bottom sections
                    ),
                    child: OnboardingContentWidget(
                      content: onboardingContents[index],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: isSmallScreen ? 16.0 : 24.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingContents.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        height: 8,
                        width: _currentPage == index ? 24 : 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _currentPage == index
                              ? AppTheme.secondaryColor
                              : AppTheme.secondaryColor.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 16 : 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _currentPage == onboardingContents.length - 1
                          ? _completeOnboarding
                          : () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                      style: AppTheme.primaryButtonStyle.copyWith(
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(
                            vertical: isSmallScreen ? 16 : 20,
                          ),
                        ),
                      ),
                      child: Text(
                        _currentPage == onboardingContents.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style: AppTheme.heading2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: isSmallScreen ? 20 : 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 