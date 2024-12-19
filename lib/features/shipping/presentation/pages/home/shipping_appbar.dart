import 'package:flutter/material.dart';
import 'package:shipping/core/utils/responsive.dart';

class Shippingappbar extends StatelessWidget {
  const Shippingappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveUtils.getHeaderHeight(context),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(color: Color(0xFF094F90)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 11,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(width: 8),
              Text(
                'احمد اليوسفي',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveUtils.getFontSize(context, 12),
                  fontFamily: 'Readex Pro',
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              _buildHeaderIcon(
                icon: Icons.notifications_none,
                onPressed: () {},
              ),
              _buildHeaderIcon(
                icon: Icons.mail_outline,
                onPressed: () {},
              ),
              _buildHeaderIcon(
                icon: Icons.search,
                onPressed: () {},
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xFF0C69C0),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 11,
                    ))),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(
      {required IconData icon, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12), // لإضافة تأثير دائري عند الضغط
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
