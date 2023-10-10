import 'package:cs_books/data/bloc/book_details/book_details_bloc.dart';
import 'package:cs_books/presentation/book_details/components/highlights.dart';
import 'package:cs_books/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetails extends StatefulWidget {
  final String bookIsbn;
  const BookDetails({super.key, required this.bookIsbn});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  void initState() {
    context
        .read<BookDetailsBloc>()
        .add(BookDetailsLoadedEvent(widget.bookIsbn));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.primaryColor2,
      appBar: AppBar(
        backgroundColor: ColorPicker.primaryColor4,
        title: const Text('Details'),
      ),
      body: BlocBuilder<BookDetailsBloc, BookDetailsState>(
        builder: (context, state) {
          if (state is BookDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BookDetailsLoadedState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Material(
                color: ColorPicker.primaryColor2,
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(
                        color: ColorPicker.primaryColor3,
                        image: DecorationImage(
                            image: NetworkImage(
                                state.bookDetailsModel.image.toString()))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.bookDetailsModel.title.toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: ColorPicker.primaryColor4,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        state.bookDetailsModel.subtitle != ""
                            ? Text(
                                state.bookDetailsModel.subtitle.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  fontWeight: FontWeight.w500,
                                  color: ColorPicker.primaryColor4,
                                ),
                              )
                            : const SizedBox.shrink(),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.bookDetailsModel.price.toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: ColorPicker.primaryColor3,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          state.bookDetailsModel.desc.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                            color: ColorPicker.primaryColor4,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Highlights",
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            fontWeight: FontWeight.w500,
                            color: ColorPicker.primaryColor3,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BookHighlights(
                            title: "Author",
                            subTitle:
                                state.bookDetailsModel.authors.toString()),
                        BookHighlights(
                            title: "Publisher",
                            subTitle:
                                state.bookDetailsModel.publisher.toString()),
                        BookHighlights(
                            title: "language",
                            subTitle:
                                state.bookDetailsModel.language.toString()),
                        BookHighlights(
                            title: "Pages",
                            subTitle: state.bookDetailsModel.pages.toString()),
                        BookHighlights(
                            title: "Year",
                            subTitle: state.bookDetailsModel.year.toString()),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
