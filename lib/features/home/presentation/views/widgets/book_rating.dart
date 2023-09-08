// ignore_for_file: non_constant_identifier_names

import 'package:bookly/core/utils/stayles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  final num rating;
  final int count;
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        const SizedBox(width: 5),
        Text(
          rating.toString(),
        ),
        const SizedBox(width: 5),
        Opacity(
            opacity: .7,
            child: Text(
              "($count)",
              style: AppStyles.textStyle16,
            )),
      ],
    );
  }
}
