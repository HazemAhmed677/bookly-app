import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_search_books_cubit_state.dart';

class FetchSearchBooksCubitCubit extends Cubit<FetchSearchBooksCubitState> {
  FetchSearchBooksCubitCubit() : super(FetchSearchBooksCubitInitial());
}
