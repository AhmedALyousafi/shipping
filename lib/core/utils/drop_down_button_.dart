import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDownButtonWidget extends StatefulWidget {
  const DropDownButtonWidget({
    super.key,
    required this.items,
    required this.label,
    this.isEnabled = true,
    this.fillColor = Colors.white,
  });

  final List<String> items;
  final String label;
  final bool isEnabled;
  final Color fillColor;

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  String? selectedValue;

  void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width < 750 ? 15.0 : 6.0,
          right: MediaQuery.of(context).size.width < 750 ? 15 : 10,
        ),
        child: DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xFFD6D6D6),
              ),
            ),
            filled: true,
            fillColor: widget.fillColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          ),
          hint: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF819AA7),
              fontFamily: 'ReadexPro',
              fontWeight: FontWeight.w300,
            ),
          ),
          items: widget.items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFD6D6D6),
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontFamily: 'ReadexPro',
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF474747),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select gender.';
            }
            return null;
          },
          onChanged: (value) {},
          onSaved: (value) {
            selectedValue = value.toString();
          },
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: const DropdownStyleData(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          ),
          selectedItemBuilder: (BuildContext context) {
            return widget.items
                .map((item) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontFamily: 'ReadexPro',
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF474747),
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList();
          },
        ),
      ),
    );
  }
}
