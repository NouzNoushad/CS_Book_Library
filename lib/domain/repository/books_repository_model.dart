import '../models/books_response.dart';

abstract class BooksRepositoryModel {
  Future<List<Books>?>  getCSBooks();
}
