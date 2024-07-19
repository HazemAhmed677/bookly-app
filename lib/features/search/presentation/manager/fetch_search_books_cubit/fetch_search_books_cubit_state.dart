part of 'fetch_search_books_cubit_cubit.dart';

abstract class FetchSearchBooksCubitState {}

final class FetchSearchBooksCubitInitial extends FetchSearchBooksCubitState {}

final class FetchSearchBooksCubitLoading extends FetchSearchBooksCubitState {}

final class FetchSearchBooksCubitSuccess extends FetchSearchBooksCubitState {
  final List<BookModel> books;

  FetchSearchBooksCubitSuccess({
    required this.books,
  });
}

final class FetchSearchBooksCubitFailuire extends FetchSearchBooksCubitState {
  final String errorMsg;

  FetchSearchBooksCubitFailuire({
    required this.errorMsg,
  });
}
