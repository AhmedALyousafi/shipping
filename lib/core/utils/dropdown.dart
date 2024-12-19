import 'package:flutter/material.dart';
import 'package:shipping/core/models/newitemmodel.dart';

class PupupMenuButton extends StatefulWidget {
  const PupupMenuButton({super.key, required this.title, required this.item});

  final String title;
  final List<MenuItemModel> item;

  @override
  State<PupupMenuButton> createState() => _PupupMenuButtonState();
}

class _PupupMenuButtonState extends State<PupupMenuButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: PopupMenuButton(
        surfaceTintColor: Colors.grey,
        tooltip: '',
        offset: const Offset(0, 30),
        itemBuilder: (context) => widget.item
            .map((item) => PopupMenuItem<MenuItemModel>(
                  height: BorderSide.strokeAlignCenter,
                  value: item,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton(
                      onPressed: () {
                        item.onPressed();
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            item.icon,
                            color: item.iconColor,
                            size: 13,
                          ),
                          const SizedBox(width: 30),
                          Text(
                            item.text,
                            style: const TextStyle(
                              color: Color(0xFF474747),
                              fontSize: 11.59,
                              fontFamily: 'ReadexPro',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
        child: Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          color: isHovered ? const Color(0xff0C69C0) : Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  color: isHovered ? Colors.white : const Color(0xFF474747),
                  fontSize: 11.59,
                  fontFamily: 'ReadexPro',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: isHovered ? Colors.white : const Color(0xFF0C69C0),
                size: 20,
              ),
              const SizedBox(
                width: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
