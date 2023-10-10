import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cs_books/data/repository/books_repository.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/book_details_response.dart';

part 'book_details_event.dart';
part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  final BooksRepository booksRepository;
  BookDetailsBloc({
    required this.booksRepository,
  }) : super(BookDetailsInitial()) {
    on<BookDetailsLoadedEvent>(getBookDetails);
  }

  FutureOr<void> getBookDetails(
      BookDetailsLoadedEvent event, Emitter<BookDetailsState> emit) async {
    emit(BookDetailsLoading());
    try {
      BookDetailsModel? bookDetailsModel =
          await booksRepository.csBookDetails(event.bookIsbn);
      if (bookDetailsModel != null) {
        emit(BookDetailsLoadedState(bookDetailsModel));
      }
    } catch (error) {
      emit(BookDetailsErrorState(error.toString()));
    }
  }
}
