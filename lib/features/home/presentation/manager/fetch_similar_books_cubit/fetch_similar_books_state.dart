part of 'fetch_similar_books_cubit.dart';

abstract class FetchSimilarBooksState {}

final class FetchSimilarBooksInitial extends FetchSimilarBooksState {}

final class FetchSimilarBooksLoading extends FetchSimilarBooksState {}

final class FetchSimilarBooksSuccess extends FetchSimilarBooksState {
  final List<BookModel> books;

  FetchSimilarBooksSuccess({required this.books});
}

final class FetchSimilarBooksFailuire extends FetchSimilarBooksState {
  final String errorMsg;

  FetchSimilarBooksFailuire({required this.errorMsg});
}
