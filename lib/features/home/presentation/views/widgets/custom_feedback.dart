import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomFeedBack extends StatelessWidget {
  const CustomFeedBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '⭐ 4.8 ',
          style: Styles.textStyle16,
        ),
        Opacity(
          opacity: 0.55,
          child: Text(
            '(2390)',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
