import 'package:flutter/material.dart';
import '../widgets/uploaded_document_card.dart';

class DocumentUploadPage extends StatelessWidget {
  const DocumentUploadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UploadedDocumentCard(
          imagePath: 'assets/images/document.png',
          onClose: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
