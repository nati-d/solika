import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class OnboardingContent {
  final String title;
  final String description;
  final String imagePath;

  OnboardingContent({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

final List<OnboardingContent> onboardingContents = [
  OnboardingContent(
    title: 'Welcome to Clean Architecture',
    description: 'Learn how to build scalable and maintainable Flutter applications using Clean Architecture principles.',
    imagePath: 'assets/images/girl-avatar.png',
  ),
  OnboardingContent(
    title: 'Separation of Concerns',
    description: 'Keep your code organized with clear separation between domain, data, and presentation layers.',
    imagePath: 'assets/images/mom-daughter-avatar.png',
  ),
  OnboardingContent(
    title: 'Ready to Start',
    description: 'Begin your journey with Clean Architecture and build better Flutter applications.',
    imagePath: 'assets/images/mom-avatar.png',
  ),
];

class OnboardingContentWidget extends StatelessWidget {
  final OnboardingContent content;

  const OnboardingContentWidget({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenHeight < 600;

    return Padding(
      padding: EdgeInsets.all(isSmallScreen ? 24.0 : 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            content.imagePath,
            height: isSmallScreen ? screenHeight * 0.3 : 300,
            fit: BoxFit.contain,
          ),
          SizedBox(height: isSmallScreen ? 24 : 32),
          Text(
            content.title,
            style: AppTheme.heading2.copyWith(
              color: AppTheme.primaryColor,
              fontSize: isSmallScreen ? 20 : 24,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isSmallScreen ? 12 : 16),
          Text(
            content.description,
            style: AppTheme.bodyLarge.copyWith(
              color: AppTheme.textPrimaryColor,
              fontSize: isSmallScreen ? 14 : 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 