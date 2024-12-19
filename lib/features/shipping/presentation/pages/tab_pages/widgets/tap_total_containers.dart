//بيانات اخرى
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shipping/features/shipping/presentation/pages/shipping%20information/List_butter.dart';
import 'package:shipping/features/shipping/presentation/pages/shipping%20information/inputFormScreen%20.dart';
import 'package:shipping/features/shipping/presentation/pages/tab_pages/widgets/tap_table_total_containers.dart';

class TapTotalContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              SizedBox(
                width: 45,
              ),
              buildTextField(
                "عدد الواحات",
              ),
            ]),
            TableWidget(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildCheckInputField(String label, String amountLabel,
      {bool checkbox = false}) {
    return Expanded(
      child: Row(
        children: [
          if (checkbox)
            Checkbox(
              value: false,
              onChanged: (value) {},
            ),
          Text(label),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffd6d6d6))),
                labelText: amountLabel,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String label, {bool isLocked = false}) {
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd6d6d6))),
                  labelText: label,
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xff819AA7),
                  )),
            )),
      ),
    );
  }

  Widget buildDropdownMenu(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Expanded(
        child: DropdownButton<String>(
          hint: Text(title),
          items: [
            DropdownMenuItem(
              value: "Option1",
              child: Text("Option 1"),
            ),
            DropdownMenuItem(
              value: "Option2",
              child: Text("Option 2"),
            ),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget buildDateField(String label) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffd6d6d6))),
              labelText: label,
              labelStyle: TextStyle(
                fontSize: 14,
                color: Color(0xff819AA7),
              ),
              suffixIcon: Icon(
                Icons.calendar_month,
                color: Color(0xff819AA7),
              ),
              border: UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.datetime,
          ),
        ),
      ),
    );
  }
}

Widget buildDropdownField(String label) {
  return Expanded(
    child: Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: DropdownButtonFormField2<String>(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffd6d6d6))),
              contentPadding: EdgeInsets.all(0)),
          iconStyleData: IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            iconEnabledColor: Color(0xff819AA7),
          ),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.zero,
          ),
          menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.zero),
          hint: Text(
            textAlign: TextAlign.left,
            label,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff819AA7),
            ),
          ),
          items: [
            DropdownMenuItem(
              child: Text("Option 1"),
              value: "1",
            ),
            DropdownMenuItem(
              child: Text("Option 2"),
              value: "2",
            ),
          ],
          onChanged: (value) {},
        ),
      ),
    ),
  );
}
