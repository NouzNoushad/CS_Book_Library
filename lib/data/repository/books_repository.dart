import 'package:cs_books/data/network/base_client.dart';
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
      print('//////////////// response: ${booksResponse.books}');
      return booksResponse.books;
    }
    return null;
  }
}
