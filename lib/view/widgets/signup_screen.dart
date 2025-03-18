import 'package:demo_app/utils/app_textstyle.dart';
import 'package:demo_app/view/widgets/components/custom_textfield.dart';
import 'package:demo_app/view/widgets/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwrodController = TextEditingController();
  final TextEditingController _confirmPasswrodController =
      TextEditingController();

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
              IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Create Account',
                style: AppTextstyle.withColor(
                  AppTextstyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Signup to get started shopping',
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyLarge,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
              const SizedBox(height: 40),
              //Name TextField
              CustomTextfield(
                label: 'Name',
                prefixIcon: Icons.person_2_outlined,
                keyboardType: TextInputType.text,
                controller: _nameController,
              ),
              const SizedBox(height: 15),
              //Email TextField
              CustomTextfield(
                label: 'Email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              const SizedBox(height: 15),
              //Password TextField
              CustomTextfield(
                label: 'Password',
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                controller: _passwrodController,
                isPassword: true,
              ),
              const SizedBox(height: 15),
              //Confirm Password TextField
              CustomTextfield(
                label: 'Confirm Password',
                prefixIcon: Icons.lock_outline,
                keyboardType: TextInputType.visiblePassword,
                controller: _confirmPasswrodController,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              //Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Sign Up',
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
                    "Already have an account?",
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(() => SigninScreen());
                    },
                    child: Text(
                      'Sign In',
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
}
