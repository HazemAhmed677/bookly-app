import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_action_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_feedback.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.27,
        ),
        child: BookItem(
          imageURL: bookModel.volumeInfo!.imageLinks!.thumbnail ?? '',
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      Text(
        bookModel.volumeInfo!.title!,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: kGtSectraFine,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(
        height: 6,
      ),
      Opacity(
        opacity: 0.7,
        child: Text(
          bookModel.volumeInfo!.authors![0],
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
              text: 'Free',
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
