import 'package:get/get.dart';

class DisplayFunction extends GetxController {
 static  RxBool isDark = false.obs;
  DisplayThemechange() {
    isDark.value = !isDark.value;
  }
}
