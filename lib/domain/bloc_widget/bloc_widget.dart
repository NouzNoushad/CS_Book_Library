import 'package:cs_books/data/bloc/book_details/book_details_bloc.dart';
import 'package:cs_books/data/bloc/books_bloc/books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/books_repository.dart';

class BlocWidget extends StatelessWidget {
  final Widget child;
  const BlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => BooksRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BooksBloc(
              booksRepository: RepositoryProvider.of<BooksRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => BookDetailsBloc(
              booksRepository: RepositoryProvider.of<BooksRepository>(context),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
