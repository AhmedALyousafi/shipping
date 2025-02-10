import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shipping/features/shipping/presentation/pages/home/export_file_dialog.dart';
import 'package:shipping/features/shipping/presentation/pages/uploaded_document/pages/document_upload_page.dart';
import 'package:shipping/features/shipping/presentation/pages/uploaded_document/widgets/uploaded_document_card.dart';

class PlutoGridWidget extends StatefulWidget {
  const PlutoGridWidget({super.key, this.showrow = true});

  final bool showrow;

  @override
  State<PlutoGridWidget> createState() => _PlutoGridWidgetState();
}

class _PlutoGridWidgetState extends State<PlutoGridWidget> {
  late List<PlutoColumn> columns;
  final List<PlutoRow> rows = [];

  String? selectedValue;
  String? selectValue;

  final List<PlutoColumn> columns1 = [];

  late List<PlutoRow> rows1;
  PlutoGridStateManager? stateManager;
  int? hoveredIndex;
  List<Map<String, dynamic>> items = [
    {
      "order": "1",
      "documentType": "1 - شهادة الميلاد",
      "issueDate": "-",
      "expiry_date": "-",
      "contentType": "صورة",
      "extension": "JPEG",
      "size": "22016",
      "title": "-",
      "selected": false,
    },
    {
      "order": "2",
      "documentType": "2- شهادة وفاة الاب",
      "issueDate": "-",
      "expiry_date": "-",
      "contentType": "صورة",
      "extension": "JPEG",
      "size": "25016",
      "title": "-",
      "selected": false,
    },
    {
      "order": "3",
      "documentType": "18 - كشف طبي",
      "issueDate": "-",
      "expiry_date": "-",
      "contentType": "صورة",
      "extension": "JPEG",
      "size": "145",
      "title": "-",
      "selected": false,
    },
  ];

  int currentRowIndex = 2;

  List<String> productNumbers = [
    "3",
    "2",
    "1",
  ];

