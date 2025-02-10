import 'package:flutter/material.dart';

class MobileTextFieldWidget extends StatelessWidget {
  const MobileTextFieldWidget({
    super.key,
    required this.lable,
    this.controller,
    this.enabled = true,
    this.fillColor = Colors.white,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.textStyle,
    this.borderColor = const Color(0xFFD6D6D6),
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
  });

  final String lable;
  final TextEditingController? controller;
  final bool enabled;
  final Color fillColor;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final Color borderColor;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      margin: const EdgeInsets.symmetric(horizontal: 0.0),
      color: Colors.white,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          textAlign: textAlign,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffF9F9F9),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
            ),
            labelText: lable,
            labelStyle: textStyle ??
                const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF819AA7),
                  fontFamily: 'ReadexPro',
                  fontWeight: FontWeight.w300,
                ),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 10), // تعديل الحشو هنا
          ),
        ),
      ),
    );
  }
}
