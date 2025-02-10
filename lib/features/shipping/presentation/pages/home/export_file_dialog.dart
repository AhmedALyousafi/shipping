import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

ListTile _createDrawerItem(IconData icon, String text) {
  return ListTile(
    title: Text(
      text,
      style: const TextStyle(fontSize: 16),
    ),
    leading: Icon(icon, color: Colors.blue),
    onTap: () {
      // Add navigation logic here if necessary
    },
  );
}

class ExportFileDialog extends StatefulWidget {
  @override
  _ExportFileDialogState createState() => _ExportFileDialogState();
}

class _ExportFileDialogState extends State<ExportFileDialog> {
  String? selectedFormat;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(16),
        titlePadding: EdgeInsets.only(top: 16, right: 16, left: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        content: SizedBox(
          width: 603.53,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: DropdownButtonFormField2<String>(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  iconStyleData: IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 24,
                  ),
                  hint: Text("*صيغة الملف"),
                  items: [
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
                          Text("استخدام الماسح الضوئي",
                              textAlign: TextAlign.right),
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
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (selectedFormat != null) {
                    Navigator.pop(context, selectedFormat);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("يرجى اختيار رفع المرفقات")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Row(
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
            Text("رفع المرفقات", style: TextStyle(fontSize: 20)),
            IconButton(
              icon: Icon(Icons.close),
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

Widget build(BuildContext context) {
  var isCollapsed;
  return Container(
    child: Text(isCollapsed ? 'Collapsed' : 'Expanded'),
  );
}
