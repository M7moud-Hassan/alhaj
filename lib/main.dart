import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:man_alhaj/Pages/Home.dart';

import 'Controller/MyBinding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/home', page: () => (Home()), binding: MyBinding()),
      ],
      initialRoute: '/home',
      defaultTransition: Transition.native,
      title: ' مناسك الحج',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      )));
}
