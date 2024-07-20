import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class OneFromAuthors extends StatelessWidget {
  const OneFromAuthors({
    super.key,
    required this.bookModel,
    required this.index,
  });
  final int index;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.7,
      child: Text(
        bookModel.volumeInfo!.authors?[0] ?? 'jj',
        overflow: TextOverflow.ellipsis,
        style: Styles.textStyle14,
      ),
    );
  }
}
