import 'package:flutter/material.dart';
import 'package:shipping/core/utils/responsive.dart';
import 'package:shipping/features/shipping/presentation/pages/home/cont.dart';
import 'package:shipping/features/shipping/presentation/pages/home/header_table.dart';
import 'package:shipping/features/shipping/presentation/pages/home/archiving_breadcrumb.dart';
import 'package:shipping/features/shipping/presentation/pages/home/archiving_appbar.dart';
import 'package:shipping/features/shipping/presentation/pages/home/archiving_grid.dart';

class CustomeRequest extends StatelessWidget {
  const CustomeRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F9FF),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/onix_logo.png',
                      height: 100,
                      width: 130,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Text(
                'القائمة الرئيسية',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              _createDrawerItem(Icons.account_balance, 'نظام إدارة الحسابات'),
              _createDrawerItem(Icons.bar_chart, 'نظام إدارة الخطط والموازنة'),
              _createDrawerItem(
                  Icons.account_balance_wallet, 'نظام إدارة الأصول'),
              _createDrawerItem(Icons.storage, 'نظام إدارة المخازن'),
              _createDrawerItem(Icons.people, 'نظام إدارة رأس المال البشري'),
              _createDrawerItem(Icons.local_shipping, 'نظام إدارة اللوجستية'),
              _createDrawerItem(
                  Icons.shopping_cart, 'نظام إدارة الموردين والمشتريات'),
              _createDrawerItem(
                  Icons.attach_money, 'نظام إدارة العملاء والمبيعات'),
              _createDrawerItem(Icons.store, 'نظام إدارة نقاط البيع'),
              _createDrawerItem(Icons.campaign, 'نظام إدارة المواد التسويقية'),
              _createDrawerItem(Icons.business_center, 'نظام إدارة المشاريع'),
              _createDrawerItem(Icons.location_city, 'نظام إدارة العقارات'),
              _createDrawerItem(
                  Icons.airplanemode_active, 'نظام إدارة الحج والعمرة'),
              _createDrawerItem(Icons.transform, 'نظام إدارة المحولات'),
              _createDrawerItem(Icons.local_hospital, 'نظام إدارة المستشفيات'),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Shippingappbar(),
            Padding(
              padding: ResponsiveUtils.getPagePadding(context),
              child: const ShippingBreadcrumb(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    HeaderTableOrders(),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.28,
                        child: CustomGrid(),
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    PaginationExample(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ListTile _createDrawerItem(IconData icon, String text) {
  return ListTile(
    title: Text(
      text,
      style: const TextStyle(fontSize: 16),
    ),
    leading: Icon(icon, color: Colors.blue),
    onTap: () {
      // Add navigation logic here if necessary
    },
  );
}

Widget _buildCheckbox(String label, BuildContext context) {
  return Row(
    children: [
      Text(label),
      Theme(
          data: Theme.of(context).copyWith(
            checkboxTheme: CheckboxThemeData(
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              side: const BorderSide(color: Color(0xffe2e2e2), width: 0.5),
            ),
          ),
          child: Checkbox(value: false, onChanged: (bool? value) {})),
    ],
  );
}

Widget build(BuildContext context) {
  var isCollapsed;
  return Container(
    child: Text(isCollapsed ? 'Collapsed' : 'Expanded'),
  );
}
