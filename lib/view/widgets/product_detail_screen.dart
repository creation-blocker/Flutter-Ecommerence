import 'package:demo_app/models/products.dart';
import 'package:demo_app/utils/app_textstyle.dart';
import 'package:demo_app/view/widgets/components/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Details',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _shareProduct(context, product.name, product.description);
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                //Image
                AspectRatio(
                  aspectRatio: 16 / 11,
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                //Favorite Button
                Positioned(
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          product.isFavorite
                              ? Theme.of(context).primaryColor
                              : (isDark ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            //Porduct Details
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: AppTextstyle.withColor(
                            AppTextstyle.h2,
                            Theme.of(context).textTheme.headlineMedium!.color!,
                          ),
                        ),
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppTextstyle.withColor(
                          AppTextstyle.h2,
                          Theme.of(context).textTheme.headlineMedium!.color!,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    product.category,
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyLarge,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Select Size',
                    style: AppTextstyle.withColor(
                      AppTextstyle.labelMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  //Size Selector
                  SizeSelector(),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Description',
                    style: AppTextstyle.withColor(
                      AppTextstyle.labelMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    product.description,
                    style: AppTextstyle.withColor(
                      AppTextstyle.bodyMedium,
                      isDark ? Colors.grey[400]! : Colors.grey[600]!,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    'Add To Cart',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
                    ),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    side: BorderSide(
                      color: isDark ? Colors.white70 : Colors.black12,
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: AppTextstyle.withColor(
                      AppTextstyle.buttonMedium,
                      Theme.of(context).textTheme.bodyLarge!.color!,
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

  //Share Product
  Future<void> _shareProduct(
    BuildContext context,
    String productName,
    String description,
  ) async {
    final box = context.findRenderObject() as RenderBox?;

    const String shopLink = 'https:// yourshop.com/product/cotton-tshirt';
    final String shareMessage = '$description\n\nShop now at $shopLink';

    try {
      final ShareResult result = await Share.share(
        shareMessage,
        subject: productName,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );
      if (result.status == ShareResultStatus.success) {
        debugPrint('Thank you for sharing!');
      }
    } catch (e) {
      debugPrint('Error Sharing: $e');
    }
  }
}
