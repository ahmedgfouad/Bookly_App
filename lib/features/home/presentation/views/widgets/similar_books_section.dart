import 'package:bookly/core/utils/stayles.dart';
import 'package:bookly/features/home/presentation/views/widgets/similer_books_list_view.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "you can like also",
          style: AppStyles.textStyle18.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 30),
        
        const SimilarBooksListView(),
      ],
    );
  }
}
