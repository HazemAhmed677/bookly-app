import 'package:bookly_app/core/errors/faluire_class.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<ServerFaluire, List<BookModel>>> fetchFeaturedBooks() async {
    List<BookModel> books = [];
    try {
      var responseBody = await apiService.get(
        endpoint: 'Filtering=free-ebooks&q=programming',
      );
      List<dynamic> itemsList = responseBody['items'];

      for (var element in itemsList) {
        books.add(BookModel.fromMap(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFaluire.fromDioException(
            dioExecption: e.type,
            response: e.response,
            statusCode: e.response?.statusCode));
      } else {
        return left(ServerFaluire(e.toString()));
      }
    }
  }

  @override
  Future<Either<ServerFaluire, List<BookModel>>> fetchNewestBooks() async {
    List<BookModel> books = [];
    try {
      var responseBody = await apiService.get(
          endpoint:
              'Filtering=free-ebooks&Sorting=newest&q=subject:programming');
      for (var element in responseBody['items']) {
        books.add(BookModel.fromMap(element));
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
  Future<Either<ServerFaluire, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    List<BookModel> books = [];
    try {
      var responseBody = await apiService.get(
        endpoint: 'Filtering=free-ebooks&q=subject:$category',
      );
      for (var element in responseBody['items']) {
        books.add(BookModel.fromMap(element));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFaluire.fromDioException(
              dioExecption: e.type,
              response: e.response,
              statusCode: e.response?.statusCode),
        );
      } else {
        return left(
          ServerFaluire(
            e.toString(),
          ),
        );
      }
    }
  }
}
