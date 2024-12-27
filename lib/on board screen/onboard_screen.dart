import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/auth/login_screen.dart';
import 'package:pet_hub/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  void navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ), // Replace with your HomeScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              OnboardingPage(
                imagePath: 'assets/icons/on_board_img 1.png',
                title: 'Welcome To Pet Hub',
                description:
                    'The heart of pet care',
              ),
              OnboardingPage(
                imagePath: 'assets/icons/on_board_img 2.png',
                title: 'What We Do For You',
                description:
                    'Pet Hub makes managing your pet's health, records, and care simpler than ever. From finding trusted vets to organizing medical records, we’ve got you covered!',
              ),
              OnboardingPage(
                imagePath: 'assets/icons/on_board_img 3.png',
                title: 'What You Do For You\n(Group Brain)',
                description:
                    'Never miss a vet appointment or medication schedule again. Upload, store, and access your pet's records anytime, anywhere.',
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 10,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: darkGreen,
                  dotColor: aquaGreen,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: TextButton(
              onPressed: navigateToHomeScreen,
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                if (_pageController.page!.toInt() == 2) {
                  // Navigate to the home screen
                  navigateToHomeScreen();
                } else {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                }
              },
              child: Row(
                children: [
                  Text(
                    'Continue ',
                    style: TextStyle(
                      color: white,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 180,
            bottom: 0,
            child: Center(
              child: Image.asset("assets/icons/hand.png"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 200,
              ),
              const SizedBox(height: 70),
              SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                        ).fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
