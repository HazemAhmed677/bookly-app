part of 'fetch_newest_books_cubit_cubit.dart';

abstract class FetchNewestBooksCubitState {}

final class FetchNewestBooksCubitInitial extends FetchNewestBooksCubitState {}

final class FetchNewestBooksCubitLoading extends FetchNewestBooksCubitState {}

final class FetchNewestBooksCubitSuccess extends FetchNewestBooksCubitState {
  final List<BookModel> books;

  FetchNewestBooksCubitSuccess({required this.books});
}

final class FetchNewestBooksCubitFailuire extends FetchNewestBooksCubitState {
  final String errorMsg;

  FetchNewestBooksCubitFailuire({required this.errorMsg});
}
