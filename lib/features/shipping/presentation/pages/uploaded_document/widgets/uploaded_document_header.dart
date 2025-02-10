import 'package:flutter/material.dart';

class DocumentHeader extends StatelessWidget {
  final VoidCallback onClose;

  const DocumentHeader({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onClose,
                  borderRadius: BorderRadius.circular(47),
                  child: Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(47),
                      color: const Color(0xFFF2F2F2),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: Color(0xFF819AA7),
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'صورة مرفقة',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF474747),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
