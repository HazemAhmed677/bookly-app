import 'package:bookly_app/core/errors/faluire_class.dart';
import 'package:bookly_app/core/models/book_model/book_model.dart';
// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ServerFaluire, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<ServerFaluire, List<BookModel>>> fetchNewestBooks();
  Future<Either<ServerFaluire, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
