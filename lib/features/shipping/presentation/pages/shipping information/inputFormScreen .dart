import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping/core/cubit/cubit.dart';
import 'package:shipping/core/cubit/state.dart';
import 'package:shipping/core/utils/responsive.dart';
import 'package:shipping/features/shipping/presentation/pages/shipping%20information/pluto_grid.dart';

void main() {
  runApp(Inputformscreen());
}

class Inputformscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerOrdersCubit, CustomerOrdersState>(
        builder: (context, state) {
      return AdaptiveLayout(
        desktopLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDateField(
                      "تاريخ الوثيقة *",
                    ),
                    buildTextField("رقم الوثيقة *"),
                    buildDropdownField("نوع الوثيقة الفرعي *"),
                    buildDropdownField("الوحدة المالية *"),
                    buildTextField("السنة *"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField(
                      "رقم بوصلة الشحن*",
                    ),
                    buildTextField("سعر التحويل  *"),
                    buildDropdownField("العملة*"),
                    buildDropdownField("رقم المورد*"),
                    buildDropdownField("رقم أمر الشراء *"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDateField(
                      "تاريخ فاتورة المورد *",
                    ),
                    buildTextField("رقم فاتورة المورد *"),
                    buildDropdownField("رقم المخزن*"),
                    buildDropdownField("طريقة الشحن *"),
                    buildDateField("تاريخ الشحن*"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("البيان"),
                    buildTextField("نوع الشحن"),
                    buildTextField("نوع البوصلة"),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'الاستلام جزئي',
                      style: TextStyle(fontSize: 12, color: Color(0xFF474747)),
                    ),
                    const SizedBox(width: 8),
                    Checkbox(value: false, onChanged: (value) {}),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),

                // Additional Sections
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200],
                    ),
                    child: buildExpansionTile("بيانات اخرى")),
                SizedBox(
                  height: 20,
                ),

                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200],
                    ),
                    child: buildExpansionTile2("الأصناف")),
                SizedBox(
                  height: 20,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: CustomGrid1(),
                  ),
                ),
              ],
            ),
          ),
        ),
        tabletLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDateField(
                      "تاريخ الوثيقة *",
                    ),
                    buildTextField("رقم الوثيقة *"),
                    buildDropdownField("نوع الوثيقة الفرعي *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("الوحدة المالية *"),
                    buildTextField("السنة *"),
                    buildTextField("سعر التحويل"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("العملة*"),
                    buildTextField("رقم العميل *"),
                    buildDropdownField("رقم المخزن *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("التاريخ اليدوي*"),
                    if (state.cash) buildDropdownField("رقم الصندوق *"),
                    if (state.bank) buildDropdownField('رقم الحساب *'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("البيان *", isLocked: true),
                    buildDropdownField("تصنيف الضريبة*"),
                    buildDateField(" تاريخ الاستحقاق *"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                // Additional Sections
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200],
                    ),
                    child: buildExpansionTile("بيانات اخرى")),
                SizedBox(
                  height: 20,
                ),

                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200],
                    ),
                    child: buildExpansionTile2("الأصناف")),
                SizedBox(
                  height: 20,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: CustomGrid1(),
                  ),
                ),
              ],
            ),
          ),
        ),
        mobileLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDateField(
                      "تاريخ الوثيقة *",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("نوع الوثيقة الفرعي *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("الوحدة المالية *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("السنة *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("سعر التحويل"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("العملة*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("رقم العميل *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("رقم المخزن *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("التاريخ اليدوي*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (state.cash) buildDropdownField("رقم الصندوق *"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (state.bank) buildDropdownField('رقم الحساب *'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("البيان *", isLocked: true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDropdownField("تصنيف الضريبة*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildDateField(" تاريخ الاستحقاق *"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                // Additional Sections
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200],
                    ),
                    child: buildExpansionTile("بيانات اخري")),
                SizedBox(
                  height: 20,
                ),

                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey[200],
                    ),
                    child: buildExpansionTile2("الأصناف")),
                SizedBox(
                  height: 20,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: CustomGrid1(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
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

Widget buildExpansionTile(String title) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title),
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                buildTextField('رقم المرجع'),
                buildTextField('الرقم اليدوي '),
                buildTextField('عدد المرفقات'),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildExpansionTile2(String title) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: Text(title),
        children: [
          Container(
            color: Colors.white,
            child: SizedBox(
              height: 136,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        buildDropdownField('اسم المنتج*'),
                        SizedBox(
                          height: 20,
                          width: 1000,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text('اجمالي الاصناف المضافة(0)'),
                      ],
                    ),
                    SizedBox(height: 16),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        children: [
                          _buildExecuteButton(),
                          _buildExecuteButton2(),
                          SizedBox(width: 900),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildTableHeader(String title) {
  return Expanded(
    child: Text(
      title,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      textAlign: TextAlign.end,
    ),
  );
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

Widget _buildExecuteButton() {
  return Row(
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.add,
            size: 20,
          ),
          label: Text('اضافة منتج'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
    ],
  );
}

Widget _buildExecuteButton2() {
  return Row(
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.refresh_outlined,
            size: 20,
          ),
          label: Text('مسح البيانات'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
