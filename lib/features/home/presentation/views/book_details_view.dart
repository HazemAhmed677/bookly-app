import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar_book_details.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/suggestion_books_details_view.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                const CustomAppBarOfBookDetails(),
                const SizedBox(
                  height: 32,
                ),
                BookDetailsSection(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const SuggestionBooksSection(),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
