import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: const Opacity(
          opacity: .7,
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        hintText: "search",
        enabledBorder: buildOulLineInputBorder(),
        focusedBorder: buildOulLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOulLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
