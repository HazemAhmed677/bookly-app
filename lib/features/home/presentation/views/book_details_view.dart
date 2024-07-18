import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_feedback.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBarOfBookDetails(),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.27,
              ),
              child: const BookItem(),
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
          ],
        ),
      ),
    );
  }
}

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.background,
    required this.textColor,
    required this.text,
  });
  final String text;
  final Color background;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    bool flag = (background == Colors.white);
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: (flag) ? const Radius.circular(10) : Radius.zero,
              bottomLeft: (flag) ? const Radius.circular(10) : Radius.zero,
              topRight: (!flag) ? const Radius.circular(10) : Radius.zero,
              bottomRight: (!flag) ? const Radius.circular(10) : Radius.zero,
            ),
          ),
        ),
        onPressed: () {},
        child: (flag)
            ? Text(
                text,
                style: Styles.textStyleForPrice.copyWith(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  text,
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: kGiloryMedium,
                    color: textColor,
                  ),
                ),
              ),
      ),
    );
  }
}
