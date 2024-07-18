import 'package:bookly_app/core/errors/faluire_class.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<FaluireClass, List<BookModel>>> bestSellerBooks() async {
    List<BookModel> books = [];
    try {
      var response = await Api().get(
          endpoint:
              'https://www.googleapis.com/books/v1/volumes?q=programming');
      for (var element in response.data) {
        books.add(BookModel.fromJson(element));
      }
      return right(books);
    } catch (e) {
      throw Exception('h');
    }
  }

  @override
  Future<Either<FaluireClass, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}

// class Either {}
