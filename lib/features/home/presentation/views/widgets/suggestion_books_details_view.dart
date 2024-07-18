import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_list_items.dart';
import 'package:flutter/material.dart';

class SuggestionBooksSection extends StatelessWidget {
  const SuggestionBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            'You can also like',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: kMotserraRegular,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const FeaturedListOfItems(
          flag: true,
        ),
      ],
    );
  }
}
