class OnboardingData {
  final String title;
  final String imagePath;

  OnboardingData({required this.title, required this.imagePath});
}

List<OnboardingData> onboardingDataList = [
  OnboardingData(
    title: 'Get Food Delivered to Your Doorstep',
    imagePath: 'assets/images/onboarding/onboarding1.png',
  ),
  OnboardingData(
    title: 'Discover New Food Brands with our App',
    imagePath: 'assets/images/onboarding/onboarding2.png',
  ),
  OnboardingData(
    title: 'Experience Convenient and Fast Food Delivery with Our App',
    imagePath: 'assets/images/onboarding/onboarding3.png',
  ),
];
