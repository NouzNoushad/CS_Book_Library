import '../models/book_details_response.dart';
import '../models/books_response.dart';

abstract class BooksRepositoryModel {
  Future<List<Books>?> getCSBooks();
  Future<BookDetailsModel?> csBookDetails(String bookIsbn);
}
