import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:man_alhaj/Controller/MyController.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutApp extends GetView<MyController> {
  const AboutApp({Key? key}) : super(key: key);
  void sendd()async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'abosamour99@gmail.com',
      query: 'subject=app مناسك الحج والعمرةFeedback&body=App Version 1', //add subject and body here
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: NestedScrollView(
          headerSliverBuilder:
      (BuildContext context, bool innerBoxIsScrolled) =>[
        SliverAppBar(
          expandedHeight: 200.0,
          floating: true,
          pinned: true,
          snap: true,
          actionsIconTheme: IconThemeData(opacity: 0.0),
          flexibleSpace: Stack(
            children: <Widget>[
              Positioned.fill(
                  child:
                  Image.asset("assets/images/m_1_0.jpg",fit:  BoxFit.cover,)),
            ],
          ),
        ),
      ],
          body: Scaffold(
            body: Column(
              children: [
                ListTile(
                  onTap: ()async{
                    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('Detalis',textAlign: TextAlign.center,),
                            content: SingleChildScrollView(
                              child:Html(data: """
                                  <a href="#">App Detalis</a><p>versionName=1.0<p><p>versionCode=1<p><br>
<a href="#">Phone Detalis</a>
<p>manufacture:${androidInfo.manufacturer}</p>
<p>model/device:${androidInfo.model}/${androidInfo.device}</p>
<p>bootoader:${androidInfo.bootloader}</p>
                                  """,),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text('ok'),
                                onPressed: () {
                                  //controller.changeColor();
                                  Navigator.of(context).pop();
                                  //dismiss the color picker
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Color(controller.color.value))),
                              ),
                            ],
                          );
                        }
                    );
                  },
                  leading: Icon(Icons.android,size: 50,),
                  title: Text("نسخة رقم 1.0 ",style: TextStyle(fontSize: 20),),
                  subtitle: Text('كود الاصدار :1'),
                ),
                Divider(height: 0,thickness: 1,),
                ListTile(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('changelog',textAlign: TextAlign.center,),
                            content: SingleChildScrollView(
                              child:Html(
                                data: "<p>first versionof app</p>",
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text('ok'),
                                onPressed: () {
                                  //controller.changeColor();
                                  Navigator.of(context).pop();
                                  //dismiss the color picker
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Color(controller.color.value))),
                              ),
                            ],
                          );
                        }
                    );
                  },
                  leading: Icon(Icons.menu_sharp,size: 50,),
                  title: Text("سجل التغيرات",style: TextStyle(fontSize: 20),),
                  subtitle: Text('رؤية سجل التعديلات في الاصدارات الاخيرة'),
                ),
                Divider(height: 0,thickness: 1,),
                ListTile(
                  onTap: (){
                    sendd();
                  },
                  leading: Icon(Icons.email,size: 50,),
                  title: Text("مراسلتنا",style: TextStyle(fontSize: 20),),
                  subtitle: Text('تواصل معنا وارسل الاقتراحات'),
                ),
                Divider(height: 0,thickness: 1,),
                ListTile(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text('Sources',textAlign: TextAlign.center,),
                            content: SingleChildScrollView(
                              child:Html(
                                data: "<a href='http://www.al-eman.com'>http://www.al-eman.com</a>"
                                    "<a href='http://www.sunnah.org.sa'>http://www.sunnah.org.sa</a>",
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text('ok'),
                                onPressed: () {
                                  //controller.changeColor();
                                  Navigator.of(context).pop();
                                  //dismiss the color picker
                                },
                                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Color(controller.color.value))),
                              ),
                            ],
                          );
                        }
                    );
                  },
                  leading: Icon(Icons.source,size: 50,),
                  title: Text("المصادر",style: TextStyle(fontSize: 20),),
                  subtitle: Text('المصادر المستخدمة'),
                ),
                Divider(height: 0,thickness: 1,),
                ListTile(
                  onTap: (){
                    controller.share(
                        "المعحم الصغير","مشاركة التطبيق ","https://play.google.com/store/apps/details?id=com.soonfu.man_alhaj"
                    );
                  },
                  leading: Icon(Icons.share,size: 50,),
                  title: Text("مشاركة التطبيق",style: TextStyle(fontSize: 20),),
                  subtitle: Text('انشر التطبيق وشجع الاخرين علي التجميل'),
                ),
                Divider(height: 0,thickness: 1,),
                ListTile(
                  onTap: (){
                    LaunchReview.launch(
                        androidAppId: "com.soonfu.man_alhaj"
                    );
                  },
                  leading: Icon(Icons.star_rate,size: 50,),
                  title: Text("تقيم التطبيق",style: TextStyle(fontSize: 20),),
                  subtitle: Text('قم باعطاء التطبيق 5 نجوم'),
                ),
                Divider(height: 0,thickness: 1,),
                ListTile(
                  leading: Icon(Icons.phone_android,size: 50,),
                  title: Text("برمجة وتصميم ",style: TextStyle(fontSize: 20),),
                  subtitle: Text('محمود حسن احمد علي'),
                ),
              ],
            ),
          ),),
    );
  }
}
