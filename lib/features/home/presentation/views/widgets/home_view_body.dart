import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Best Seller',
        style: Styles.textStyle18,
      ),
    );
  }
}
