import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class BookHighlights extends StatelessWidget {
  final String title;
  final String subTitle;
  const BookHighlights(
      {super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: ColorPicker.primaryColor4,
              ),
            ),
          ),
          Expanded(
            child: Text(
              subTitle,
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: ColorPicker.primaryColor4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
