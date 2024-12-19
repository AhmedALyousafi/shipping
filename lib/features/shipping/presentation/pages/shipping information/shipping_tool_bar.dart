import 'package:flutter/material.dart';

class SummaryPanel extends StatefulWidget {
  const SummaryPanel({super.key, this.isCollapsed = true});
  final bool isCollapsed;

  @override
  State<SummaryPanel> createState() => _SummaryPanelState();
}

class _SummaryPanelState extends State<SummaryPanel> {
  bool isSummaryCollapsed = true;
  bool showSummary = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomAppBar(
        height: showSummary ? 160 : 61,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      showSummary = !showSummary;
                    });
                  },
                  icon: Icon(
                    showSummary ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  label: Text(
                    showSummary ? 'إخفاء الإجمالي' : 'إظهار الإجمالي',
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'ReadexPro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    minimumSize: const Size(0, 45),
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3.0),
                      topRight: Radius.circular(3.0),
                    )),
                    backgroundColor: const Color(0xFF319626),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 3,
              color: Color(0xFF319626),
              height: 0,
            ),
            if (showSummary)
              Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          _buildSummaryCard(
                              ' الخصم', Icons.location_on, '0.00'),
                          _buildSummaryCard('الخصم', Icons.location_on, '0.00'),
                          _buildSummaryCard('خصم الأصناف', Icons.lock, '0.00'),
                          _buildSummaryCard(
                              ' اجمالي السعر', Icons.local_offer, '0.00'),
                        ],
                      ),
                      Row(
                        children: [
                          _buildSummaryCard(
                              'اجمالي الكمية', Icons.location_on, '0.00'),
                          _buildSummaryCard(
                              'إجمالي الخصم', Icons.location_on, '0.00'),
                          _buildSummaryCard('صافي المبلغ', Icons.lock, '0.00'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(String label, IconData icon, String value,
      {Color color = Colors.blue}) {
    return SizedBox(
      width:
          widget.isCollapsed ? 300 : 0, // Adjust the width based on isCollapsed
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(
                    color: Color(0xFF474747),
                    fontFamily: 'ReadexPro',
                    fontWeight: FontWeight.w400,
                    fontSize: 12),
              ),
              const Spacer(),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Usage example
