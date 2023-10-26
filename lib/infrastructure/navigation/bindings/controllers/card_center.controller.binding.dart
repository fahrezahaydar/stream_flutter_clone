import 'package:get/get.dart';

import '../../../../presentation/home/card_center/controllers/card_center.controller.dart';

class CardCenterControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardCenterController>(
      () => CardCenterController(),
    );
  }
}
