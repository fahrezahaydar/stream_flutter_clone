import 'package:stream/domain/library.dart';

class InputPinController extends GetxController {
  //TODO: Implement InputPinController

  final count = 0.obs;
  RxString pin = '••••••'.obs;

  String obsecure = '•';

  bool isObsecure(int index) {
    if (pin.value[index] == '•') {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    ever(pin, (value) {
      if (value == '123123') {
        Get.toNamed(Routes.HOME);
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