  @override
  void initState() {
    super.initState();

    columns = [
      PlutoColumn(
        title: '',
        field: 'selected',
        type: PlutoColumnType.text(),
        backgroundColor: const Color(0xFF0C69C0),
        enableRowDrag: false,
        enableColumnDrag: false,
        enableRowChecked: false,
        frozen: PlutoColumnFrozen.start,
        width: 72,
        textAlign: PlutoColumnTextAlign.center,
        cellPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        filterPadding: EdgeInsets.zero,
        renderer: (rendererContext) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // تحديد فهرس السطر الحالي
                      int currentRowIndex = rendererContext.rowIdx;

                      // إنشاء السطر الجديد مع خلايا فارغة
                      final newRow = PlutoRow(
                        cells: {
                          'selected':
                              PlutoCell(value: 'false'), // قيمة افتراضية
                          'order': PlutoCell(value: ''), // خلية فارغة
                          'documentType':
                              PlutoCell(value: 'Doc Name'), // خلية فارغة
                          'issueDate':
                              PlutoCell(value: 'Doc Description'), // خلية فارغة
                          'expiry_date': PlutoCell(value: ''), // خلية فارغة
                          'contentType': PlutoCell(value: ''), // خلية فارغة
                          'extension': PlutoCell(value: ''), // خلية فارغة
                          'size': PlutoCell(value: ''), // خلية فارغة
                          'title': PlutoCell(value: ''), // خلية فارغة
                          'actions': PlutoCell(value: ''), // يمكن ضبطها لاحقًا
                        },
                      );

                      setState(() {
                        // إضافة السطر الجديد بعد السطر الحالي
                        rows.insert(currentRowIndex + 1, newRow);
                        // طباعة للتأكد
                      });
                    },
                  ),
                  Checkbox(
                    value:
                        rendererContext.row.cells['selected']!.value == 'true',
                    onChanged: (value) {
                      setState(() {
                        rendererContext.row.cells['selected']!.value =
                            value == true ? 'true' : 'false';
                      });
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
      PlutoColumn(
        title: 'الترتيب',
        field: 'order',
        width: 90,
        type: PlutoColumnType.number(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
        enableSorting: true,
        renderer: (rendererContext) {
          int currentIndex = rendererContext.rowIdx;
          return MouseRegion(
            onEnter: (_) => setState(() => hoveredIndex = currentIndex),
            onExit: (_) => setState(() => hoveredIndex = null),
            child: GestureDetector(
              onTap: () {
                openGridPopup(context);
              },
              child: Text(
                rendererContext.row.cells['order']!.value.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: hoveredIndex == currentIndex
                      ? const Color(0xFF0C69C0)
                      : Colors.black,
                  decoration: hoveredIndex == currentIndex
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ),
          );
        },
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
        title: 'نوع المحتوي',
        field: 'contentType',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
        renderer: (rendererContext) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 180, // تحديد عرض الحاوية
                  child: DropdownButton2(
                    value: selectedValue,
                    hint: const Text(
                      'نص',
                      style: TextStyle(fontSize: 12, color: Color(0xFF474747)),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'نص', // تأكد من أن هذه القيمة فريدة
                        child: _buildDropdownItem('نص'),
                      ),
                      DropdownMenuItem(
                        value: 'صورة', // تأكد من أن هذه القيمة فريدة
                        child: _buildDropdownItem('صورة'),
                      ),
                      DropdownMenuItem(
                        value: 'صوت', // تأكد من أن هذه القيمة فريدة
                        child: _buildDropdownItem('صوت'),
                      ),
                      DropdownMenuItem(
                        value: 'فيديو', // تأكد من أن هذه القيمة فريدة
                        child: _buildDropdownItem('فيديو'),
                      ),
                      DropdownMenuItem(
                        value: 'تطبيقات', // تأكد من أن هذه القيمة فريدة
                        child: _buildDropdownItem('تطبيقات'),
                      ),
                      DropdownMenuItem(
                        value: 'ملفات مضغوطة', // تأكد من أن هذه القيمة فريدة
                        child: _buildDropdownItem('ملفات مضغوطة'),
                      ),
                      DropdownMenuItem(
                        value: 'ملفات إختصار', // تأكد من أن هذه القيمة فريدة
                        child: _buildDropdownItem('ملفات إختصار'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value; // تحديث القيمة المحددة
                      });
                      print('تم اختيار: $value');
                    },
                    isExpanded: true, // لجعل القائمة تأخذ العرض الكامل
                    underline: SizedBox(),
                  )),
            ],
          );
        },
      ),
      PlutoColumn(
        title: 'إمتداد الملف',
        field: 'extension',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
        renderer: (rendererContext) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // المسافة بين النص والأيقونة
              Container(
                  width: 180, // تحديد عرض الحاوية
                  child: DropdownButton2(
                    value: selectValue,
                    hint: const Text(
                      'JPEG ',
                      style: TextStyle(fontSize: 12, color: Color(0xFF474747)),
                    ),
                    items: [
                      DropdownMenuItem(
                        value: 'JPEG',
                        child: Text('JPEG'),
                      ),
                      DropdownMenuItem(
                        value: 'PNG',
                        child: Text('PNG'),
                      ),
                      DropdownMenuItem(
                        value: 'PDF',
                        child: Text('PDF'),
                      ),
                      DropdownMenuItem(
                        value: 'DOCX',
                        child: Text('DOCX'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectValue = value; // تحديث القيمة المحددة
                      });
                      print('تم اختيار: $value');
                    },
                    isExpanded: true, // لجعل القائمة تأخذ العرض الكامل
                    // dropdownMaxHeight: 200, // الحد الأقصى لارتفاع القائمة المنسدلة
                    underline: SizedBox(),
                  )),
            ],
          );
        },
      ),
      PlutoColumn(
        title: 'حجم المرفق (Byte)',
        field: 'size',
        width: 150,
        type: PlutoColumnType.number(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'عنوان المرفق',
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
                  _showExportDialog2();
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

    for (var row in items) {
      rows.add(PlutoRow(
        cells: {
          'selected': PlutoCell(value: row['']),
          'order': PlutoCell(value: '2'),
          'documentType': PlutoCell(value: row['documentType']),
          'issueDate': PlutoCell(value: '-'),
          'expiry_date': PlutoCell(value: '-'),
          'contentType': PlutoCell(value: 'صورة'),
          'extension': PlutoCell(value: 'JPEG'),
          'size': PlutoCell(value: '25016'),
          'title': PlutoCell(value: '-'),
          'actions': PlutoCell(value: 'Delete'),
        },
      ));
    }

    columns1.addAll([
      PlutoColumn(
        title: 'الترتيب',
        field: 'order',
        type: PlutoColumnType.text(),
        width: 100,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
      ),
      PlutoColumn(
        title: 'نوع الوثيقة',
        field: 'documentType',
        type: PlutoColumnType.text(),
        width: 200,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
      ),
      PlutoColumn(
        title: 'تاريخ الإصدار',
        field: 'issueDate',
        type: PlutoColumnType.text(),
        width: 150,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
      ),
      PlutoColumn(
        title: 'تاريخ الانتهاء',
        field: 'expiry_date',
        type: PlutoColumnType.text(),
        width: 150,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
      ),
      PlutoColumn(
        title: 'نوع المحتوى',
        field: 'contentType',
        type: PlutoColumnType.text(),
        width: 100,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
      ),
      PlutoColumn(
        title: 'الامتداد',
        field: 'extension',
        type: PlutoColumnType.text(),
        width: 100,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
      ),
      PlutoColumn(
        title: 'الحجم (بايت)',
        field: 'size',
        type: PlutoColumnType.text(),
        width: 150,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
      ),
      PlutoColumn(
        title: 'العنوان',
        field: 'title',
        type: PlutoColumnType.text(),
        width: 150,
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
      ),
    ]);
  }

  void openGridPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              width: 630,
              height: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'اختيار المنتج',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'ReadexPro',
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF474747)),
                        ),
                        InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Color(0xFFF2F2F2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              FontAwesomeIcons.x,
                              color: Color(0xFF819AA7),
                              size: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: PlutoGrid(
                        columns: columns1,
                        rows: items
                            .map((item) => PlutoRow(
                                  cells: {
                                    'order': PlutoCell(value: item['order']),
                                    'documentType':
                                        PlutoCell(value: item['documentType']),
                                    'contentType':
                                        PlutoCell(value: item['contentType']),
                                  },
                                ))
                            .toList(),
                        mode: PlutoGridMode.select,
                        onLoaded: (PlutoGridOnLoadedEvent event) {
                          event.stateManager.setShowColumnFilter(true);
                        },
                        onSelected: (PlutoGridOnSelectedEvent event) {
                          if (event.row != null &&
                              event.row!.cells['order'] != null) {
                            String selectedProductName =
                                event.row!.cells['order']!.value.toString();
                            _populateRowData(
                                selectedProductName, event.rowIdx!);

                            Navigator.of(context).pop();
                          } else {
                            // Handle the scenario where the product name is not available
                            print(
                                'Selected row does not contain a valid product name.');
                          }
                        },
                        configuration: const PlutoGridConfiguration(
                            style: PlutoGridStyleConfig(
                                gridBackgroundColor: Colors.white)),
                        onSorted: (PlutoGridOnSortedEvent event) {
                          print(event);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _populateRowData(String productNumber, int rowInx) {
    if (currentRowIndex >= rows.length) {
      print("No more rows available for new products");
      return;
    }
    final product = items.firstWhere(
      (item) => item['order'] == productNumber,
      orElse: () => {},
    );

    if (product.isNotEmpty) {
      setState(() {
        rows[currentRowIndex].cells['order']!.value =
            product['order']; // Update product name
        rows[currentRowIndex].cells['documentType']!.value =
            product['documentType'];
        rows[currentRowIndex].cells['issueDate']!.value = product['issueDate'];
        rows[currentRowIndex].cells['expiry_date']!.value =
            product['expiry_date'];
        rows[currentRowIndex].cells['value']!.value = product['value'];
        rows[currentRowIndex].cells['extension']!.value = product['extension'];
        rows[currentRowIndex].cells['size']!.value = product['size'];
        rows[currentRowIndex].cells['title']!.value = product['title'];
      });

      stateManager!.setCurrentCell(
        rows[rowInx].cells['documentType'],
        rowInx,
        notify: true,
      );
      stateManager!.setEditing(true);

      // Notify the grid manager that the cell data has changed
      stateManager!.notifyListeners();
    } else {
      print("Product not found: $productNumber");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              )),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: PlutoGrid(
                  columns: columns,
                  rows: rows,
                  onChanged: (PlutoGridOnChangedEvent event) {
                    setState(() {
                      // When product number changes, update other fields
                      if (event.column.field == 'order') {
                        _populateRowData(event.value.toString(), event.rowIdx);
                      }
                    });
                  },
                  onLoaded: (PlutoGridOnLoadedEvent event) {
                    stateManager = event.stateManager; // Save the state manager
                  },
                  configuration: const PlutoGridConfiguration(
                    scrollbar: PlutoGridScrollbarConfig(
                      scrollBarColor: Color(0xFF319626),
                      isAlwaysShown: true,
                      scrollbarThickness: 8,
                      scrollbarThicknessWhileDragging: 10,
                    ),
                    style: PlutoGridStyleConfig(
                      gridBorderColor: Colors.transparent,
                      gridBorderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      cellTextStyle: TextStyle(
                        color: Color(0xFF474747),
                        fontWeight: FontWeight.w300,
                        fontFamily: 'ReadexPro',
                        fontSize: 12,
                      ),
                      oddRowColor: Colors.white,
                      evenRowColor: Color(0xFFF9F9F9),
                      columnTextStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'ReadexPro',
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void _showExportDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => ExportFileDialog(),
    );
  }

  void _showExportDialog2() {
    showDialog(
      context: context,
      builder: (BuildContext context) => const DocumentUploadPage(),
    );
  }
}

Widget _buildDropdownItem(String text) {
  return Container(
    height: 40,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 16, color: Color(0xFF474747)),
        ),
        const SizedBox(
          height: 15,
        ), // المسافة بين النص والخط
        Container(
          height: 0.2, // ارتفاع الخط
          color: Colors.grey, // لون الخط
        ),
      ],
    ),
  );
}
