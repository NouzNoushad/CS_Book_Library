part of 'books_bloc.dart';

sealed class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => [];
}

class BooksLoadedEvent extends BooksEvent {
  const BooksLoadedEvent();

  @override
  List<Object> get props => [];
}
