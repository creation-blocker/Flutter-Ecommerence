import 'package:demo_app/utils/app_textstyle.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet {
  static void show(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    String selectedCategory = 'All';
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder:
          (context) => StatefulBuilder(
            builder:
                (context, setState) => Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Filter Products',
                            style: AppTextstyle.withColor(
                              AppTextstyle.h3,
                              Theme.of(context).textTheme.bodyLarge!.color!,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Price Range',
                        style: AppTextstyle.withColor(
                          AppTextstyle.bodyLarge,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Min',
                                prefixText: '\$',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color:
                                        isDark
                                            ? Colors.grey[700]!
                                            : Colors.grey[300]!,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Max',
                                prefixText: '\$',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color:
                                        isDark
                                            ? Colors.grey[700]!
                                            : Colors.grey[300]!,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Text(
                        'Price Range',
                        style: AppTextstyle.withColor(
                          AppTextstyle.bodyLarge,
                          Theme.of(context).textTheme.bodyLarge!.color!,
                        ),
                      ),
                      SizedBox(height: 5),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children:
                            [
                                  'All',
                                  'Shoes',
                                  'Clothings',
                                  'Accessories',
                                  'Electronics',
                                ]
                                .map(
                                  (category) => FilterChip(
                                    label: Text(category),
                                    selected: category == selectedCategory,
                                    onSelected: (selected) {
                                      setState(() {
                                        selectedCategory = category;
                                      });
                                    },
                                    backgroundColor:
                                        Theme.of(context).cardColor,
                                    selectedColor: Theme.of(
                                      context,
                                    ).primaryColor.withOpacity(0.2),
                                    labelStyle: AppTextstyle.withColor(
                                      AppTextstyle.bodyMedium,
                                      category == 'All'
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(
                                            context,
                                          ).textTheme.bodyLarge!.color!,
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Apply Filters',
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
