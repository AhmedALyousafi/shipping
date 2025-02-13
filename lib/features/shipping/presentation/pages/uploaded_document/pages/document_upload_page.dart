import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class DocumentUploadPage extends StatelessWidget {
  final String fileName;
  final String filePath;
  final String fileType;
  final String fileExtension;
  final String fileSize;

  const DocumentUploadPage({
    Key? key,
    required this.fileName,
    required this.filePath,
    required this.fileType,
    required this.fileExtension,
    required this.fileSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(fileName),
      content: _buildFileContent(context),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('إغلاق'),
        ),
      ],
    );
  }

  Widget _buildFileContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("نوع الملف: $fileType\nالحجم: $fileSize بايت"),
        const SizedBox(height: 10),
        if (_isExcelOrWord())
          ElevatedButton(
            onPressed: () => _openFile(context),
            child: const Text("فتح الملف في Excel"),
          ),
      ],
    );
  }

  bool _isExcelOrWord() {
    return fileExtension.toLowerCase() == 'xlsx' ||
        fileExtension.toLowerCase() == 'xls';
  }

  void _openFile(BuildContext context) {
    if (filePath.isNotEmpty && File(filePath).existsSync()) {
      OpenFile.open(filePath);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("الملف غير موجود أو لم يتم تحميله بشكل صحيح!")),
      );
    }
  }
}
