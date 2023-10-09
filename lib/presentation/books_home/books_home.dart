import 'package:cs_books/data/bloc/books_bloc/books_bloc.dart';
import 'package:cs_books/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/books_response.dart';

class CSBooksHome extends StatefulWidget {
  const CSBooksHome({super.key});

  @override
  State<CSBooksHome> createState() => _CSBooksHomeState();
}

class _CSBooksHomeState extends State<CSBooksHome> {
  @override
  void initState() {
    context.read<BooksBloc>().add(const BooksLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.primaryColor2,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorPicker.primaryColor4,
        title: const Text('CS Book Library'),
      ),
      body: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          if (state is BooksLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is BooksLoadedState) {
            return GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7),
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  Books book = state.books[index];
                  return Column(children: [
                    Expanded(
                      flex: 2,
                      child: Material(
                        color: ColorPicker.primaryColor1,
                        child: Image.network(
                          book.image.toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorPicker.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.title.toString(),
                              style: const TextStyle(
                                  color: ColorPicker.primaryColor4,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              book.price.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: ColorPicker.primaryColor3,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]);
                });
          }
          return Container();
        },
      ),
    );
  }
}
