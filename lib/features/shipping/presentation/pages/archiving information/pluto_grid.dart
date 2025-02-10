import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlutoGrid Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlutoGridWidget(),
    );
  }
}

class PlutoGridWidget extends StatefulWidget {
  @override
  _PlutoGridWidgetState createState() => _PlutoGridWidgetState();
}

class _PlutoGridWidgetState extends State<PlutoGridWidget> {
  late List<PlutoColumn> columns;
  final List<PlutoRow> rows = [];
  PlutoGridStateManager? stateManager;
  int currentRowIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeColumnsAndRows();
  }

  void _initializeColumnsAndRows() {
    columns = [
      PlutoColumn(
        title: 'نوع المحتوى',
        field: 'contentType',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'امتداد الملف',
        field: 'extension',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'حجم المرفق (بايت)',
        field: 'size',
        type: PlutoColumnType.text(),
      ),
    ];

    // Add an initial empty row
    rows.add(PlutoRow(
      cells: {
        'contentType': PlutoCell(value: ''),
        'extension': PlutoCell(value: ''),
        'size': PlutoCell(value: ''),
      },
    ));
  }

  void _showExportDialog() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      // Extract file information
      String fileName = file.name;
      String fileExtension = fileName.split('.').last;
      int fileSize = file.size;
      String fileType = _getFileType(fileExtension);

      // Update the grid with the file data
      setState(() {
        rows[currentRowIndex].cells['contentType']!.value = fileType;
        rows[currentRowIndex].cells['extension']!.value = fileExtension.toUpperCase();
        rows[currentRowIndex].cells['size']!.value = fileSize.toString();
      });
    }
  }

  String _getFileType(String extension) {
    switch (extension.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return 'صورة';
      case 'mp3':
      case 'wav':
        return 'صوت';
      case 'mp4':
      case 'mov':
      case 'avi':
        return 'فيديو';
      case 'pdf':
        return 'PDF';
      case 'doc':
      case 'docx':
        return 'وثيقة';
      case 'zip':
      case 'rar':
        return 'ملفات مضغوطة';
      default:
        return 'نص';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PlutoGrid Example'),
      ),
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onLoaded: (PlutoGridOnLoadedEvent event) {
          stateManager = event.stateManager;
        },
        configuration: PlutoGridConfiguration(
          style: PlutoGridStyleConfig(
            gridBorderColor: Colors.grey,
            cellTextStyle: TextStyle(fontSize: 14),
            columnTextStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showExportDialog,
        child: Icon(Icons.upload),
      ),
    );
  }
}

class ExportFileDialog extends StatefulWidget {
  @override
  _ExportFileDialogState createState() => _ExportFileDialogState();
}

class _ExportFileDialogState extends State<ExportFileDialog> {
  String? selectedFormat;
  PlatformFile? _pickedFile;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(16),
        titlePadding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: SizedBox(
          width: 603.53,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField2<String>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconSize: 24,
                ),
                hint: const Text("*صيغة الملف"),
                items: const [
                  DropdownMenuItem(
                    value: "رفع من الجهاز",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("رفع من الجهاز", textAlign: TextAlign.right),
                      ],
                    ),
                  ),
                  DropdownMenuItem(
                    value: "استخدام الماسح الضوئي",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("استخدام الماسح الضوئي", textAlign: TextAlign.right),
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedFormat = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              if (_pickedFile != null)
                Text(
                  "تم اختيار الملف: ${_pickedFile!.name}",
                  style: const TextStyle(fontSize: 14, color: Colors.green),
                ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (selectedFormat == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("يرجى اختيار صيغة الملف")),
                    );
                    return;
                  }

                  if (selectedFormat == "رفع من الجهاز") {
                    FilePickerResult? result = await FilePicker.platform.pickFiles();

                    if (result != null) {
                      setState(() {
                        _pickedFile = result.files.first;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("لم يتم اختيار ملف")),
                      );
                    }
                  } else if (selectedFormat == "استخدام الماسح الضوئي") {
                    // Placeholder for scanner functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("هذه الميزة غير متاحة حالياً")),
                    );
                  }

                  if (_pickedFile != null) {
                    Navigator.pop(context, _pickedFile); // Return the selected file
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.save_alt, size: 20, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "رفع المرفق",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("رفع المرفقات", style: TextStyle(fontSize: 20)),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}