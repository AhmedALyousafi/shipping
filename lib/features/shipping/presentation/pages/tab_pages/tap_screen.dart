import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shipping/features/shipping/presentation/pages/archiving%20information/inputFormScreen%20.dart';

class TapScreen extends StatelessWidget {
  const TapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Inputformscreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
