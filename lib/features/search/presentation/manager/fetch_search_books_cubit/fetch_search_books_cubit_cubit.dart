// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_impl.dart';
part 'fetch_search_books_cubit_state.dart';

class FetchSearchBooksCubitCubit extends Cubit<FetchSearchBooksCubitState> {
  FetchSearchBooksCubitCubit({required this.searchRepoImpl})
      : super(FetchSearchBooksCubitInitial());
  final SearchRepoImpl searchRepoImpl;
  Future<void> fetchSearchedBooks({required String title}) async {
    emit(FetchSearchBooksCubitLoading());
    var result = await searchRepoImpl.fetchSearchedBooks(title: title);
    result.fold(
      (failure) {
        // will show  the error that I hundled in error folder
        emit(FetchSearchBooksCubitFailuire(
          errorMsg: failure.errorMsg,
        ));
      },
      (listOfBooks) {
        emit(FetchSearchBooksCubitSuccess(books: listOfBooks));
      },
    );
  }
}
