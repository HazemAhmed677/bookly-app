import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class FeaturedListViewOfBestSeller extends StatefulWidget {
  const FeaturedListViewOfBestSeller({
    super.key,
  });

  @override
  State<FeaturedListViewOfBestSeller> createState() =>
      _FeaturedListViewOfBestSellerState();
}

class _FeaturedListViewOfBestSellerState
    extends State<FeaturedListViewOfBestSeller> {
  bool isPushing = false;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 10,
      ),
      sliver: SliverList.builder(
        itemCount: 8,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () async {
              if (isPushing) {
                return;
              }
              setState(() {
                isPushing = true;
              });
              await context.push('/bookDetails');
              setState(() {
                isPushing = false;
              });
            },
            child: const BestSellerItem(),
          ),
        ),
      ),
    );
  }
}
