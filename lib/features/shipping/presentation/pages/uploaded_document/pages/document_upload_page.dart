import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import 'package:open_file/open_file.dart';

class DocumentUploadPage extends StatelessWidget {
  final String fileName;
  final String filePath;
  final String fileType;
  final String fileExtension;
  final String fileSize;
  final Uint8List? fileBytes; // إضافة هذا الحقل

  const DocumentUploadPage({
    Key? key,
    required this.fileName,
    required this.filePath,
    required this.fileType,
    required this.fileExtension,
    required this.fileSize,
    this.fileBytes, // إضافة هذا الحقل
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
        if (_isImage(fileExtension) && fileBytes != null)
          Image.memory(
            fileBytes!,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
        if (_isExcelOrWord())
          ElevatedButton(
            onPressed: () => _openFile(context),
            child: const Text("فتح الملف في Excel"),
          ),
      ],
    );
  }

  bool _isImage(String fileExtension) {
    return ['jpg', 'jpeg', 'png', 'gif'].contains(fileExtension.toLowerCase());
  }

  bool _isExcelOrWord() {
    return fileExtension.toLowerCase() == 'xlsx' ||
        fileExtension.toLowerCase() == 'xls' ||
        fileExtension.toLowerCase() == 'docx' ||
        fileExtension.toLowerCase() == 'doc';
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
