import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:man_alhaj/Controller/MyController.dart';
import 'package:man_alhaj/Pages/AboutApp.dart';
import 'package:man_alhaj/Pages/Settings.dart';

class SecondPage extends GetView<MyController> {
  SecondPage(this.index, {Key? key}) : super(key: key) {
    controller.titleSecondPage.value = controller.titles[index]["title"];
    controller.pos_pag.value = index;
  }
  final index;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Obx(() => Scaffold(
            appBar: AppBar(
              backgroundColor: Color(controller.color.value),
              title: Text(controller.titleSecondPage.value),
              actions: [
                PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("مشاركة"), Icon(Icons.share)],
                        )),
                    PopupMenuItem(
                        value: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("نسخ"), Icon(Icons.copy)],
                        )),
                    PopupMenuItem(
                        value: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("الاعدادات"), Icon(Icons.settings)],
                        )),
                    PopupMenuItem(
                        value: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("عن التطبيق"), Icon(Icons.info)],
                        ))
                  ],
                  onSelected: (i) {
                    switch (i) {
                      case 1:
                        controller.share(
                            controller.titleSecondPage.value,
                            controller.parseHtmlString(controller
                                .titles[controller.pos_pag.value]["sub"]
                                .toString()),
                            "");
                        break;
                      case 2:
                        Clipboard.setData(ClipboardData(
                            text: controller.parseHtmlString(controller
                                .titles[controller.pos_pag.value]["sub"]
                                .toString())));
                        break;
                      case 3:
                        Get.to(Settings());
                        break;
                      case 4:
                        Get.to(AboutApp());
                        break;
                    }
                  },
                )
              ],
            ),
            body: PageView(
              onPageChanged: (i) {
                controller.pos_pag.value = i;
                controller.titleSecondPage.value =
                    controller.titles.value[i]["title"];
              },
              children: List.generate(
                  controller.titles.length,
                  (index) => SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: 70),
                          child: Html(
                              style: {
                                "body": Style(
                                    fontSize:
                                        FontSize(controller.fontSize.value),
                                    textAlign: TextAlign.center,
                                    padding: EdgeInsets.all(10),
                                    color: controller.colorFont.value == "اسود"
                                        ? Colors.black
                                        : Colors.grey,
                                    fontFamily:
                                        controller.verticalGroupValue.value)
                              },
                              data: controller.titles.value[index]["sub"]
                                  .toString()
                                  .replaceAll("&lt;", "<")),
                        ),
                      )),
              controller: PageController(initialPage: index),
            ),
          )),
    );
  }
}
