import 'package:flutter/material.dart';

class OnboardingContent {
  final String title;
  final String description;
  final IconData icon;

  const OnboardingContent({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<OnboardingContent> onboardingContents = [
  const OnboardingContent(
    title: 'Welcome to Clean Architecture',
    description: 'Learn how to build scalable and maintainable Flutter applications using Clean Architecture principles.',
    icon: Icons.architecture,
  ),
  const OnboardingContent(
    title: 'Separation of Concerns',
    description: 'Keep your code organized with clear separation between domain, data, and presentation layers.',
    icon: Icons.layers,
  ),
  const OnboardingContent(
    title: 'Ready to Start',
    description: 'Begin your journey with Clean Architecture and build better Flutter applications.',
    icon: Icons.rocket_launch,
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
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            content.icon,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 32),
          Text(
            content.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            content.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 