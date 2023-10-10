import 'package:cs_books/presentation/book_details/layout/book_details.dart';
import 'package:cs_books/presentation/books_home/books_home.dart';
import 'package:cs_books/routes/route_constants.dart';
import 'package:cs_books/utils/colors.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.home:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.home),
            builder: (context) => const CSBooksHome());
      case RouteConstant.details:
        return MaterialPageRoute(
            settings: const RouteSettings(name: RouteConstant.details),
            builder: (context) => BookDetails(bookIsbn: settings.arguments as String,));
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  backgroundColor: ColorPicker.primaryColor2,
                  body: Center(child: Text('No Page Found')),
                ));
    }
  }
}
