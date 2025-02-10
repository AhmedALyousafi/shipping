import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shipping/core/utils/dropdown.dart';
import 'package:shipping/core/utils/responsive.dart';
import 'package:shipping/features/shipping/presentation/pages/archiving%20information/List_butter.dart';
import 'package:shipping/core/models/newitemmodel.dart';

class Mainmenu extends StatelessWidget {
  List<MenuItemModel> record = [
    MenuItemModel(
        text: 'اضافه من',
        icon: Icons.note_add_rounded,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'اضافة سجل',
        icon: Icons.add_box_rounded,
        iconColor: Colors.green,
        onPressed: () {}),
    MenuItemModel(
        text: 'تعديل سجل ',
        icon: Icons.drive_file_rename_outline_outlined,
        iconColor: Colors.orange,
        onPressed: () {}),
    MenuItemModel(
        text: 'حذف سجل',
        icon: Icons.delete_rounded,
        iconColor: Colors.red,
        onPressed: () {}),
    MenuItemModel(
        text: 'السجل الأول',
        icon: Icons.arrow_forward_ios_rounded,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'السجل السابق',
        icon: Icons.double_arrow_rounded,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'السجل التالي',
        icon: Icons.arrow_back_ios,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'السجل الأخير',
        icon: Icons.keyboard_double_arrow_left,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'استيراد',
        icon: Icons.save_rounded,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
  ];
  List<MenuItemModel> inquiry = [
    MenuItemModel(
        text: 'بحث',
        icon: Icons.search,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'بحث في البيانات التفصيلية',
        icon: Icons.file_present_rounded,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
  ];
  List<MenuItemModel> procedure = [
    MenuItemModel(
        text: 'حفظ',
        icon: Icons.save,
        iconColor: Colors.green,
        onPressed: () {}),
    MenuItemModel(
        text: 'فتح شاشة جديدة',
        icon: Icons.open_in_new,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'التقارير',
        icon: Icons.pie_chart,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'قفل الشاشة',
        icon: Icons.lock,
        iconColor: Colors.red,
        onPressed: () {}),
    MenuItemModel(
        text: 'شاشات النظام',
        icon: Icons.screen_share_rounded,
        iconColor: Colors.orange,
        onPressed: () {}),
    MenuItemModel(
        text: 'الطباعة',
        icon: Icons.print,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'تراجع',
        icon: Icons.settings_backup_restore_sharp,
        iconColor: Colors.green,
        onPressed: () {}),
    MenuItemModel(
        text: 'خروج',
        icon: Icons.close,
        iconColor: Colors.red,
        onPressed: () {}),
  ];
  List<MenuItemModel> edit = [
    MenuItemModel(
        text: 'قص',
        icon: Icons.carpenter_outlined,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'نسخ',
        icon: Icons.copy,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'لصق',
        icon: Icons.content_copy,
        iconColor: Colors.blue,
        onPressed: () {}),
    MenuItemModel(
        text: 'عرض قائمة',
        icon: Icons.arrow_downward,
        iconColor: Colors.green,
        onPressed: () {}),
  ];
  List<MenuItemModel> operations = [
    MenuItemModel(
        text: 'الاعتمادات',
        icon: Icons.menu,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'عرض قيد اليومية',
        icon: Icons.storage_rounded,
        iconColor: Colors.grey,
        onPressed: () {}),
    MenuItemModel(
        text: 'أرشفة الوثائق',
        icon: Icons.folder_copy_rounded,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'التوقيف',
        icon: Icons.block,
        iconColor: Colors.red,
        onPressed: () {}),
    MenuItemModel(
        text: 'رقابة النظام',
        icon: Icons.visibility,
        iconColor: Colors.orange,
        onPressed: () {}),
    MenuItemModel(
        text: 'تعديل النصوص',
        icon: Icons.text_fields,
        iconColor: Colors.black,
        onPressed: () {}),
    MenuItemModel(
        text: 'متغيرات الشاشة',
        icon: Icons.sync,
        iconColor: Colors.green,
        onPressed: () {}),
  ];
  List<MenuItemModel> help = [
    MenuItemModel(
        text: 'المساعدة',
        icon: Icons.help_outline,
        iconColor: Colors.blueAccent,
        onPressed: () {}),
    MenuItemModel(
        text: 'المفاتيح',
        icon: Icons.keyboard,
        iconColor: Colors.lightBlue,
        onPressed: () {}),
    MenuItemModel(
        text: 'عرض الأخطاء',
        icon: Icons.error,
        iconColor: Colors.red,
        onPressed: () {}),
  ];

  Mainmenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 30,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  const BoxShadow(color: Colors.black12, blurRadius: 4)
                ],
                color: Colors.white,
                // color: Colors.red,
                border: Border.all(color: Colors.white),
              ),
              height: 40,
              child: AdaptiveLayout(
                desktopLayout: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.folder_outlined,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          'لوحة التحكم',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const VerticalDivider(
                          indent: 10,
                          endIndent: 10,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Container(
                            height: 50,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.blue[700],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize
                                  .min, // Make the button size fit the content
                              children: [
                                const SizedBox(
                                    width:
                                        8), // Space between the icon and text
                                const Text(
                                  "ارشفة الوثائق", // Arabic text
                                  style: TextStyle(
                                    color: Colors.white, // Text color
                                    fontSize: 13, // Text size
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.white,
                                  ),
                                  child: const Icon(
                                    Icons.close, // The "X" icon
                                    color: Colors.black54, // Icon color
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Row(children: [
                            Container(color: Colors.white),
                            const Icon(
                              Icons.more_vert,
                              color: Color(0xff819AA7),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
                tabletLayout: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.folder_outlined,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          'لوحة التحكم',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const VerticalDivider(
                          indent: 10,
                          endIndent: 10,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 50,
                          width: 155,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue[700],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize
                                .min, // Make the button size fit the content
                            children: [
                              const SizedBox(
                                  width: 8), // Space between the icon and text
                              const Text(
                                "ارشفة الوثائق", // Arabic text
                                style: TextStyle(
                                  color: Colors.white, // Text color
                                  fontSize: 16, // Text size
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.close, // The "X" icon
                                  color: Colors.black54, // Icon color
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Row(children: [
                            Container(color: Colors.white),
                            const Icon(
                              Icons.more_vert,
                              color: Color(0xff819AA7),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
                mobileLayout: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          color: Color(0xff0C69C0),
                          size: 14,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('اذن صرف مردود المبيعات',
                            style: TextStyle(
                              color: Color(0xff0C69C0),
                            )),
                        const Spacer(),
                        Container(
                          decoration: const BoxDecoration(),
                          child: Row(children: [
                            Container(color: Colors.white),
                            const Icon(
                              Icons.more_vert,
                              color: Color(0xff819AA7),
                            ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            AdaptiveLayout(
              desktopLayout: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    const BoxShadow(color: Colors.black12, blurRadius: 8),
                  ],
                  color: const Color(0xffFBFBFB),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color(0xfff2f2f2)),
                      child: const Center(
                          child: Icon(
                        FontAwesomeIcons.anglesLeft,
                        color: Colors.grey,
                        size: 16,
                      )),
                    ),
                    Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color(0xfff2f2f2)),
                      child: const Center(
                          child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Colors.grey,
                        size: 16,
                      )),
                    ),
                    Container(
                        height: 21,
                        width: 21,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          '5',
                          selectionColor: Colors.white,
                        ))),
                    Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color(0xfff2f2f2)),
                      child: const Center(
                          child: Icon(
                        FontAwesomeIcons.chevronRight,
                        color: Color(0xffb7babf),
                        size: 16,
                      )),
                    ),
                    Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color(0xfff2f2f2)),
                      child: const Center(
                          child: Icon(
                        FontAwesomeIcons.anglesRight,
                        color: Color(0xffb7babf),
                        size: 16,
                      )),
                    ),

                    const VerticalDivider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.grey,
                    ),

                    IconButton(
                      icon: const Icon(Icons.autorenew,
                          size: 18, color: Colors.green),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.save, color: Colors.green),
                      onPressed: () {},
                    ),
                    const Spacer(),

                    const SizedBox(width: 1),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Wrap(
                        spacing: 0.0,
                        children: [
                          PupupMenuButton(
                            title: "سجل",
                            item: record,
                          ),
                          PupupMenuButton(
                            title: "إستعلام",
                            item: inquiry,
                          ),
                          PupupMenuButton(
                            title: "إجراء",
                            item: procedure,
                          ),
                          PupupMenuButton(
                            title: "تحرير",
                            item: edit,
                          ),
                          PupupMenuButton(
                            title: "عمليات",
                            item: operations,
                          ),
                          PupupMenuButton(
                            title: "مساعدة",
                            item: help,
                          ),
                        ],
                      ),
                    ),
                    // Control dropdowns
                  ],
                ),
              ),
              tabletLayout: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    const BoxShadow(color: Colors.black12, blurRadius: 8),
                  ],
                  color: const Color(0xffFBFBFB),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color(0xfff2f2f2)),
                      child: const Center(
                          child: Icon(
                        FontAwesomeIcons.anglesLeft,
                        color: Color(0xff0C69C0),
                        size: 16,
                      )),
                    ),
                    Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color(0xfff2f2f2)),
                      child: const Center(
                          child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Color(0xff0C69C0),
                        size: 16,
                      )),
                    ),
                    Container(
                        height: 21,
                        width: 21,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: const Center(
                            child: Text(
                          '5',
                          selectionColor: Color(0xffB7BABF),
                        ))),
                    Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color(0xfff2f2f2)),
                      child: const Center(
                          child: Icon(
                        FontAwesomeIcons.chevronRight,
                        color: Color(0xffb7babf),
                        size: 16,
                      )),
                    ),
                    Container(
                      height: 21,
                      width: 21,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: const Color(0xfff2f2f2)),
                      child: const Center(
                          child: Icon(
                        FontAwesomeIcons.anglesRight,
                        color: Color(0xffb7babf),
                        size: 16,
                      )),
                    ),

                    const SizedBox(width: 1),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Wrap(
                        spacing: 0.0,
                        children: [
                          PupupMenuButton(
                            title: "سجل",
                            item: record,
                          ),
                          PupupMenuButton(
                            title: "إستعلام",
                            item: inquiry,
                          ),
                          PupupMenuButton(
                            title: "إجراء",
                            item: procedure,
                          ),
                          PupupMenuButton(
                            title: "تحرير",
                            item: edit,
                          ),
                          PupupMenuButton(
                            title: "عمليات",
                            item: operations,
                          ),
                          PupupMenuButton(
                            title: "مساعدة",
                            item: help,
                          ),
                        ],
                      ),
                    ),
                    // Control dropdowns
                  ],
                ),
              ),
              mobileLayout: Column(
                children: [
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        const BoxShadow(color: Colors.black12, blurRadius: 8),
                      ],
                      color: const Color(0xffFBFBFB),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 21,
                          width: 21,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: const Color(0xfff2f2f2)),
                          child: const Center(
                              child: Icon(
                            FontAwesomeIcons.anglesLeft,
                            color: Color(0xff0C69C0),
                            size: 16,
                          )),
                        ),
                        Container(
                          height: 21,
                          width: 21,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: const Color(0xfff2f2f2)),
                          child: const Center(
                              child: Icon(
                            FontAwesomeIcons.chevronLeft,
                            color: Color(0xff0C69C0),
                            size: 16,
                          )),
                        ),
                        Container(
                            height: 21,
                            width: 21,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            child: const Center(
                                child: Text(
                              '5',
                              selectionColor: Color(0xffB7BABF),
                            ))),
                        Container(
                          height: 21,
                          width: 21,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: const Color(0xfff2f2f2)),
                          child: const Center(
                              child: Icon(
                            FontAwesomeIcons.chevronRight,
                            color: Color(0xffb7babf),
                            size: 16,
                          )),
                        ),
                        Container(
                          height: 21,
                          width: 21,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: const Color(0xfff2f2f2)),
                          child: const Center(
                              child: Icon(
                            FontAwesomeIcons.anglesRight,
                            color: Color(0xffb7babf),
                            size: 16,
                          )),
                        ),

                        const SizedBox(width: 1),

                        // Control dropdowns
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DocumentForm1(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
