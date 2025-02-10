import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shipping/features/shipping/presentation/pages/archiving%20information/archiving_dashboard_page.dart';

class CustomGrid extends StatefulWidget {
  const CustomGrid({super.key});

  @override
  State<CustomGrid> createState() => CustomGridState();
}

class CustomGridState extends State<CustomGrid> {
  late List<PlutoRow> rows;
  late List<PlutoColumn> columns;

  @override
  void initState() {
    super.initState();
    columns = <PlutoColumn>[
      PlutoColumn(
          title: 'رقم الوثيقة',
          field: 'Document_number',
          type: PlutoColumnType.text(),
          textAlign: PlutoColumnTextAlign.center,
          titleTextAlign: PlutoColumnTextAlign.center,
          backgroundColor: const Color(0xFF0C69C0),
          enableRowChecked: true,
          renderer: (rendererContext) {
            return TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DashboardPage();
                }));
              },
              child: Text(
                rendererContext.row.cells['Document_number']!.value.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'ReadexPro',
                    fontSize: 12,
                    color: const Color(0xFF00B4D8),
                    decoration: TextDecoration.underline),
              ),
            );
          }),
      PlutoColumn(
        title: 'تاريخ الوثيقة',
        field: 'Document_history',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'نوع الوثيقة الفرعي',
        field: 'Type',
        type: PlutoColumnType.number(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'اسم المخزن',
        field: 'store_name',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'اسم المورد',
        field: 'supplier_name',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'العملة',
        field: 'Currency',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'رقم المرجع  ',
        field: 'reference_nubmer',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'رقم فاتورة المورد',
        field: 'supplier_invoice_number',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'تاريخ فاتورة المورد',
        field: 'supplier_invoice_date',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'رقم بوليصة الشحن',
        field: 'shipping_policy_number',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'رقم المرجع',
        field: 'reference_number2',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'البيان',
        field: 'statement',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'الوحدة المالية',
        field: 'financial_unit',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
      PlutoColumn(
        title: 'صافي المبلغ',
        field: 'net_amount',
        type: PlutoColumnType.text(),
        textAlign: PlutoColumnTextAlign.center,
        titleTextAlign: PlutoColumnTextAlign.center,
        backgroundColor: const Color(0xFF0C69C0),
      ),
    ];

    rows = [
      PlutoRow(
        cells: {
          'Document_number': PlutoCell(value: '600014-98'),
          'Document_history': PlutoCell(value: '14ياناير 2024'),
          'Type': PlutoCell(value: 'نوع الوثيقة الفرعية'),
          'store_name': PlutoCell(value: '34 - اسم المخزن'),
          'supplier_name': PlutoCell(value: '60001- شركة الاتحاد'),
          'Currency': PlutoCell(value: 'EGP'),
          'reference_nubmer': PlutoCell(value: '_'),
          'supplier_invoice_number': PlutoCell(value: '-'),
          'supplier_invoice_date': PlutoCell(value: '-'),
          'shipping_policy_number': PlutoCell(value: '-'),
          'reference_number2': PlutoCell(value: '-'),
          'statement': PlutoCell(value: '-'),
          'financial_unit': PlutoCell(value: '301 - فرع الدمام'),
          'net_amount': PlutoCell(value: ('222223')),
        },
      ),
      PlutoRow(
        cells: {
          'Document_number': PlutoCell(value: '600014-20'),
          'Document_history': PlutoCell(value: '14ياناير 2024'),
          'Type': PlutoCell(value: 'نوع الوثيقة الفرعية'),
          'store_name': PlutoCell(value: '34 - اسم المخزن'),
          'supplier_name': PlutoCell(value: '60001- شركة الاتحاد'),
          'Currency': PlutoCell(value: 'EGP'),
          'reference_nubmer': PlutoCell(value: '_'),
          'supplier_invoice_number': PlutoCell(value: '-'),
          'supplier_invoice_date': PlutoCell(value: '-'),
          'shipping_policy_number': PlutoCell(value: '-'),
          'reference_number2': PlutoCell(value: '-'),
          'statement': PlutoCell(value: '-'),
          'financial_unit': PlutoCell(value: '301 - فرع الدمام'),
          'net_amount': PlutoCell(value: (242)),
        },
      ),
      PlutoRow(
        cells: {
          'Document_number': PlutoCell(value: '240014-222'),
          'Document_history': PlutoCell(value: '14ياناير 2024'),
          'Type': PlutoCell(value: 'نوع الوثيقة الفرعية'),
          'store_name': PlutoCell(value: '34 - اسم المخزن'),
          'supplier_name': PlutoCell(value: '60001- شركة الاتحاد'),
          'Currency': PlutoCell(value: 'EGP'),
          'reference_nubmer': PlutoCell(value: '_'),
          'supplier_invoice_number': PlutoCell(value: '-'),
          'supplier_invoice_date': PlutoCell(value: '-'),
          'shipping_policy_number': PlutoCell(value: '-'),
          'reference_number2': PlutoCell(value: '-'),
          'statement': PlutoCell(value: '-'),
          'financial_unit': PlutoCell(value: '301 - فرع الدمام'),
          'net_amount': PlutoCell(value: ('53')),
        },
      ),
    ];
  }

  PlutoGridStateManager? stateManager;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: PlutoGrid(
        columns: columns,
        rows: rows,
        onLoaded: (event) {
          stateManager = event.stateManager;
          stateManager?.setShowColumnFilter(false);
        },
        onChanged: (event) {
          print(event);
        },
        configuration: const PlutoGridConfiguration(
            style: PlutoGridStyleConfig(
                gridBorderColor: Colors.transparent,
                cellTextStyle: TextStyle(fontSize: 12),
                oddRowColor: Colors.white,
                evenRowColor: Color(0xffF9F9F9),
                columnTextStyle: TextStyle(color: Colors.white))),
      ),
    );
  }
}

Widget _createPaymentChip(String method) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0),
    child: Chip(
      backgroundColor: const Color(0xffEBF9FF),
      labelStyle: const TextStyle(
          color: Color(0xff00B4D8), fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: Color(0xffD2ECFC))),
      label: Text(
        method,
        style: const TextStyle(fontSize: 10),
      ),
    ),
  );
}
