import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipping/core/cubit/cubit.dart';
import 'package:shipping/core/cubit/state.dart';
import 'package:shipping/core/utils/mobile_text_field.dart';
import 'package:shipping/core/utils/responsive.dart';
import 'package:shipping/features/shipping/presentation/pages/archiving%20information/pluto_grid.dart';

void main() {
  runApp(Inputformscreen());
}

class Inputformscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArchivingCubit, ArchivingState>(
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
                    buildTextField("الوصف"),
                    buildDropdownField("هيكل الارشفة *"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("شرح المحتويات"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        child: MobileTextFieldWidget(
                            lable: 'رقم الشاشة ', enabled: true)),
                    Flexible(
                        child: MobileTextFieldWidget(
                            lable: 'رقم الارشفة ', enabled: true)),
                    Flexible(
                      child: MobileTextFieldWidget(
                          lable: 'قاعدة البيانات ', enabled: true),
                    ),
                    Flexible(
                      child: MobileTextFieldWidget(
                          lable: 'رقم النظام الخارجي ', enabled: true),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: const PlutoGridWidget(),
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
                    buildTextField("هيكل الارشفة *"),
                    buildDropdownField("الوصف"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildTextField("شرح المحتويات"),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        child: MobileTextFieldWidget(
                            lable: 'رقم الشاشة ', enabled: true)),
                    Flexible(
                        child: MobileTextFieldWidget(
                            lable: 'رقم الارشفة ', enabled: true)),
                    Flexible(
                      child: MobileTextFieldWidget(
                          lable: 'قاعدة البيانات ', enabled: true),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: MobileTextFieldWidget(
                          lable: 'رقم النظام الخارجي ', enabled: true),
                    ),
                  ],
                ),

                // Additional Sections

                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: const PlutoGridWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
        mobileLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildTextField("هيكل الارشفة *"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildDropdownField("الوصف"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buildTextField("شرح المحتويات"),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                            child: MobileTextFieldWidget(
                                lable: 'رقم الشاشة ', enabled: true)),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                            child: MobileTextFieldWidget(
                                lable: 'رقم الارشفة ', enabled: true)),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: MobileTextFieldWidget(
                              lable: 'قاعدة البيانات ', enabled: true),
                        ),
                      ]),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: MobileTextFieldWidget(
                              lable: 'رقم النظام الخارجي ', enabled: true),
                        ),
                      ]),

                  // Additional Sections

                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: const PlutoGridWidget(),
                    ),
                  ),
                ],
              ),
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
        const SizedBox(width: 8),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
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
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: TextField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffd6d6d6)),
            ),
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xff819AA7),
            ),
          ),
        ),
      ),
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
          const DropdownMenuItem(
            value: "Option1",
            child: Text("Option 1"),
          ),
          const DropdownMenuItem(
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
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffd6d6d6))),
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 14,
              color: Color(0xff819AA7),
            ),
            suffixIcon: const Icon(
              Icons.calendar_month,
              color: Color(0xff819AA7),
            ),
            border: const UnderlineInputBorder(),
          ),
          keyboardType: TextInputType.datetime,
        ),
      ),
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
          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffd6d6d6)),
            ),
            contentPadding: EdgeInsets.symmetric(
                vertical: 5, horizontal: 5), // تعديل الحشو هنا
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down),
            iconSize: 24,
            iconEnabledColor: Color(0xff819AA7),
          ),
          dropdownStyleData: const DropdownStyleData(
            padding: EdgeInsets.zero,
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 5), // تقليل حشو العناصر
          ),
          hint: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff819AA7),
            ),
          ),
          items: [
            const DropdownMenuItem(
              value: "1",
              child: Text("Option 1"),
            ),
            const DropdownMenuItem(
              value: "2",
              child: Text("Option 2"),
            ),
          ],
          onChanged: (value) {},
        ),
      ),
    ),
  );
}
