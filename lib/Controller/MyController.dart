import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:man_alhaj/Db/Data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:html/parser.dart';

class MyController extends GetxController with GetTickerProviderStateMixin {
  TabController? tabController;
  TabController? tabController2;
  TabController? tabController5;
  TabController? tabController3;
  TabController? tabController4;
  RxInt pos_pag = 0.obs;
  RxInt select_tab = 0.obs;
  RxInt selectDrawer = 0.obs;
  RxString selectDropDown = "قبل الإحرام".obs;
  RxString selectDropDown2 = "الإفراد".obs;
  RxString selectDropDown3 = "الحاج المفرد".obs;
  RxString data = "".obs;
  RxString data2 = "".obs;
  RxString data2_0 = "".obs;
  RxString data3 = "".obs;
  RxString data4 = "".obs;
  RxList<Map> titles = <Map>[].obs;
  RxString titleSecondPage = "رحلة الحج والعمرة".obs;
  Data db = Data();
  SharedPreferences? sharedPreferences;
  RxDouble fontSize = 20.0.obs;
  RxInt color = 0xffa1887f.obs;
  RxString verticalGroupValue = "normal".obs;
  RxString colorFont = "اسود".obs;
  RxString showBtns = "اظهار / واخفاء".obs;
  TabController? tabController1;
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  //here goes the function
  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  Future<void> share(title, text, String s) async {
    await FlutterShare.share(
        title: title,
        text: parseHtmlString(text),
        linkUrl: s,
        chooserTitle: 'Example Chooser Title');
  }

  setDefault() {
    fontSize.value = 20.0;
    color.value = 0xffa1887f;
    verticalGroupValue.value = "normal";
    colorFont.value = "اسود";
    showBtns.value = "اظهار / واخفاء";
    // loadSettings();
  }

  loadSettings() async {
    fontSize.value = sharedPreferences!.containsKey("fontSize")
        ? sharedPreferences!.getDouble("fontSize")!
        : fontSize.value;
    color.value = sharedPreferences!.containsKey("color")
        ? sharedPreferences!.getInt("color")!
        : color.value;
    verticalGroupValue.value = sharedPreferences!.containsKey("font")
        ? sharedPreferences!.getString("font")!
        : verticalGroupValue.value;
    colorFont.value = sharedPreferences!.containsKey("colorFont")
        ? sharedPreferences!.getString("colorFont")!
        : colorFont.value;
    showBtns.value = sharedPreferences!.containsKey("showBtns")
        ? sharedPreferences!.getString("showBtns")!
        : showBtns.value;
  }

  selectTitles(id) async {
    titles.value = await db.getTitles(id);
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    tabController = await TabController(length: 3, vsync: this);
    await db.inti();
    tabController2 = await TabController(length: 4, vsync: this);
    tabController3 = await TabController(length: 5, vsync: this);
    tabController4 = await TabController(length: 3, vsync: this);
    tabController5 = await TabController(length: 2, vsync: this);
    readData(1);
    readData2(0);
    readData3(0);
    readData4(0);
    selectTitles(1);
    sharedPreferences = await SharedPreferences.getInstance();
    loadSettings();
  }

  readData(index) async {
    data.value = await rootBundle.loadString("assets/files/1_$index.txt");
  }

  readData3(index) async {
    data3.value = await rootBundle.loadString("assets/files/3_$index.txt");
  }

  readData4(index) async {
    data4.value = await rootBundle.loadString("assets/files/4_$index.txt");
  }

  readData2(index) async {
    if (index != 1)
      data2.value = await rootBundle.loadString("assets/files/2_$index.txt");
    else {
      data2.value =
          await rootBundle.loadString("assets/files/2_${index}_0.txt");
      data2_0.value =
          await rootBundle.loadString("assets/files/2_${index}_1.txt");
    }
  }
}
