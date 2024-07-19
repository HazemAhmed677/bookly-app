import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_similar_books_state.dart';

class FetchSimilarBooksCubit extends Cubit<FetchSimilarBooksState> {
  FetchSimilarBooksCubit() : super(FetchSimilarBooksInitial());
}
