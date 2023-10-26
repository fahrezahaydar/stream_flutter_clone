import 'package:get/get.dart';

import '../../../../presentation/create_pin/controllers/create_pin.controller.dart';

class CreatePinControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePinController>(
      () => CreatePinController(),
    );
  }
}
