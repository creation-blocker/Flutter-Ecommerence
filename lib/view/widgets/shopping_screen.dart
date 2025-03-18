import 'package:demo_app/utils/app_textstyle.dart';
import 'package:demo_app/view/widgets/components/category_chips.dart';
import 'package:demo_app/view/widgets/components/filter_bottom_sheet.dart';
import 'package:demo_app/view/widgets/components/product_grid.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Shopping',
          style: AppTextstyle.withColor(
            AppTextstyle.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          //Search Icon
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          //Filter Icon
          IconButton(
            onPressed: () {
              FilterBottomSheet.show(context);
            },
            icon: Icon(
              Icons.filter_list,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 5), child: CategoryChips()),
          Expanded(child: ProductGrid()),
        ],
      ),
    );
  }
}
