import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cs_books/domain/models/books_response.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/repository/books_repository_model.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BooksRepositoryModel booksRepository;
  BooksBloc({
    required this.booksRepository,
  }) : super(BooksInitial()) {
    on<BooksLoadedEvent>(getCSBooks);
  }

  FutureOr<void> getCSBooks(
      BooksLoadedEvent event, Emitter<BooksState> emit) async {
    emit(BooksLoadingState());
    try {
      List<Books>? books = await booksRepository.getCSBooks();
      if (books != null) {
        emit(BooksLoadedState(books));
      }
    } catch (error) {
      emit(BooksErrorState(error.toString()));
    }
  }
}
