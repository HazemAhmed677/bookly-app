import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/suggested_list_view.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionBooksSection extends StatefulWidget {
  const SuggestionBooksSection({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  State<SuggestionBooksSection> createState() => _SuggestionBooksSectionState();
}

class _SuggestionBooksSectionState extends State<SuggestionBooksSection> {
  @override
  void initState() {
    BlocProvider.of<FetchSimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.bookModel.volumeInfo!.categories?[0] ?? '');
    super.initState();
  }

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
        const SuggestedListView(),
      ],
    );
  }
}
