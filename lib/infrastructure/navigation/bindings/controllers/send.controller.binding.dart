import 'package:get/get.dart';

import '../../../../presentation/home/send/controllers/send.controller.dart';

class SendControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendController>(
      () => SendController(),
    );
  }
}
