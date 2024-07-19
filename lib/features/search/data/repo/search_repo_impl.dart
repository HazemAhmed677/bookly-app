import 'package:bookly_app/core/errors/faluire_class.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});
  @override
  Future<Either<ServerFaluire, List<BookModel>>> fetchSearchedBooks(
      {required String title}) async {
    List<BookModel> books = [];
    try {
      var responseBody =
          await apiService.get(endpoint: 'Filtering=free-ebooks&q=$title');
      for (var ele in responseBody['items']) {
        books.add(BookModel.fromMap(ele));
      }
      return right(books);
    } on DioException catch (e) {
      return left(
        ServerFaluire.fromDioException(
          dioExecption: e.type,
          response: e.response,
          statusCode: e.response?.statusCode,
        ),
      );
    } catch (e) {
      return left(ServerFaluire(e.toString()));
    }
  }
}
