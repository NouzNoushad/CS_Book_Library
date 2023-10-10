import 'package:cs_books/data/network/base_client.dart';
import 'package:cs_books/domain/models/book_details_response.dart';
import 'package:cs_books/domain/models/books_response.dart';
import 'package:cs_books/domain/repository/books_repository_model.dart';
import 'package:cs_books/utils/end_points.dart';

class BooksRepository extends BooksRepositoryModel {
  BaseClient baseClient = BaseClient();

  @override
  Future<List<Books>?> getCSBooks() async {
    String url = "$baseUrl/${EndPoints.newBooks}";
    String? response = await baseClient.getRequest(url);
    if (response != null) {
      BooksResponseModel booksResponse = booksResponseModelFromJson(response);
      print('//////////////// response books: ${booksResponse.books}');
      return booksResponse.books;
    }
    return null;
  }

  @override
  Future<BookDetailsModel?> csBookDetails(String bookIsbn) async {
    String url = "$baseUrl/${EndPoints.details}/$bookIsbn";
    String? response = await baseClient.getRequest(url);
    if (response != null) {
      BookDetailsModel bookDetailsModel = bookDetailsModelFromJson(response);
      print('//////////////// response details: $bookDetailsModel');
      return bookDetailsModel;
    }
    return null;
  }
}
