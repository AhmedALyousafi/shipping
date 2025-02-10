import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shipping/core/utils/responsive.dart';

class PaginationExample extends StatelessWidget {
  const PaginationExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AdaptiveLayout(
          desktopLayout: Row(
            mainAxisAlignment: MainAxisAlignment.center,   
            children: [
              _buildItemsPerPageDropdown(),
              SizedBox(width: 16),
              Text('عدد العناصر في الصفحة'),
              Spacer(),
              _buildPaginationControls(context),
            ],
          ),
          tabletLayout: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildItemsPerPageDropdown(),
              SizedBox(width: 16),
              Text('عدد العناصر في الصفحة'),
              Spacer(),
              _buildPaginationControls(context),
            ],
          ),
          mobileLayout: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildItemsPerPageDropdown(),
              SizedBox(width: 16),
              Spacer(),
              _buildPaginationControls(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemsPerPageDropdown() {
    return SizedBox(
      height: 30,
      width: 85,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField2<String>(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3), // تحديد زاوية الحدود
              borderSide: BorderSide(
                  color: Color(0xff0C69C0), width: 1), // لون وسماكة الحدود
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(
                  color: Colors.grey, width: 1), // الحدود عند تفعيلها
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(
                  color: Color(0xff0C69C0), width: 2), // الحدود عند التركيز
            ),
          ),
          value: '15',
          items: [
            DropdownMenuItem(value: '10', child: Text('10')),
            DropdownMenuItem(value: '15', child: Text('15')),
            DropdownMenuItem(value: '20', child: Text('20')),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }

  Widget _buildPaginationControls(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width > 750;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            Icons.keyboard_double_arrow_left,
            color: Color(0xff819AA7),
          ),
          Icon(
            Icons.chevron_left,
            color: Color(0xff819AA7),
          ),
          SizedBox(width: 10),
          _buildPageNumber(context, '25'),
          SizedBox(width: 10),
          Text('...'),
          SizedBox(width: 10),
          _buildPageNumber(context, '5'),
          SizedBox(width: 10),
          _buildPageNumber(context, '4'),
          SizedBox(width: 10),
          _buildPageNumber(context, '3'),
          SizedBox(width: 10),
          _buildPageNumber(context, '2'),
          SizedBox(width: 10),
          _buildPageNumber(context, '1', isSelected: true),
          Icon(
            Icons.chevron_right,
            color: Color(0xff819AA7),
          ),
          Icon(
            Icons.keyboard_double_arrow_right,
            color: Color(0xff819AA7),
          ),
        ],
      ),
    );
  }

  Widget _buildPageNumber(BuildContext context, String number,
      {bool isSelected = false}) {
    // Determine the screen size

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xff0C69C0) : Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Text(
        number,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xff819AA7),
        ),
      ),
    );
  }
}
