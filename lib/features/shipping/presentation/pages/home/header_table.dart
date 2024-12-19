import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shipping/core/utils/responsive.dart';
import 'package:shipping/features/shipping/presentation/pages/shipping%20information/shipping_dashboard_page.dart';
import 'package:shipping/features/shipping/presentation/pages/home/export_file_dialog.dart';

class HeaderTableOrders extends StatefulWidget {
  @override
  _HeaderTableOrdersState createState() => _HeaderTableOrdersState();
}

class _HeaderTableOrdersState extends State<HeaderTableOrders> {
  bool currentYearFilter = false;
  bool approvedFilter = false;
  bool unapprovedFilter = false;

  static const Color filterButtonColor = Color(0xfff9f9f9);
  static const Color trashColor = Color(0xffdc292f);
  static const Color exportColor = Color(0xFF319626);
  static const Color copyColor = Color(0XFF0084d8);
  static const Color printColor = Color(0XFF0c69c0);
  static const Color searchColor = Color(0XFFb7babf);

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      mobileLayout: _buildMobileLayout(),
      tabletLayout: _buildTabletLayout(),
      desktopLayout: _buildDesktopLayout(),
    );
  }

  Widget _buildMobileLayout() {
    return _buildHeaderRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildFilterButton(),
        _verticalDivider(),
        _navigationButton(FontAwesomeIcons.chevronLeft),
        _iconButtonWidget(FontAwesomeIcons.trash, trashColor, onPressed: () {}),
        _iconButtonWidget(FontAwesomeIcons.fileExport, exportColor,
            onPressed: _showExportDialog),
        _iconButtonWidget(FontAwesomeIcons.solidCopy, copyColor,
            onPressed: () {}),
        _iconButtonWidget(FontAwesomeIcons.print, printColor, onPressed: () {}),
        _buildAddButton(),
        const Spacer(),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return _buildHeaderRow(children: [
      _buildFilterButton(),
      _iconButtonWidget(FontAwesomeIcons.trash, trashColor, onPressed: () {}),
      _iconButtonWidget(FontAwesomeIcons.fileExport, exportColor,
          onPressed: _showExportDialog),
      _iconButtonWidget(FontAwesomeIcons.solidCopy, copyColor,
          onPressed: () {}),
      _iconButtonWidget(FontAwesomeIcons.print, printColor, onPressed: () {}),
      _buildAddButton(),
      const Spacer(),
      _buildSearchField(),
    ]);
  }

  Widget _buildDesktopLayout() {
    return _buildHeaderRow(children: [
      _iconButtonWidget(FontAwesomeIcons.trash, trashColor, onPressed: () {}),
      _iconButtonWidget(FontAwesomeIcons.fileExport, exportColor,
          onPressed: _showExportDialog),
      _iconButtonWidget(FontAwesomeIcons.solidCopy, copyColor,
          onPressed: () {}),
      _iconButtonWidget(FontAwesomeIcons.print, printColor, onPressed: () {}),
      _buildAddButton(),
      const Spacer(),
      _buildCheckboxFilters(),
      _buildSearchField(),
    ]);
  }

  Widget _buildFilterButton() {
    return _buildIconContainer(PopupMenuButton(
      surfaceTintColor: Colors.white,
      offset: const Offset(0, 35),
      itemBuilder: (context) => [
        _buildPopMenutItem('السنة الحالية', currentYearFilter, (newValue) {
          setState(() {
            currentYearFilter = newValue!;
          });
        }),
        _buildPopMenutItem('غير موقوف فقط', approvedFilter, (newValue) {
          setState(() {
            approvedFilter = newValue!;
          });
        }),
        _buildPopMenutItem('غير ملغي فقط', unapprovedFilter, (newValue) {
          setState(() {
            unapprovedFilter = newValue!;
          });
        }),
      ],
      child: const Icon(
        FontAwesomeIcons.filter,
        color: Color(0xff0c69c0),
        size: 15,
      ),
    ));
  }

  Widget _buildIconContainer(Widget iconButton,
      {Color containarColor = filterButtonColor}) {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34), color: containarColor),
      child: Center(child: iconButton),
    );
  }

  PopupMenuEntry<bool> _buildPopMenutItem(
      String title, bool value, ValueChanged<bool?> onChanged) {
    return PopupMenuItem<bool>(
      enabled: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title),
          Checkbox(value: value, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return _buildIconContainer(
      IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashboardPage()));
        },
        icon: const Icon(FontAwesomeIcons.plus,
            color: Color(0xff319626), size: 20),
        padding: EdgeInsets.zero,
      ),
      containarColor: const Color(0xfff1fef0),
    );
  }

  Widget _buildCheckboxFilters() {
    return Row(
      children: [
        _buildCheckbox('السنة الحالية', currentYearFilter, (newValue) {
          setState(() {
            currentYearFilter = newValue!;
          });
        }),
        _buildCheckbox('غير موقوف فقط', approvedFilter, (newValue) {
          setState(() {
            approvedFilter = newValue!;
          });
        }),
        _buildCheckbox('غير ملغي فقط', unapprovedFilter, (newValue) {
          setState(() {
            unapprovedFilter = newValue!;
          });
        }),
      ],
    );
  }

  Widget _buildCheckbox(
    String label,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return Row(
      children: [
        Text(label),
        Theme(
            data: Theme.of(context).copyWith(
                checkboxTheme: CheckboxThemeData(
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2)),
                    side: const BorderSide(
                      color: Color(0xffe2e2e2),
                      width: 5,
                    ))),
            child: Transform.scale(
                scale: 0.8,
                child: Checkbox(value: value, onChanged: onChanged))),
      ],
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: 254,
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffd6d6d6)),
              ),
              prefixIcon: Transform.rotate(
                angle: 1.5,
                child: const Icon(Icons.search, size: 20),
              ),
              hintText: 'بحث عن',
              helperStyle: const TextStyle(
                color: Color(0xff819aa7),
                fontSize: 12,
                fontFamily: 'ReadexPro',
                fontWeight: FontWeight.w300,
              ),
              hintTextDirection: TextDirection.rtl),
        ),
      ),
    );
  }

  Widget _iconButtonWidget(
    IconData icon,
    Color color, {
    VoidCallback? onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 30,
        width: 30,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          color: filterButtonColor,
        ),
        child: Center(
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: color, size: 14),
          ),
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return IconButton(
      onPressed: () {},
      icon: Icon(Icons.search, color: Colors.lightBlue[900], size: 20),
    );
  }

  void _showExportDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => ExportFileDialog(),
    );
  }

  Widget _navigationButton(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: IconButton(
        onPressed: () {},
        icon: Text('|'),
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _buildHeaderRow({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    required List<Widget> children,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );
  }
}
