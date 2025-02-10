import 'package:flutter/material.dart';

class DocumentImageContainer extends StatelessWidget {
  final String imagePath;

  const DocumentImageContainer({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 285,
          fit: BoxFit.contain,
          semanticLabel: 'Uploaded document preview',
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.error_outline,
              size: 40,
              color: Colors.red,
              semanticLabel: 'Error loading document preview',
            );
          },
        ),
      ),
    );
  }
}
