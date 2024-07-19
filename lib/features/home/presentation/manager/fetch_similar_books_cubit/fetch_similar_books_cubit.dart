// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
part 'fetch_similar_books_state.dart';

class FetchSimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  FetchSimilarBooksCubit({required this.homeRepoImpl})
      : super(FetchSimilarBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(FetchSimilarBooksLoading());
    var result = await homeRepoImpl.fetchSimilarBooks(category: category);
    result.fold(
      (failure) {
        // will show  the error that I hundled in error folder
        emit(FetchSimilarBooksFailuire(errorMsg: failure.errorMsg));
      },
      (listOfBooks) {
        emit(FetchSimilarBooksSuccess(books: listOfBooks));
      },
    );
  }
}
