import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:shipping/features/shipping/presentation/pages/home/export_file_dialog.dart';
import 'package:shipping/features/shipping/presentation/pages/uploaded_document/pages/document_upload_page.dart';

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
        title: '',
        field: 'addRow',
        type: PlutoColumnType.text(),
        width: 50,
        enableEditingMode: false,
        enableColumnDrag: false,
        enableRowDrag: false,
        enableContextMenu: false,
        backgroundColor: const Color(0xFF0C69C0),
        renderer: (rendererContext) {
          return StatefulBuilder(
            builder: (context, setState) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        // الحصول على فهرس الصف الحالي
                        int currentRowIndex = rendererContext.rowIdx;
                        PlutoRow currentRow = rows[currentRowIndex];

                        // إنشاء صف جديد مع نسخ "نوع الوثيقة" و "تاريخ الإصدار"
                        final newRow = PlutoRow(
                          cells: {
                            'addRow': PlutoCell(value: ''),
                            'order': PlutoCell(value: ''),
                            'documentType': PlutoCell(value: 'documentType'),
                            'issueDate': PlutoCell(
                                value: 'issueDate'), // نسخ تاريخ الإصدار
                            'expiry_date': PlutoCell(value: ''),
                            'contentType': PlutoCell(value: ''),
                            'extension': PlutoCell(value: ''),
                            'size': PlutoCell(value: ''),
                            'title': PlutoCell(value: ''),
                            'actions': PlutoCell(value: 'Delete'),
                          },
                        );

                        setState(() {
                          rows.insert(currentRowIndex + 1, newRow);
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
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
                  FontAwesomeIcons.eye,
                  color: Color(0xFf717171),
                  size: 15,
                ),
                onPressed: () {
                  _showExportDialog2(context, rendererContext.row);
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
    rows.add(_createEmptyRow(1));
  }

  void _addNewRow() {
    setState(() {
      int newIndex = rows.length + 1;
      rows.add(_createEmptyRow(newIndex));
    });
  }

  PlutoRow _createEmptyRow(int index) {
    return PlutoRow(
      cells: {
        'addRow': PlutoCell(value: ''),
        'order': PlutoCell(value: index.toString()),
        'documentType': PlutoCell(value: ''),
        'issueDate': PlutoCell(value: '-'),
        'expiry_date': PlutoCell(value: '-'),
        'contentType': PlutoCell(value: ''),
        'extension': PlutoCell(value: ''),
        'size': PlutoCell(value: ''),
        'title': PlutoCell(value: '-'),
        'actions': PlutoCell(value: 'Delete'),
      },
    );
  }

  void _showExportDialog() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      // بيانات الملف
      String fileName = file.name;
      String fileExtension = fileName.split('.').last;
      int fileSize = file.size;
      String fileType = _getFileType(fileExtension);

      Uint8List? fileBytes = file.bytes; // تحميل الملف بصيغة Bytes

      // تحديث البيانات في الصف الحالي
      setState(() {
        rows[currentRowIndex].cells['documentType']!.value = fileName;
        rows[currentRowIndex].cells['issueDate']!.value = 'تم تحميل الملف';
        rows[currentRowIndex].cells['contentType']!.value = fileType;
        rows[currentRowIndex].cells['extension']!.value =
            fileExtension.toUpperCase();
        rows[currentRowIndex].cells['size']!.value = fileSize.toString();
        rows[currentRowIndex].cells['fileBytes'] =
            PlutoCell(value: fileBytes); // تخزين الملف للعرض لاحقًا
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

void _showExportDialog2(BuildContext context, PlutoRow selectedRow) {
  if (selectedRow.cells['documentType']?.value == null) {
    return;
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DocumentUploadPage(
        fileName: selectedRow.cells['documentType']?.value ?? 'غير متوفر',
        filePath: selectedRow.cells['issueDate']?.value ?? '',
        fileType: selectedRow.cells['contentType']?.value ?? 'غير متوفر',
        fileExtension: selectedRow.cells['extension']?.value ?? 'غير متوفر',
        fileSize: selectedRow.cells['size']?.value ?? 'غير متوفر',
      );
    },
  );
}
