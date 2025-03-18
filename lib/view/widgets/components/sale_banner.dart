import 'package:demo_app/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class SaleBanner extends StatelessWidget {
  const SaleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Get Your',
                  style: AppTextstyle.withColor(AppTextstyle.h3, Colors.white),
                ),
                Text(
                  'Special Sale',
                  style: AppTextstyle.withColor(
                    AppTextstyle.withHeight(AppTextstyle.h2, FontWeight.bold),
                    Colors.white,
                  ),
                ),
                Text(
                  'Up to 40%',
                  style: AppTextstyle.withColor(AppTextstyle.h3, Colors.white),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            child: Text('Shop Now', style: AppTextstyle.bodyMedium),
          ),
        ],
      ),
    );
  }
}
