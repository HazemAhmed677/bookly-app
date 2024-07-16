import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_items.dart';
import 'package:flutter/material.dart';

class FetureadBody extends StatelessWidget {
  const FetureadBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 48,
        ),
        CustomAppBar(),
        SizedBox(
          height: 48,
        ),
        FeaturedListOfItems(),
      ],
    );
  }
}
