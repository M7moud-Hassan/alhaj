import 'package:get/get.dart';
import 'package:man_alhaj/Controller/MyController.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<MyController>(() => MyController());
  }

}