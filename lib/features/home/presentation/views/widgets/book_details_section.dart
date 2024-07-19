import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_action_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_feedback.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.27,
        ),
        // child: const BookItem(),
      ),
      const SizedBox(
        height: 40,
      ),
      const Text(
        'The Jungle Book',
        style: TextStyle(
          fontFamily: kGtSectraFine,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 6,
      ),
      const Opacity(
        opacity: 0.7,
        child: Text(
          'Rudyard Kipling',
          style: Styles.textStyle18,
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      const CustomFeedBack(),
      const SizedBox(
        height: 35,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomActionButton(
              text: '19.99 €',
              background: Colors.white,
              textColor: Colors.black,
            ),
            CustomActionButton(
              text: 'Free preview',
              background: Color(0xffEF8262),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    ]);
  }
}
