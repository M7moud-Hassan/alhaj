import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:man_alhaj/Controller/MyController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:man_alhaj/Pages/AboutApp.dart';
import 'package:man_alhaj/Pages/SecondPage.dart';
import 'package:man_alhaj/Pages/Settings.dart';
import 'package:man_alhaj/src/stepper.dart';

class Home extends GetView<MyController> {
  Home({Key? key}) : super(key: key);
  final dropDownList = ["قبل الإحرام", "مواقيت الإحرام", "محظورات الإحرام"];
  final dropDownList2 = ["الإفراد", "التمتع", "القران"];
  final dropDownList3 = ["الحاج المفرد", "الحاج المتمتع", "الحاج القارن"];
  final dropDownList4 = [
    "نصائح عامة",
    "نصائح الطواف",
    "نصائح يوم عرفة",
    "نصائح مِنى",
    "نصائح المدينة المنورة"
  ];
  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/m_1_0.jpg"), context);
    precacheImage(AssetImage("assets/images/m_1_1.jpg"), context);
    precacheImage(AssetImage("assets/images/m_1_2.jpg"), context);
    precacheImage(AssetImage("assets/images/m_2_0.jpg"), context);
    precacheImage(AssetImage("assets/images/m_2_1.jpg"), context);
    precacheImage(AssetImage("assets/images/m_2_2.jpg"), context);
    precacheImage(AssetImage("assets/images/m_2_3.jpg"), context);
    precacheImage(AssetImage("assets/images/m_3_0.jpg"), context);
    precacheImage(AssetImage("assets/images/m_3_1.jpg"), context);
    precacheImage(AssetImage("assets/images/m_3_2.jpg"), context);
    precacheImage(AssetImage("assets/images/m_3_3.jpg"), context);
    precacheImage(AssetImage("assets/images/m_3_4.jpg"), context);
    precacheImage(AssetImage("assets/images/m_4_0.jpg"), context);
    precacheImage(AssetImage("assets/images/m_4_1.jpg"), context);
    precacheImage(AssetImage("assets/images/m_4_2.jpg"), context);
    precacheImage(AssetImage("assets/images/m_6_0.jpg"), context);
    precacheImage(AssetImage("assets/images/m_6_1.jpg"), context);
    List<Widget> widgets = [
      DefaultTabController(
        length: 3,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Color(controller.color.value),
                  expandedHeight: 200.0,
                  floating: true,
                  pinned: true,
                  snap: true,
                  actionsIconTheme: IconThemeData(opacity: 0.0),
                  flexibleSpace: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Obx(() => Image.asset(
                                controller.select_tab == 0
                                    ? "assets/images/m_1_0.jpg"
                                    : controller.select_tab == 1
                                        ? "assets/images/m_1_1.jpg"
                                        : "assets/images/m_1_2.jpg",
                                fit: BoxFit.cover,
                              )))
                    ],
                  ),
                ),
                SliverPadding(
                  padding: new EdgeInsets.all(16.0),
                  sliver: new SliverList(
                    delegate: new SliverChildListDelegate([
                      TabBar(
                        indicatorColor: Color(controller.color.value),
                        labelColor: Color(controller.color.value),
                        unselectedLabelColor: Colors.grey,
                        controller: controller.tabController,
                        onTap: (i) {
                          controller.select_tab.value = i;
                        },
                        tabs: [
                          Tab(text: "الإحرام"),
                          Tab(text: "الطواف"),
                          Tab(text: "السعي"),
                        ],
                      ),
                    ]),
                  ),
                ),
              ];
            },
            body: Obx(() => controller.select_tab == 0
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(controller.color.value),
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButton<String>(
                          value: controller.selectDropDown.value,
                          onChanged: (value) {
                            controller.selectDropDown.value = value.toString();
                            controller.readData(
                                dropDownList.indexOf(value.toString()) + 1);
                          },
                          dropdownColor: Colors.white,
                          icon: const Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          isExpanded: true,

                          // The list of options
                          items: dropDownList
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ))
                              .toList(),
                          // Customize the selected item
                          selectedItemBuilder: (BuildContext context) =>
                              dropDownList
                                  .map((e) => Center(
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                  .toList(),
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Html(
                          style: {
                            "body": Style(
                                fontSize: FontSize(controller.fontSize.value),
                                textAlign: TextAlign.center,
                                padding: EdgeInsets.all(10),
                                color: controller.colorFont.value == "اسود"
                                    ? Colors.black
                                    : Colors.grey,
                                fontFamily: controller.verticalGroupValue.value)
                          },
                          data: controller.data.value,
                        ),
                      ))
                    ],
                  )
                : controller.select_tab == 1
                    ? SingleChildScrollView(
                        child: Html(
                          style: {
                            "body": Style(
                                fontSize: FontSize(controller.fontSize.value),
                                textAlign: TextAlign.center,
                                padding: EdgeInsets.all(10),
                                color: controller.colorFont.value == "اسود"
                                    ? Colors.black
                                    : Colors.grey,
                                fontFamily: controller.verticalGroupValue.value)
                          },
                          data:
                              '<u> <b>طواف العمرة :</b> </u> <br>•طواف العمرة سبعة أشواط. <br>• عندما يصل المعتمر إلى مكة المكرمة يستحب له أن يغتسل فور وصوله <br> ثم يذهب بعد ذلك إلى المسجد الحرام حيث بيت الله العتيق ليؤدى مناسك العمرة وإذا ذهب إلى المسجد الحرام دون أن يغتسل فلا حرج عليه. <br> • فإذا وصل إلى المسجد الحرام قدم رجله اليمنى عند الدخول وقال: <FONT COLOR=#008000>\"بسم الله والصلاة والسلام على رسول الله أعوذ بالله العظيم وبوجهه الكريم وسلطانه القديم من الشيطان الرجيم اللهم افتح لي أبواب رحمتك.\" </FONT>(رواه مسلم ) <br>• وكذا يشرع هذا الدعاء عند دخول سائر المساجد . <br><br>• فإذا وصل إلى البيت قطع التلبية ثم قصد الحجر الأسود واستقبله ثم يستلمه بيمينه ويقبله إن تيسر ذلك ولا يؤذي الناس بالمزاحمة.<br> ويقول عند استلامه: <FONT COLOR=blue> \" بسم الله والله أكبر \" </FONT> فإن شق التقبيل استلمه بيده أو بعضًا أو نحوها، وقبل ما استلمه به فإن شق استلامه أشار إليه وقال: <FONT COLOR=blue> \" الله أكبر \" </FONT> ولا يقبل ما يشير به. ويشترط لصحة الطواف أن يكون الطائف على طهارة من الحدث الأصغر والأكبر؛ لأن الطواف مثل الصلاة غير أنه رخص فيه في الكلام. <br><br>• ثم يجعل البيت عن يساره ويبدأ فى الطواف، ويستمر المعتمر في طوافه ذاكرًا الله ومستغفرًا وداعيا بما شاء من الدعاء أو قراءة القرآن ويكثر من ذلك في الأشواط السبعة، دون أن يرفع صوته بأدعية مخصوصة، لأن ذلك يشوش على غيره من الطائفين . <br><br>• فإذا حاذى الركن اليماني استلمه بيمينه إن تيسر ويقول: <FONT COLOR=blue> \" بسم الله والله أكبر \" </FONT> ولا يُقبِّله. فإن شق عليه استلامه تركه ومضى في طوافه ولا يشير إليه ولا يكبر؛ لأن ذلك لم ينقل عن النبي صلى الله عليه وسلم. أما الحجر الأسود فكلما حاذاه استلمه وقبله كما ذكرنا إن استطاع، دون أن يؤذى الناس بالمزاحمة والمدافعة ولا بالمشاتمة والمضاربة، فإن ذلك خطأ، لما فيه من أذى للمسلمين، ويكفي أن يشير إلى الحجر الأسود من بعيد قائلا : <FONT COLOR=blue>\"الله أكبر\" </FONT> دون أن يتوقف عند مروره من أمام الحجر ولا يجوز له أن يزاحم الآخرين أو يؤذيهم . <br><br>• ومن السنة أن يقول أثناء الطواف بين الركن اليماني والحجر الأسود :<br><FONT COLOR=#008000>\" اللهم إني أسألك العفو والعافية في الدنيا والآخرة, ربنا ءا تنا في الدنيا حسنة وفى الآخرة حسنة وقنا عذاب النار .\" </FONT>(رواه أبو داود وحسنه الألبانى ) <br><br>• ومن السنة أيضا <FONT COLOR=400000> الاضطباع </FONT>للرجل في العمرة وطواف القدوم فقط. وصفته أن يكشف عن كتفه الأيمن جاعلا وسط ردائه تحت إبطه الأيمن وطرفيه على كتفه الأيسر. <br><br>• وهكذا يكمل المعتمرطوافه بهذه الصفة سبعة أشواط، مبتدئًا بالحجر الأسود مع كل شوط ومنتهيا إليه. ويسن الرمل وهو الإسراع في المشي مع تقارب الخطى في الأشواط الثلاثة الأولى من طواف القدوم فقط. <br><br>• ثم يخرج إلى الصفا .... <br> <br> <u> <b>ملاحظات أثناء الطواف : </b> </u> <br> • يحظر الدخول في حجر إسماعيل أثناء الطواف معتقدين أن هذا من الطواف، والواقع أن الطواف من داخل الحجر يبطله لأن الحجر من الكعبة. <br>• يحظر استلام جميع أركان الكعبة وربما جدرانها والتمسح بها وبأستارها وبابها وكل ذلك لا يجوز، لأنه من البدع التي لا أصل لها في الشرع ولم يفعلها النبي صلى الله عليه وسلم. <br>• لا يجوز مزاحمة النساء للرجال أثناء الطواف، خاصة عند الحجر الأسود وعند مقام إبراهيم عليه السلام فيجب الابتعاد عن ذلك. <br> <br> <u> <b>وعندما ينتهي من الطواف عليه أن يفعل ما يلي :</b> </u> <br> •تغطية الكتف الأيمن . <br> •صلاة ركعتين خلف مقام إبراهيم عليه السلام إن تيسر له ذلك وإلا فليصل الركعتين في أي مكان من المسجد الحرام وهي سنة مؤكدة يقرأ في الركعة الأولى بعد الفاتحة<FONT COLOR=400000> سورة الكافرون</FONT> ويقرأ في الركعة الثانية بعد الفاتحة <FONT COLOR=400000>سورة الإخلاص. </FONT>وإن قرأ بغيرهما فلا بأس بذلك .<br>',
                        ),
                      )
                    : SingleChildScrollView(
                        child: Html(style: {
                        "body": Style(
                            fontSize: FontSize(controller.fontSize.value),
                            textAlign: TextAlign.center,
                            padding: EdgeInsets.all(10),
                            color: controller.colorFont.value == "اسود"
                                ? Colors.black
                                : Colors.grey,
                            fontFamily: controller.verticalGroupValue.value)
                      }, data: '<u> <b>سعي العمرة :</b> </u> <br> •سعي العمرة سبعة أشواط. <br> • بعد الانتهاء من الطواف يخرج المعتمر إلى الصفا للسعي سبعة أشواط، فإذا اقترب من الصفا قال: <FONT COLOR=blue> \"أبدأ بما بدأ به الله عز وجل\"</FONT>، قائلا : <FONT COLOR=purple> \"( إن الصفا والمروة من شعائر الله)\"</FONT> <br> <br> • ثم يصعد الصفا ويقف عليه مستقبلا الكعبة ويحمد الله تعالى ويكبره ثلاثًا ويدعو ويكثر من الدعاء رافعا يديه قائلا : <br> <FONT COLOR=blue>\"لا إله إلا الله وحده لا شريك له – له الملك وله الحمد – وهو على كل شيء قدير – لا إله إلا الله وحده أنجز وعده – ونصر عبده وهزم الأحزاب وحده\".</FONT> <FONT COLOR=400000>(ويكرر هذا ثلاثا.)</FONT> <br> <br>• ويدعو بين ذلك بما شاء وإن اقتصر على أقل من ذلك فلا حرج، ولا يرفع يديه إلا إذا كان داعيا، ولا يشير بهما عند التكبير. <br> <br>• ثم ينزل من الصفا متجهًا إلى المروة ماشيًا يدعو بما يتيسر له من الدعاء لنفسه وأهله وللمسلمين. فإذا بلغ العلم الأخضر هرول <FONT COLOR=400000>(وذلك للرجال دون النساء)</FONT> إلى أن يبلغ العلم الثاني فيمشي كعادته حتى يصل إلى المروة. <br><br>• وعندما يصل إلى المروة يستقبل الكعبة ويقول ما قاله من الذكر عند صعود الصفا، دون قراءة الآية ويدعو بما يشاء ثم ينزل ويمشي حتى يصل إلى العلم الأخضر ويهرول حتى يصل إلى العلم الثاني ثم يكمل مشيًا كالمعتاد إلى أن يرقى الصفا، وهكذا يكمل سعيه على هذه الصفة سبعة أشواط فيكون ذهابه من الصفا إلى المروة شوطًا، ورجوعه من المروة إلى الصفا شوطًا آخر. <br>ولا حرج عليه إذا بدأ السعي ماشيا ثم شعر بالإرهاق أو ألم به عارض صحي فله أن يكمل سعيه راكبا العربة. <br><br>• ويستحب أن يكثر في سعيه من الذكر والدعاء بما تيسر. وأن يكون متطهرًا من الحدث الأكبر والأصغر ولو سعى على غير طهارة أجزأه ذلك. <br><br> <u> <b>ملاحظات أثناء السعي :</b> </u> <br> • تجوز للمرأة الحائض والنفساء أداء السعي دون الطواف لأن المسعى ليس من المسجد الحرام. <br> • الإشارة باليدين من الأخطاء الشائعة عند كثير من الحجاج والمعتمرين. <br> • ومن الأخطاء الشائعة إسراع النساء أثناء السعي بين العلمين الأخضرين. <br><br> <u> <b>آخر أعمال العمرة :</b> </u> <br> • بعد إتمام السعي يحلق المعتمر أو يقصر شعر رأسه والحلق أفضل، ولابد من تعميم جميع الرأس في التقصير، والمرأة تقصر من شعرها قدر أنملة وهو ما يعادل رأس الأصبع. <br> • وبذلك تنتهي أعمال العمرة ومن ثم يحل للمعتمر كل شيء حرم عليه بالإحرام.<br> <br><br> وفقنا الله وسائر إخواننا المسلمين للفقه في دينه والثبات عليه وتقبل من الجميع إنه سبحانه جواد كريم.')))),
      ),
      DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Color(controller.color.value),
                  expandedHeight: 200.0,
                  floating: true,
                  pinned: true,
                  snap: true,
                  actionsIconTheme: IconThemeData(opacity: 0.0),
                  flexibleSpace: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Obx(() => Image.asset(
                                "assets/images/m_2_${controller.select_tab.value}.jpg",
                                fit: BoxFit.cover,
                              )))
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      TabBar(
                        controller: controller.tabController2,
                        labelColor: Color(controller.color.value),
                        isScrollable: true, // Required
                        unselectedLabelColor: Colors.black, // Other tabs color
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: 30), // Space between tabs
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: Color(controller.color.value),
                              width: 2), // Indicator height
                          insets: EdgeInsets.symmetric(
                              horizontal: 48), // Indicator width
                        ),
                        onTap: (i) {
                          controller.select_tab.value = i;
                        },
                        tabs: [
                          Tab(text: "الإحرام"),
                          Tab(text: "أنواع الحج"),
                          Tab(text: "أحكام الحج"),
                          Tab(text: "جدول الحج"),
                        ],
                      ),
                    ]),
                  ),
                ),
              ];
            },
            body: Obx(() => controller.select_tab == 0
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(controller.color.value),
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButton<String>(
                          value: controller.selectDropDown.value,
                          onChanged: (value) {
                            controller.selectDropDown.value = value.toString();
                            controller.readData(
                                dropDownList.indexOf(value.toString()) + 1);
                          },
                          dropdownColor: Colors.white,
                          icon: const Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          isExpanded: true,

                          // The list of options
                          items: dropDownList
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ))
                              .toList(),

                          // Customize the selected item
                          selectedItemBuilder: (BuildContext context) =>
                              dropDownList
                                  .map((e) => Center(
                                        child: Text(
                                          e,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                  .toList(),
                        ),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Html(
                          style: {
                            "body": Style(
                                fontSize: FontSize(controller.fontSize.value),
                                textAlign: TextAlign.center,
                                padding: EdgeInsets.all(10),
                                color: controller.colorFont.value == "اسود"
                                    ? Colors.black
                                    : Colors.grey,
                                fontFamily: controller.verticalGroupValue.value)
                          },
                          data: controller.data.value,
                        ),
                      ))
                    ],
                  )
                : controller.select_tab == 1
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Color(controller.color.value),
                                  borderRadius: BorderRadius.circular(30)),
                              child: DropdownButton<String>(
                                value: controller.selectDropDown2.value,
                                onChanged: (value) {
                                  controller.selectDropDown2.value =
                                      value.toString();
                                  controller.readData2(
                                      dropDownList2.indexOf(value.toString()));
                                },
                                dropdownColor: Colors.white,
                                icon: const Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                                isExpanded: true,

                                // The list of options
                                items: dropDownList2
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              e,
                                              style:
                                                  const TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ))
                                    .toList(),

                                // Customize the selected item
                                selectedItemBuilder: (BuildContext context) =>
                                    dropDownList2
                                        .map((e) => Center(
                                              child: Text(
                                                e,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ))
                                        .toList(),
                              ),
                            ),
                            Html(style: {
                              "body": Style(
                                  fontSize: FontSize(controller.fontSize.value),
                                  textAlign: TextAlign.center,
                                  padding: EdgeInsets.all(10),
                                  color: controller.colorFont.value == "اسود"
                                      ? Colors.black
                                      : Colors.grey,
                                  fontFamily:
                                      controller.verticalGroupValue.value)
                            }, data: controller.data2.value),
                            if (controller.selectDropDown2 == dropDownList2[1])
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        AlertDialog(
                                          content: SingleChildScrollView(
                                            child: Html(
                                              style: {
                                                "body": Style(
                                                    fontSize: FontSize(
                                                        controller
                                                            .fontSize.value),
                                                    textAlign: TextAlign.center,
                                                    padding: EdgeInsets.all(10),
                                                    color: controller.colorFont
                                                                .value ==
                                                            "اسود"
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontFamily: controller
                                                        .verticalGroupValue
                                                        .value)
                                              },
                                              data:
                                                  '<b> <u>كيفية الطواف </u> </b> <br> <br>الطواف سبعة أشواط. <br><br>• إذا وصل إلى البيت يقصد الحجر الأسود ويستقبله ثم يستلمه بيمينه ويقبله إن تيسر ذلك ولا يؤذي الناس بالمزاحمة.<br> ويقول عند استلامه: <FONT COLOR=blue>\"بسم الله والله أكبر\"</FONT> فإن شق التقبيل استلمه بيده أو بعضًا أو نحوها، وقبل ما استلمه به فإن شق استلامه أشار إليه وقال: <FONT COLOR=blue>\"الله أكبر\"</FONT> ولا يقبل ما يشير به. ويشترط لصحة الطواف أن يكون الطائف على طهارة من الحدث الأصغر والأكبر؛ لأن الطواف مثل الصلاة غير أنه رخص فيه في الكلام. <br><br>• ثم يجعل البيت عن يساره ويبدأ فى الطواف، ويستمر المعتمر في طوافه ذاكرًا الله ومستغفرًا وداعيا بما شاء من الدعاء أو قراءة القرآن ويكثر من ذلك في الأشواط السبعة، دون أن يرفع صوته بأدعية مخصوصة، لأن ذلك يشوش على غيره من الطائفين. <br><br>• فإذا حاذى الركن اليماني استلمه بيمينه إن تيسر ويقول: <FONT COLOR=blue>\"بسم الله والله أكبر\"</FONT> ولا يُقبِّله. فإن شق عليه استلامه تركه ومضى في طوافه ولا يشير إليه ولا يكبر؛ لأن ذلك لم ينقل عن النبي صلى الله عليه وسلم. أما الحجر الأسود فكلما حاذاه استلمه وقبله كما ذكرنا إن استطاع، دون أن يؤذى الناس بالمزاحمة والمدافعة ولا بالمشاتمة والمضاربة، فإن ذلك خطأ، لما فيه من أذى للمسلمين، ويكفي أن يشير إلى الحجر الأسود من بعيد قائلا: <FONT COLOR=blue>\"الله أكبر\"</FONT> دون أن يتوقف عند مروره من أمام الحجر ولا يجوز له أن يزاحم الآخرين أو يؤذيهم. <br><br>• ومن السنة أن يقول أثناء الطواف بين الركن اليماني والحجر الأسود:<br><FONT COLOR=#008000>\"اللهم إني أسألك العفو والعافية في الدنيا والآخرة, ربنا ءاتنا في الدنيا حسنة وفى الآخرة حسنة وقنا عذاب النار.\"</FONT>(رواه أبو داود وحسنه الألبانى ) <br><br>• ومن السنة أيضا <FONT COLOR=#800000> الاضطباع </FONT>للرجل في العمرة وطواف القدوم فقط. وصفته أن يكشف عن كتفه الأيمن جاعلا وسط ردائه تحت إبطه الأيمن وطرفيه على كتفه الأيسر. <br><br>• وهكذا يكمل المعتمرطوافه بهذه الصفة سبعة أشواط، مبتدئًا بالحجر الأسود مع كل شوط ومنتهيا إليه. ويسن الرمل وهو الإسراع في المشي مع تقارب الخطى في الأشواط الثلاثة الأولى من طواف القدوم فقط. <br><br>• ثم يخرج إلى الصفا.... <br><br> <u> <b>ملاحظات أثناء الطواف:</u> </b> <br> • يحظر الدخول في حجر إسماعيل أثناء الطواف معتقدين أن هذا من الطواف، والواقع أن الطواف من داخل الحجر يبطله لأن الحجر من الكعبة. <br>• يحظر استلام جميع أركان الكعبة وربما جدرانها والتمسح بها وبأستارها وبابها وكل ذلك لا يجوز، لأنه من البدع التي لا أصل لها في الشرع ولم يفعلها النبي صلى الله عليه وسلم. <br>• لا يجوز مزاحمة النساء للرجال أثناء الطواف، خاصة عند الحجر الأسود وعند مقام إبراهيم عليه السلام فيجب الابتعاد عن ذلك. <br> <u> <b>وعندما ينتهي من الطواف عليه أن يفعل ما يلي:</u> </b> <br> •تغطية الكتف الأيمن. <br> •صلاة ركعتين خلف مقام إبراهيم عليه السلام إن تيسر له ذلك وإلا فليصل الركعتين في أي مكان من المسجد الحرام وهي سنة مؤكدة يقرأ في الركعة الأولى بعد الفاتحة<FONT COLOR=#800000> سورة الكافرون</FONT> ويقرأ في الركعة الثانية بعد الفاتحة <FONT COLOR=#800000>سورة الإخلاص. </FONT>وإن قرأ بغيرهما فلا بأس بذلك.<br>',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text("كبفية الطواف ")),
                                  ElevatedButton(
                                      onPressed: () {
                                        AlertDialog(
                                          content: SingleChildScrollView(
                                            child: Html(
                                              style: {
                                                "body": Style(
                                                    fontSize: FontSize(
                                                        controller
                                                            .fontSize.value),
                                                    textAlign: TextAlign.center,
                                                    padding: EdgeInsets.all(10),
                                                    color: controller.colorFont
                                                                .value ==
                                                            "اسود"
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontFamily: controller
                                                        .verticalGroupValue
                                                        .value)
                                              },
                                              data:
                                                  '<u><b>كيفية السعي:</u></b><br> <br> •السعي سبعة أشواط. <br><br> • بعد الانتهاء من الطواف يخرج المعتمر إلى الصفا للسعي سبعة أشواط، فإذا اقترب من الصفا قال: <FONT COLOR=blue>\"أبدأ بما بدأ به الله عز وجل\"</FONT>، قائلا: <FONT COLOR=purple>\"( إن الصفا والمروة من شعائر الله)\"</FONT> <br> <br> • ثم يصعد الصفا ويقف عليه مستقبلا الكعبة ويحمد الله تعالى ويكبره ثلاثًا ويدعو ويكثر من الدعاء رافعا يديه قائلا: <br> <FONT COLOR=blue>\"لا إله إلا الله وحده لا شريك له – له الملك وله الحمد – وهو على كل شيء قدير – لا إله إلا الله وحده أنجز وعده – ونصر عبده وهزم الأحزاب وحده\".</FONT> <FONT COLOR=#800000>(ويكرر هذا ثلاثا.)</FONT> <br> <br>• ويدعو بين ذلك بما شاء وإن اقتصر على أقل من ذلك فلا حرج، ولا يرفع يديه إلا إذا كان داعيا، ولا يشير بهما عند التكبير. <br> <br>• ثم ينزل من الصفا متجهًا إلى المروة ماشيًا يدعو بما يتيسر له من الدعاء لنفسه وأهله وللمسلمين. فإذا بلغ العلم الأخضر هرول <FONT COLOR=#800000>(وذلك للرجال دون النساء)</FONT> إلى أن يبلغ العلم الثاني فيمشي كعادته حتى يصل إلى المروة. <br><br>• وعندما يصل إلى المروة يستقبل الكعبة ويقول ما قاله من الذكر عند صعود الصفا، دون قراءة الآية ويدعو بما يشاء ثم ينزل ويمشي حتى يصل إلى العلم الأخضر ويهرول حتى يصل إلى العلم الثاني ثم يكمل مشيًا كالمعتاد إلى أن يرقى الصفا، وهكذا يكمل سعيه على هذه الصفة سبعة أشواط فيكون ذهابه من الصفا إلى المروة شوطًا، ورجوعه من المروة إلى الصفا شوطًا آخر. <br>ولا حرج عليه إذا بدأ السعي ماشيا ثم شعر بالإرهاق أو ألم به عارض صحي فله أن يكمل سعيه راكبا العربة. <br><br>• ويستحب أن يكثر في سعيه من الذكر والدعاء بما تيسر. وأن يكون متطهرًا من الحدث الأكبر والأصغر ولو سعى على غير طهارة أجزأه ذلك. <br><br> <u> <b>ملاحظات أثناء السعي:</u> </b> <br> • تجوز للمرأة الحائض والنفساء أداء السعي دون الطواف لأن المسعى ليس من المسجد الحرام. <br> • الإشارة باليدين من الأخطاء الشائعة عند كثير من الحجاج والمعتمرين. <br> • ومن الأخطاء الشائعة إسراع النساء أثناء السعي بين العلمين الأخضرين. <br> وفقنا الله وسائر إخواننا المسلمين للفقه في دينه والثبات عليه وتقبل من الجميع إنه سبحانه جواد كريم.',
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text("كبفية السعي "))
                                ],
                              ),
                            if (controller.selectDropDown2 == dropDownList2[1])
                              Html(data: controller.data2_0.value)
                          ],
                        ),
                      )
                    : controller.select_tab == 2
                        ? SingleChildScrollView(
                            child: Html(style: {
                            "body": Style(
                                fontSize: FontSize(controller.fontSize.value),
                                textAlign: TextAlign.center,
                                padding: EdgeInsets.all(10),
                                color: controller.colorFont.value == "اسود"
                                    ? Colors.black
                                    : Colors.grey,
                                fontFamily: controller.verticalGroupValue.value)
                          }, data: '<b> من أحكام الحج :</b> <br> <br> • يمكن أن تحرم من بيتك أو من المطار أو من الباخرة أو من أي مكان بشرط أنك لا تتعدى الميقات المكاني الخاص ببلدك إلا إذا كنت محرما . <br> <br> • إذا اتجهت إلى المدينة أولا فيجوز لك أن تدخلها بدون إحرام، فإذا اتجهت بعد ذلك إلى مكة تحرم من ميقات أهل المدينة (ذو الحليفة ) . <br> <br> • يفضل لكبار السن القران لأنهم سيسعون سعيًا واحدًا ويطوفون طوافًا واحدا للحج والعمرة معا . <br> <br> • وردت عن الرسول (ص )فى أداء المناسك و هى مذكورة فى الادعيه و لالذكار مثل دعائه فى السعى :<FONT COLOR=#008000> \"رب اغفر لي إنك أنت الأعز الأكرم\" </FONT> (رواه ابن أبي شيبة ) <br> <br> • على الإنسان التلبية كلما هبط أو صعد مكانا، ويقول ما يستحضره قلبه خاصة عند شرب ماء زمزم أو النظر إلى الكعبة . <br> <br> • إذا أحرمت من بيتك وقصدت الكعبة مباشرة وفوجئت بأن السلطات توجهك إلى المدينة أولا فستضطر للبقاء بإحرامك طوال مدة الإقامة بالمدينة أو يلزمك هدي للتحلل من الإحرام. وللخروج من هذا يمكن أن تشترط عند إحرامك أنه إذا منعني مانع من الوصول إلى مكة فأنا في حل من إحرامي، فإن قلت هذا فلك أن تخلع ملابس الإحرام وتلبس ملابسك العادية ولا هدي عليك إذا اشترطت . <br> <br> • يجوز تغيير النية بعد الإحرام بأن تحرم قارنا أو متمتعا بعد ما نويت إفرادًا أو قرانًا أو تمتعًا, لكن يجب أن تحدد النية عند بدئك المناسك . <br> <br> • إذا منع الإنسان بسبب من الأسباب من مرض أو غيره واشترط في إحرامه أن محلي حيث حبستني فله أن يتحلل وليس عليه دم ولا صوم، ولا قضاء عليه إلا أن يكون عليه فرض الحج فعليه حج في العام التالي إن تيسر له ذلك . <br> <br> • يجوز لك أن تحج وأن تعتمر عن غيرك إذا كان ميتًا أو عاجزًا بشرط أن تكون قد حججت أو اعتمرت عن نفسك . <br> <br> • يحظر على الحاج أن يصطاد شيئيًا من صيد البر أو الجماع ودواعيه من التقبيل واللمس أو قص الأظافر أو إزالة الشعر أو وضع الطيب ويحظر على المرأة أن تضع على وجهها نقابًا أو تلبس في يديها قفازًا عند الطواف . <br> <br> • الجماع إذا وقع أثناء أعمال الحج يبطل الحج وكذلك العمرة ويقدم الحاج في هذه الحالة بقرة أو جملا أو سبع شياه ثم يقضي الحج في العام التالي و ذلك للزوج والزوجة . <br> <br> • إذا ارتكبت محظورًا آخر غير الجماع بعذر من الأعذار كمن لا يستطيع أن يتجرد من ملابسه العادية أو مضطرًا لتغطية رأسه فعليه الفدية وهي صيام ثلاثة أيام أو التصدق على ستة مساكين بمقدار حفنتين من القمح أو ذبح شاه . <br> <br> • إذا سقط من الإنسان شعر بدون معالجة وهو نائم مثلا فلا شيء عليه . <br> <br> • يجوز للمحرم أن يغتسل بالصابون العادي وأن يلبس حزامًا يضع فيه أوراقه ونقوده، وأن يلبس الساعة والخاتم والنظارة وأن يستظل بالشمسية والخيمة . <br> <br> • لا يجوز التحدث أثناء الطواف إلا بخير لأنه صلاة و يجب فيه ستر العورة وطهارة البدن والثياب والطهارة التامة من الحدثين الأكبر والأصغر . <br> <br> • عند بدأ الطواف يكبر ويقول : <br> <FONT COLOR=blue> \"أشهد أن لا اله إلا الله وأشهد أن محمدًا رسول الله، اللهم إيمانًا بك وتصديقا بكتابك ووفاءً بعهدك واتباعا لسنة نبيك محمد صلى الله عليه وسلم \".</FONT> <br> • ثم يبدأ الطواف جاعلا الكعبة عن يساره, ويجب أن تطوف حول الكعبة وحجر إسماعيل معًا . <br> <br> • من السنة أن ترمل في الأشواط الثلاثة الأولى من الطواف, والرمل: هو أن تسرع بعض الشيء مع هز الكتفين وهو للرجال وليس للنساء . <br> <br> • يسن لك أن تصلي ركعتين بعد تمام الطواف عند مقام إبراهيم بأن تجعل مقام إبراهيم بينك وبين الكعبة . <br> <br> • يستحب أن تشرب من ماء زمزم وتدعو بأي دعاء شئت ليس فيه إثم أو قطيعة رحم وأن تملأ منه معدتك وجوفك . <br> <br> • إذا صعدت الصفا تقول:<br> <FONT COLOR=purple> \"(إن الصفا والمروة من شعائر الله)\"</FONT>، <br> <FONT COLOR=blue>\" أبدأ بما بدأ الله به\" </FONT>، ولاحظ أن من الصفا إلى المروة شوط، ومن المروة إلى الصفا شوطٌ ثانٍِ ويسن أن تهرول بين مسافة قصيرة ولها علامتان واضحتان (عند العلمين الأخضرين) . <br> <br> • من يعجز عن ذبح الهدي عليه لمن كان متمتعا أو قارنا أن يصوم ثلاثة أيامٍ في الحج وسبعةً إذا رجع إلى بلده يصومها قبل يوم (الثامن) من ذي الحجة فإن لم يستطع أن يصوم هناك يصوم العشرة أيام كلها إذا رجع إلى بلده متتابعات أو متفرقات . <br> <br> • نظرًا للزحام الشديد فإنه من العسير المبيت بمزدلفة، ولهذا قال بعض الفقهاء أن المبيت يتحقق بالنزول إلى المزدلفة بصلاة المغرب والعشاء والراحة وقتا قصيرًا وجمع الحصيات وبهذا يتحقق واجب المبيت ولا يلزم البقاء حتى الفجر. <br> <br> • وقت الرمي يمتد إلى غروب الشمس في يوم العيد فإن استمر الزحام فهو ممتد إلى فجر ثاني أيام العيد . <br> <br> • تأخذ المرأة قدر عقلة الأصبع من شعرها عند تحللها . <br> <br> • إذا تحللت التحلل الأول قبل طواف الإفاضة بالحلق أو التقصير فإنه يجوز لك كل شيء ما عدا الجماع . <br> <br> • لو حاضت المرأة يوم العيد وهي مرتبطة بسفر أو رفقة وعليها طواف الإفاضة فماذا تفعل؟ يمكنها أن تعتصب وتتحفظ قدر ما تستطيع وتدخل المسجد الحرام وتطوف طواف الإفاضة. بعض الفقهاء يرى أن عليها بدنة, ويرى ابن القيم وابن تيمية أنها ليس عليها شيء، ويرى بعض أهل العلم أن عليها ذبح شاة وهذا ما نميل إليه وإن عجزت عن ذبح شاة فعليها صيام ثلاثة أيام في الحج وسبعة إذا رجعت . <br> <br> • هناك بعض الحجاج يرمي الجمرات الساعة الثانية عشرة إلا خمسة ليلا ثم يرمون الحصيات الساعة الثانية عشرة وخمس دقائق ويقولون أن اليوم الجديد بدأ، وهذا خطأ لأن اليوم الإسلامي يبدأ بعد أذان الفجر . <br> <br> • يجوز للإنسان أن يرمي عن نفسه وعن غيره عند كل جمرة ثم ينتقل إلى التي بعدها ويفعل مثل الذي فعله في الأولى . <br> <br> • إذا انتهى من احرم بالأفراد من الحج وأراد أن يعمل عمرة فعليه أن يخرج إلى مكان قريب يسمى التنعيم ويقوم بالإحرام ثم يقوم بأدائها وهو في هذا ليس عليه هدي . <br> <br> • يجوز للمرأة أن تأخذ حبوبًا لتأخير الحيض أو تقديمه إذا كان لا يضرها ويسقط عنها طواف الوداع إذا لم تطهر و تجهزت للسفر .'))
                        : SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 15),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color(controller.color.value),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DropdownButton<String>(
                                    value: controller.selectDropDown3.value,
                                    onChanged: (value) {
                                      controller.selectDropDown3.value =
                                          value.toString();
                                      controller.readData3(dropDownList3
                                          .indexOf(value.toString()));
                                    },
                                    dropdownColor: Colors.white,
                                    icon: const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.white,
                                    ),
                                    isExpanded: true,

                                    // The list of options
                                    items: dropDownList3
                                        .map((e) => DropdownMenuItem(
                                              value: e,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  e,
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ))
                                        .toList(),

                                    // Customize the selected item
                                    selectedItemBuilder:
                                        (BuildContext context) => dropDownList3
                                            .map((e) => Center(
                                                  child: Text(
                                                    e,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ))
                                            .toList(),
                                  ),
                                ),
                                Html(
                                  data: controller.data3.value,
                                  style: {
                                    "body": Style(
                                        fontSize:
                                            FontSize(controller.fontSize.value),
                                        textAlign: TextAlign.center,
                                        padding: EdgeInsets.all(10),
                                        color:
                                            controller.colorFont.value == "اسود"
                                                ? Colors.black
                                                : Colors.grey,
                                        fontFamily:
                                            controller.verticalGroupValue.value)
                                  },
                                ),
                              ],
                            ),
                          ))),
      ),
      DefaultTabController(
          length: 5,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Color(controller.color.value),
                    expandedHeight: 200.0,
                    floating: true,
                    pinned: true,
                    snap: true,
                    actionsIconTheme: IconThemeData(opacity: 0.0),
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Obx(() => Image.asset(
                                  "assets/images/m_3_${controller.select_tab.value}.jpg",
                                  fit: BoxFit.cover,
                                )))
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: new EdgeInsets.all(16.0),
                    sliver: new SliverList(
                      delegate: new SliverChildListDelegate([
                        TabBar(
                          labelColor: Color(controller.color.value),
                          isScrollable: true, // Required
                          unselectedLabelColor:
                              Colors.black, // Other tabs color
                          labelPadding: EdgeInsets.symmetric(
                              horizontal: 30), // Space between tabs
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                                color: Color(controller.color.value),
                                width: 2), // Indicator height
                            insets: EdgeInsets.symmetric(
                                horizontal: 48), // Indicator width
                          ),
                          controller: controller.tabController3,
                          onTap: (i) {
                            controller.readData4(i);
                            controller.select_tab.value = i;
                          },
                          tabs: [
                            Tab(text: dropDownList4[0]),
                            Tab(text: dropDownList4[1]),
                            Tab(text: dropDownList4[2]),
                            Tab(text: dropDownList4[3]),
                            Tab(text: dropDownList4[4]),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ];
              },
              body: Obx(() => SingleChildScrollView(
                      child: Html(
                    style: {
                      "body": Style(
                          fontSize: FontSize(controller.fontSize.value),
                          textAlign: TextAlign.center,
                          padding: EdgeInsets.all(10),
                          color: controller.colorFont.value == "اسود"
                              ? Colors.black
                              : Colors.grey,
                          fontFamily: controller.verticalGroupValue.value)
                    },
                    data: controller.data4.value,
                  ))))),
      DefaultTabController(
          initialIndex: controller.select_tab.value,
          length: 3,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Color(controller.color.value),
                    expandedHeight: 200.0,
                    floating: true,
                    pinned: true,
                    snap: true,
                    actionsIconTheme: IconThemeData(opacity: 0.0),
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Obx(() => Image.asset(
                                  "assets/images/m_4_${controller.select_tab.value}.jpg",
                                  fit: BoxFit.cover,
                                )))
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: new EdgeInsets.all(16.0),
                    sliver: new SliverList(
                      delegate: new SliverChildListDelegate([
                        TabBar(
                          indicatorColor: Color(controller.color.value),
                          controller: controller.tabController4,
                          labelColor: Color(controller.color.value),
                          unselectedLabelColor: Colors.grey,
                          onTap: (i) {
                            controller.select_tab.value = i;
                            controller.selectTitles(i + 1);
                          },
                          tabs: [
                            Tab(text: "أدعية وأذكار"),
                            Tab(text: "أسئلة وفتاوي"),
                            Tab(text: "صور ولقطات"),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ];
              },
              body: Obx(() => ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: controller.titles.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Get.to(SecondPage(index));
                      },
                      title: Text(controller.titles.value[index]["title"]),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                    ),
                  )))),
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                controller.globalKey.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu_outlined,
                color: Colors.white,
              )),
          automaticallyImplyLeading: false,
          backgroundColor: Color(controller.color.value),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/bg_counter.jpg"))),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StepperTouch(
                  initialValue: 0,
                  direction: Axis.vertical,
                  withSpring: true,
                  onChanged: (int value) => print('new value $value'),
                ),
              ),
            ),
          ),
        ),
      ),
      DefaultTabController(
          length: 2,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Color(controller.color.value),
                    expandedHeight: 200.0,
                    floating: true,
                    pinned: true,
                    snap: true,
                    actionsIconTheme: IconThemeData(opacity: 0.0),
                    flexibleSpace: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Obx(() => Image.asset(
                                  "assets/images/m_6_${controller.select_tab.value}.jpg",
                                  fit: BoxFit.cover,
                                )))
                      ],
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        TabBar(
                          controller: controller.tabController5,
                          labelColor: Color(controller.color.value),
                          indicatorColor: Color(controller.color.value),
                          unselectedLabelColor: Colors.grey,
                          onTap: (i) {
                            controller.select_tab.value = i;
                            controller.selectTitles(i + 4);
                          },
                          tabs: [
                            Tab(text: "كتاب المناسك لابن عثيمين"),
                            Tab(text: "المنهج لمريد العمرة والحج"),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ];
              },
              body: Obx(() => ListView.separated(
                    padding: EdgeInsets.zero,
                    itemCount: controller.titles.length,
                    itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Get.to(SecondPage(index));
                      },
                      title: Text(controller.titles.value[index]["title"]),
                    ),
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                    ),
                  )))),
    ];
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(() => Scaffold(
              key: controller.globalKey,
              drawer: Obx(() => Drawer(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              controller.select_tab.value = 0;
                              controller.selectDrawer.value = 0;
                              Navigator.of(context).pop();
                              controller.tabController!.animateTo(0,
                                  duration: Duration(milliseconds: 100));
                              //controller.select_tab.value=0;
                            },
                            tileColor: controller.selectDrawer.value == 0
                                ? Color(controller.color.value).withOpacity(0.5)
                                : null,
                            title: Text(
                              "مناسك العمرة",
                              style: TextStyle(
                                  color: controller.selectDrawer.value == 0
                                      ? Colors.white
                                      : null),
                            ),
                            leading: Icon(
                              Icons.settings_applications_sharp,
                              color: controller.selectDrawer.value == 0
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              controller.select_tab.value = 0;
                              controller.selectDrawer.value = 1;
                              Navigator.of(context).pop();
                              controller.tabController2!.animateTo(0,
                                  duration: Duration(milliseconds: 100));
                            },
                            tileColor: controller.selectDrawer.value == 1
                                ? Color(controller.color.value).withOpacity(0.5)
                                : null,
                            title: Text(
                              "مناسك الحج",
                              style: TextStyle(
                                color: controller.selectDrawer.value == 1
                                    ? Colors.white
                                    : null,
                              ),
                            ),
                            leading: Icon(
                              Icons.ac_unit_rounded,
                              color: controller.selectDrawer.value == 1
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                          Divider(
                            height: 2,
                            thickness: 1,
                          ),
                          ListTile(
                            onTap: () {
                              controller.select_tab.value = 0;
                              controller.selectDrawer.value = 2;
                              controller.tabController3!.animateTo(0,
                                  duration: Duration(milliseconds: 100));
                              Navigator.of(context).pop();
                            },
                            tileColor: controller.selectDrawer.value == 2
                                ? Color(controller.color.value).withOpacity(0.5)
                                : null,
                            title: Text(
                              "نصائح ",
                              style: TextStyle(
                                  color: controller.selectDrawer.value == 2
                                      ? Colors.white
                                      : null),
                            ),
                            leading: Icon(
                              Icons.lightbulb,
                              color: controller.selectDrawer.value == 2
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              controller.selectDrawer.value = 3;
                              controller.select_tab.value = 0;
                              Navigator.of(context).pop();
                              controller.tabController4!.animateTo(0);
                            },
                            tileColor: controller.selectDrawer.value == 3
                                ? Color(controller.color.value).withOpacity(0.5)
                                : null,
                            title: Text(
                              "ادعية وفتاوي",
                              style: TextStyle(
                                  color: controller.selectDrawer.value == 3
                                      ? Colors.white
                                      : null),
                            ),
                            leading: Icon(
                              Icons.nightlight,
                              color: controller.selectDrawer.value == 3
                                  ? Colors.white
                                  : null,
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              controller.selectDrawer.value = 4;
                              controller.select_tab.value = 0;
                              Navigator.of(context).pop();
                            },
                            tileColor: controller.selectDrawer.value == 4
                                ? Color(controller.color.value).withOpacity(0.5)
                                : null,
                            title: Text(
                              "عداد الطواف ",
                              style: TextStyle(
                                  color: controller.selectDrawer.value == 4
                                      ? Colors.white
                                      : null),
                            ),
                            leading: Icon(Icons.speed_rounded,
                                color: controller.selectDrawer.value == 4
                                    ? Colors.white
                                    : null),
                          ),
                          Divider(
                            height: 2,
                            thickness: 1,
                          ),
                          ListTile(
                            onTap: () {
                              controller.select_tab.value = 0;
                              controller.selectDrawer.value = 5;
                              Navigator.of(context).pop();
                              controller.selectTitles(4);
                              controller.tabController5!.animateTo(0);
                            },
                            tileColor: controller.selectDrawer.value == 5
                                ? Color(controller.color.value).withOpacity(0.5)
                                : null,
                            title: Text(
                              "الكتاب",
                              style: TextStyle(
                                  color: controller.selectDrawer.value == 5
                                      ? Colors.white
                                      : null),
                            ),
                            leading: Icon(Icons.menu_book,
                                color: controller.selectDrawer.value == 5
                                    ? Colors.white
                                    : null),
                          ),
                          Divider(
                            height: 2,
                            thickness: 1,
                          ),
                          ListTile(
                            onTap: () {
                              Get.to(Settings());
                            },
                            title: Text("الاعدادت "),
                            leading: Icon(Icons.settings),
                          ),
                          ListTile(
                            onTap: () {
                              Get.to(AboutApp());
                            },
                            title: Text("عن التطبيق"),
                            leading: Icon(Icons.info),
                          ),
                          ListTile(
                            onTap: () {
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            },
                            tileColor: controller.selectDrawer.value == 9
                                ? Colors.grey
                                : null,
                            title: Text(" خروج "),
                            leading: Icon(Icons.exit_to_app),
                          ),
                        ],
                      ),
                    ),
                  )),
              body: widgets[controller.selectDrawer.value],
            )));
  }
}
