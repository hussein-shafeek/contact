import 'package:flutter/material.dart';

class PreviewBox extends StatelessWidget {
  final String text;
  final String hint;
  const PreviewBox({required this.text, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white10, // نفس لون الـ TextField
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        text.isEmpty ? hint : text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
