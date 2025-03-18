import 'package:demo_app/utils/app_textstyle.dart';
import 'package:demo_app/view/widgets/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final TextEditingController _emailController = TextEditingController();
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
                'Reste Password',
                style: AppTextstyle.withColor(
                  AppTextstyle.h1,
                  Theme.of(context).textTheme.bodyLarge!.color!,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your email to reset your password',
                style: AppTextstyle.withColor(
                  AppTextstyle.bodyMedium,
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
              const SizedBox(height: 24),
              //Sign In Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => showSuccessDialog(context),
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
            ],
          ),
        ),
      ),
    );
  }
}

//Show success dialog
void showSuccessDialog(BuildContext context) {
  Get.dialog(
    AlertDialog(
      title: Text('Check Your Email', style: AppTextstyle.h3),
      content: Text(
        'We have sent passowrd recovery instructions to your email.',
        style: AppTextstyle.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            'Ok',
            style: AppTextstyle.withColor(
              AppTextstyle.buttonMedium,
              Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    ),
  );
}
