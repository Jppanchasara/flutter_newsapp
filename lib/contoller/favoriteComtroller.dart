import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class favoritrController extends GetxController {
  RxBool favorite = false.obs;
  ChangeValue() {
    favorite.value =! favorite.value;
  }
}
