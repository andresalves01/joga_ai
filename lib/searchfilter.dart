import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 58.0,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.fromLTRB(5.0, 15, 5.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(0.3)),
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.tune_rounded),
    );
  }
}
