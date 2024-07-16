import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_items.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_view_of_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FetureadBody extends StatelessWidget {
  const FetureadBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 48,
        ),
        CustomAppBar(),
        SizedBox(
          height: 48,
        ),
        FeaturedListOfItems(),
        SizedBox(
          height: 51,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'Best Seller',
            style: Styles.textStyle18,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FeaturedListViewOfBestSeller()
      ],
    );
  }
}
