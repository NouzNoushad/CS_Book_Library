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
      child: BlocProvider(
        create: (context) => BooksBloc(
          booksRepository: RepositoryProvider.of<BooksRepository>(context),
        ),
        child: child,
      ),
    );
  }
}
