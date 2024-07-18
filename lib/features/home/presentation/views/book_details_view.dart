import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/suggestion_books_details_view.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 32,
            ),
            const CustomAppBarOfBookDetails(),
            const SizedBox(
              height: 32,
            ),
            const BookDetailsSection(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const SuggestionBooksSection()
          ],
        ),
      ),
    );
  }
}
