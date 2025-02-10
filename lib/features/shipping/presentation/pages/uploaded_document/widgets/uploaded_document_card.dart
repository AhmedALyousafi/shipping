import 'package:flutter/material.dart';
import 'package:shipping/features/shipping/presentation/pages/uploaded_document/widgets/uploaded_document_header.dart';
import 'package:shipping/features/shipping/presentation/pages/uploaded_document/widgets/uploaded_document_image.dart';

class UploadedDocumentCard extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClose;

  const UploadedDocumentCard({
    Key? key,
    required this.imagePath,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 437),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: const Color(0xFFF9F9F9),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF9E9E9E),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DocumentHeader(onClose: onClose),
            const SizedBox(height: 12),
            DocumentImageContainer(imagePath: imagePath),
          ],
        ),
      ),
    );
  }
}
