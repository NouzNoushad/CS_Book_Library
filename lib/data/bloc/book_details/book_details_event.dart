part of 'book_details_bloc.dart';

sealed class BookDetailsEvent extends Equatable {
  const BookDetailsEvent();

  @override
  List<Object> get props => [];
}

class BookDetailsLoadedEvent extends BookDetailsEvent {
  final String bookIsbn;
  const BookDetailsLoadedEvent(this.bookIsbn);

  @override
  List<Object> get props => [bookIsbn];
}
