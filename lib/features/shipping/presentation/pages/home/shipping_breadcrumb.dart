import 'package:flutter/material.dart';
import 'package:shipping/core/utils/responsive.dart';

class ShippingBreadcrumb extends StatelessWidget {
  const ShippingBreadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF819AA7).withOpacity(0.25),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDatePicker(context), // التاريخ في أقصى اليسار
          _buildBreadcrumbItem(
              context), // لوحة التحكم وبيانات الشحن في أقصى اليمين
        ],
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today_outlined,
            size: 14,
            color: Color(0xFF4B4B4B),
          ),
          const SizedBox(width: 9),
          Text(
            '1 مايو 2024',
            style: TextStyle(
              color: const Color(0xFF4B4B4B),
              fontSize: ResponsiveUtils.getFontSize(context, 10),
              fontFamily: 'Readex Pro',
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBreadcrumbItem(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end, // العناصر في أقصى اليمين
        children: [
          const Icon(
            Icons.folder_open,
            size: 18,
            color: Color(0xFF819AA7),
          ),
          const SizedBox(width: 8),
          Text(
            'لوحة التحكم',
            style: TextStyle(
              color: const Color(0xFF819AA7),
              fontSize: ResponsiveUtils.getFontSize(context, 10),
              fontFamily: 'Readex Pro',
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF0C69C0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF8FF),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Text(
                      'X',
                      style: TextStyle(
                        color: const Color(0xFF0C69C0),
                        fontSize: ResponsiveUtils.getFontSize(context, 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'بيانات الشحن',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveUtils.getFontSize(context, 10),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
