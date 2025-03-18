import 'package:demo_app/view/widgets/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<OnboardingItem> _items = [
    OnboardingItem(
      image: 'assets/images/ob1.jpg',
      title: 'Discover Latest Trends',
      description:
          'Explore the newest fashion trends and find your unique style',
    ),
    OnboardingItem(
      image: 'assets/images/ob2.jpg',
      title: 'Quality Products',
      description: 'Shop premium products from top brands worldwide',
    ),
    OnboardingItem(
      image: 'assets/images/ob3.jpg',
      title: 'Easy Shopping',
      description: 'Simple and secure shopping experience at your fingertips',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40), // Adjust this for top margin
          Container(
            width: double.infinity,
            alignment: Alignment.topRight,
            child: DotsIndicator(
              dotsCount: _items.length,
              position: _currentPage.toDouble(),
              decorator: DotsDecorator(activeColor: Colors.green),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _items.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(_items[index].image, width: 350, height: 250),
                    SizedBox(height: 20),
                    Text(
                      _items[index].title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        _items[index].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.off(() => SigninScreen());
                  },
                  child: Text(_currentPage == _items.length - 1 ? "" : "Skip"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (_currentPage == _items.length - 1) {
                      Get.off(() => SigninScreen());
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    _currentPage == _items.length - 1 ? "Get Started" : "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
