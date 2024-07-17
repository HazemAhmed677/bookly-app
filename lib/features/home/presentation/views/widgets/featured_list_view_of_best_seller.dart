import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class FeaturedListViewOfBestSeller extends StatelessWidget {
  const FeaturedListViewOfBestSeller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 10,
        ),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 4,
          itemBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: BestSellerItem(),
          ),
        ),
      ),
    );
  }
}
