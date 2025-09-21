

import 'package:get/get.dart';
import 'package:task_helper/features/home/controller/all_task_controller.dart';

class AppBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(AllTaskController());
  }



}