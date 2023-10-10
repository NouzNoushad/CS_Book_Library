part of 'book_details_bloc.dart';

sealed class BookDetailsState extends Equatable {
  const BookDetailsState();

  @override
  List<Object> get props => [];
}

final class BookDetailsInitial extends BookDetailsState {}

final class BookDetailsLoading extends BookDetailsState {}

class BookDetailsLoadedState extends BookDetailsState {
  final BookDetailsModel bookDetailsModel;
  const BookDetailsLoadedState(this.bookDetailsModel);

  @override
  List<Object> get props => [bookDetailsModel];
}

class BookDetailsErrorState extends BookDetailsState {
  final String error;
  const BookDetailsErrorState(this.error);

  @override
  List<Object> get props => [error];
}
