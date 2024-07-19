import 'package:bookly_app/core/errors/faluire_class.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<ServerFaluire, List<BookModel>>> fetchFeaturedBooks() async {
    List<BookModel> books = [];
    try {
      var responseBody = await ApiService(dio: Dio())
          .get(endpoint: 'Filtering=free-ebooks&q=subject:programming');
      for (var element in responseBody['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaluire.fromDioException(
            dioExecption: e.type,
            response: e.response,
            statusCode: e.response?.statusCode));
      } else {
        return left(ServerFaluire('Oops, there somthing wrong'));
      }
    }
  }

  @override
  Future<Either<ServerFaluire, List<BookModel>>> newestBooks() async {
    List<BookModel> books = [];
    try {
      var responseBody = await ApiService(dio: Dio()).get(
          endpoint:
              'Filtering=free-ebooks&Sorting=newest&q=subject:programming');
      for (var element in responseBody['items']) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaluire.fromDioException(
            dioExecption: e.type,
            response: e.response,
            statusCode: e.response?.statusCode));
      } else {
        return left(ServerFaluire('Oops, there somthing wrong'));
      }
    }
  }
}
