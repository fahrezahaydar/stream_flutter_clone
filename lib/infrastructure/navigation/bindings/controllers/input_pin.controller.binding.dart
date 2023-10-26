import 'package:get/get.dart';

import '../../../../presentation/input_pin/controllers/input_pin.controller.dart';

class InputPinControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputPinController>(
      () => InputPinController(),
    );
  }
}
