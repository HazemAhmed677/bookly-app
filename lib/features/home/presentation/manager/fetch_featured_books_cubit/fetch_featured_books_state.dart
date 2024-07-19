part of 'fetch_featured_books_cubit.dart';

abstract class FetchFeaturedBooksState {}

final class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}

final class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}

final class FetchFeaturedBooksSuccess extends FetchFeaturedBooksState {
  final List<BookModel> books;

  FetchFeaturedBooksSuccess({required this.books});
}

final class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  final String errorMsg;

  FetchFeaturedBooksFailure({required this.errorMsg});
}
