import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit({required this.homeRepoImpl})
      : super(FetchFeaturedBooksInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchFeaturedBooks() async {
    emit(FetchFeaturedBooksLoading());
    var result = await homeRepoImpl.fetchFeaturedBooks();
    result.fold(
      (failure) {
        // will show  the error that I hundled in error folder
        emit(FetchFeaturedBooksFailure(errorMsg: failure.errorMsg));
      },
      (listOfBooks) {
        emit(FetchFeaturedBooksSuccess(books: listOfBooks));
      },
    );
  }
}
