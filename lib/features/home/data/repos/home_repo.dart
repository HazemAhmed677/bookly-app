import 'package:bookly_app/core/errors/faluire_class.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<ServerFaluire, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<ServerFaluire, List<BookModel>>> newestBooks();
}
