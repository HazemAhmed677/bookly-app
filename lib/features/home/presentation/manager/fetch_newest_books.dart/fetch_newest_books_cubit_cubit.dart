import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
part 'fetch_newest_books_cubit_state.dart';

class FetchNewestBooksCubitCubit extends Cubit<FetchNewestBooksCubitState> {
  FetchNewestBooksCubitCubit({required this.homeRepoImpl})
      : super(FetchNewestBooksCubitInitial());
  final HomeRepoImpl homeRepoImpl;
  Future<void> fetchNewestBooksCubit() async {
    emit(FetchNewestBooksCubitLoading());
    var result = await homeRepoImpl.newestBooks();
    result.fold(
      (failure) {
        // will show  the error that I hundled in error folder
        emit(FetchNewestBooksCubitFailuire(errorMsg: failure.errorMsg));
      },
      (listOfBooks) {
        emit(FetchNewestBooksCubitSuccess(books: listOfBooks));
      },
    );
  }
}
