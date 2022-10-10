import 'package:get/get.dart';

class Controll_Counter extends GetxController {
  int counter = 0;
  void incrementCounter() {
    counter += 1;
    update();
  }
}
