import 'package:demo_app/controllers/auth_controller.dart';
import 'package:demo_app/utils/app_textstyle.dart';
import 'package:demo_app/view/widgets/components/custom_textfield.dart';
import 'package:demo_app/view/widgets/forgot_password.dart';
import 'package:demo_app/view/widgets/main_screen.dart';
import 'package:demo_app/view/widgets/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwrodController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 40),
              // Center(
              //   child: Icon(
              //     Icons.shopping_bag,
              //     size: 80,
              //     color: Theme.of(context).primaryColor,
              //   ),
              // ),
              const SizedBox(height: 40),
              Text(
                'Welcome Back!',
                style: AppTextstyle.withColor(
                  AppTextstyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Sign in to continue shopping',
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 40),
              //Email TextField
              CustomTextfield(
                label: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              const SizedBox(height: 8),
              //Password TextField
              CustomTextfield(
                label: 'Password',
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                controller: _passwrodController,
                isPassword: true,
              ),
              //Forgot Password TextButton
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(() => ForgotPassword());
                  },
                  child: Text(
                    'Forgot Password?',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              //Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              //New User? && Sign Up Text Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => SignupScreen());
                    },
                    child: Text(
                      'Sign Up',
                      style: AppTextstyle.withColor(
                        AppTextstyle.buttonMedium,
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Sign In Button Handle
  void _handleSignIn() {
    final AuthController authController = Get.find<AuthController>();
    authController.login();
    Get.to(() => MainScreen());
  }
}
