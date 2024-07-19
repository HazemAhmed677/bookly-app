import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomFeedBack extends StatelessWidget {
  const CustomFeedBack({super.key, this.rate, this.numOfRated});
  final int? rate;
  final int? numOfRated;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '⭐ ${rate?.toString() ?? '0 '}',
          style: Styles.textStyle16,
        ),
        Opacity(
          opacity: 0.55,
          child: Text(
            '(${numOfRated ?? 0})',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
