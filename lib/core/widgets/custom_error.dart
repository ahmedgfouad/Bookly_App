import 'package:bookly/core/utils/stayles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  const CustomErrorWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: AppStyles.textStyle18,
      textAlign: TextAlign.center,
    );
  }
}
