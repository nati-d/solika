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
    title: 'Welcome to Fun Learning',
    description: 'Hi friends! I\'m Solika—let\'s learn Afaan Oromo together!',
    imagePath: 'assets/images/girl-avatar.png',
  ),
  OnboardingContent(
    title: 'Learn with Me and Mom',
    description: 'Hear words with us, play games, and have fun learning',
    imagePath: 'assets/images/mom-daughter-avatar.png',
  ),
  OnboardingContent(
    title: 'Explore Ethiopian Culture',
    description: 'Unlock more words and connect with Ethiopia!',
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
    final isVerySmallScreen = screenHeight < 500;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isSmallScreen ? 16.0 : 24.0,
        vertical: isSmallScreen ? 16.0 : 24.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              content.imagePath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: isVerySmallScreen ? 16 : isSmallScreen ? 24 : 32),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  content.title,
                  style: AppTheme.heading1.copyWith(
                    color: AppTheme.secondaryColor,
                    fontSize: isVerySmallScreen ? 24 : isSmallScreen ? 32 : 40,
                    fontWeight: FontWeight.w900,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isVerySmallScreen ? 8 : isSmallScreen ? 12 : 16),
                Text(
                  content.description,
                  style: AppTheme.bodyLarge.copyWith(
                    color: AppTheme.textPrimaryColor,
                    fontSize: isVerySmallScreen ? 12 : isSmallScreen ? 14 : 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 