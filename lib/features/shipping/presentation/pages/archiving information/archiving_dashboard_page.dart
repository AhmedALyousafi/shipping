import 'package:flutter/material.dart';
import 'package:shipping/features/shipping/presentation/pages/archiving%20information/archiving_main_menu.dart';
import 'package:shipping/features/shipping/presentation/pages/home/archiving_appbar.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F9FF),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Expanded(
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
                      // Image.asset(
                      //   // 'assets/images/onix_logo.png',
                      //   height: 100,
                      //   width: 130,
                      // ),
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
                _createDrawerItem(
                    Icons.bar_chart, 'نظام إدارة الخطط والموازنة'),
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
                _createDrawerItem(
                    Icons.campaign, 'نظام إدارة المواد التسويقية'),
                _createDrawerItem(Icons.business_center, 'نظام إدارة المشاريع'),
                _createDrawerItem(Icons.location_city, 'نظام إدارة العقارات'),
                _createDrawerItem(
                    Icons.airplanemode_active, 'نظام إدارة الحج والعمرة'),
                _createDrawerItem(Icons.transform, 'نظام إدارة المحولات'),
                _createDrawerItem(
                    Icons.local_hospital, 'نظام إدارة المستشفيات'),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Shippingappbar(),
            Mainmenu(),
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
