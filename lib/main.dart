import 'package:cs_books/routes/route_constants.dart';
import 'package:cs_books/routes/routes.dart';
import 'package:cs_books/utils/colors.dart';
import 'package:flutter/material.dart';

import 'domain/bloc_widget/bloc_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocWidget(
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorPicker.seedColor),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        initialRoute: RouteConstant.home,
      ),
    );
  }
}
