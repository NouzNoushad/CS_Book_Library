part of 'books_bloc.dart';

sealed class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

final class BooksInitial extends BooksState {}

final class BooksLoadingState extends BooksState {}

class BooksLoadedState extends BooksState {
  final List<Books> books;
  const BooksLoadedState(this.books);

  @override
  List<Object> get props => [books];
}

class BooksErrorState extends BooksState {
  final String error;
  const BooksErrorState(this.error);

  @override
  List<Object> get props => [error];
}
