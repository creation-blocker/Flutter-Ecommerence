import 'package:demo_app/controllers/auth_controller.dart';
import 'package:demo_app/view/widgets/main_screen.dart';
import 'package:demo_app/view/widgets/onboarding_screen.dart';
import 'package:demo_app/view/widgets/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    //Navigate based on auth state after 2.5 seconds
    Future.delayed(const Duration(microseconds: 2500), () {
      if (authController.isFirstTime) {
        Get.off(() => const OnboardingScreen());
      } else if (authController.isLoggedIn) {
        Get.off(() => const MainScreen());
      } else {
        Get.off(() => SigninScreen());
      }
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.8),
              Theme.of(context).primaryColor.withOpacity(0.6),
            ],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.shopping_bag_outlined, size: 48),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'FASHION',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      // fontWeight: FontWeight.w300,
                      letterSpacing: 4,
                    ),
                  ),
                  Text(
                    'STORE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 48,
              left: 0,
              right: 0,
              child: Text(
                'Style Meets Simplicity',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
