import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shipping/features/shipping/presentation/pages/home/export_file_dialog.dart';
import 'package:shipping/features/shipping/presentation/pages/uploaded_document/pages/document_upload_page.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PlutoGrid Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: PlutoGridWidget(),
//     );
//   }
// }

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
        title: 'الترتيب',
        field: 'order',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'نوع الوثيقة',
        field: 'documentType',
        width: 200,
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'تاريخ الإصدار',
        field: 'issueDate',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'تاريخ الانتهاء',
        field: 'expiry_date',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'نوع المحتوى',
        field: 'contentType',
        type: PlutoColumnType.text(),
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'امتداد الملف',
        field: 'extension',
        type: PlutoColumnType.text(),
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'الحجم  (بايت)',
        field: 'size',
        type: PlutoColumnType.text(),
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'العنوان',
        field: 'title',
        width: 150,
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        enableContextMenu: false,
        enableDropToResize: false,
        enableFilterMenuItem: false,
        enableColumnDrag: false,
        enableSetColumnsMenuItem: false,
        enableAutoEditing: false,
        enableSorting: false,
        title: '',
        titleSpan: const TextSpan(children: [
          WidgetSpan(
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ]),
        field: 'actions',
        type: PlutoColumnType.text(),
        titleTextAlign: PlutoColumnTextAlign.end,
        backgroundColor: const Color(0xFF094F90),
        frozen: PlutoColumnFrozen.end,
        width: 180, // زيادة العرض لاستيعاب الأيقونات الجديدة
        renderer: (rendererContext) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.fileUpload, // تعديل البيانات
                  color: Color(0xFF319626),
                  size: 15,
                ),
                onPressed: () {
                  _showExportDialog();
                },
              ),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.fileSignature,
                  color: Color(0xFF00B4D8),
                  size: 15,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.eye, // عرض التفاصيل
                  color: Color(0xFf717171),
                  size: 15,
                ),
                onPressed: () {
                  _showExportDialog2(context);
                },
              ),
              IconButton(
                icon: const FaIcon(
                  FontAwesomeIcons.trashCan, // حذف الملف
                  color: Color(0xFF819AA7),
                  size: 15,
                ),
                onPressed: () {
                  setState(() {
                    rows.remove(rendererContext.row);
                  });
                },
              ),
            ],
          );
        },
      ),
    ];

    // Add an initial empty row
    rows.add(PlutoRow(
      cells: {
        'order': PlutoCell(value: '1'),
        'documentType': PlutoCell(value: ''),
        'issueDate': PlutoCell(value: '-'),
        'expiry_date': PlutoCell(value: '-'),
        'contentType': PlutoCell(value: ''),
        'extension': PlutoCell(value: ''),
        'size': PlutoCell(value: ''),
        'title': PlutoCell(value: '-'),
        'actions': PlutoCell(value: 'Delete'),
      },
    ));
  }

  void _showExportDialog() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      // Extract file information
      String fileName = file.name; // Get the file name
      String filePath =
          kIsWeb ? 'Unavailable on Web' : file.path ?? 'No Path'; // Handle Web
      String fileExtension = fileName.split('.').last;
      int fileSize = file.size;
      String fileType = _getFileType(fileExtension);

      // Update the grid with the file data
      setState(() {
        rows[currentRowIndex].cells['order']!.value =
            fileName; // Show file name
        rows[currentRowIndex].cells['issueDate']!.value =
            filePath; // Show path or message
        rows[currentRowIndex].cells['contentType']!.value = fileType;
        rows[currentRowIndex].cells['extension']!.value =
            fileExtension.toUpperCase();
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
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onLoaded: (PlutoGridOnLoadedEvent event) {
          stateManager = event.stateManager;
        },
        configuration: const PlutoGridConfiguration(
          style: PlutoGridStyleConfig(
            gridBorderColor: Colors.grey,
            cellTextStyle: TextStyle(fontSize: 12),
            columnTextStyle: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _showExportDialog,
      //   child: const Icon(Icons.upload),
      // ),
    );
  }
}

void _showExportDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => ExportFileDialog(),
  );
}

void _showExportDialog2(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => const DocumentUploadPage(),
  );
}
