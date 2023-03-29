import 'package:get/get.dart';

class HomeController extends GetxController {
  var index = 0.obs;

  void changePage(int newIndex) {
    index.value = newIndex;
  }
}
