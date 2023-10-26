import 'package:stream/domain/library.dart';

class CreatePinController extends GetxController {
  //TODO: Implement CreatePinController
  RxString verifPin = '••••••'.obs;
  RxString confirmPin = '••••••'.obs;

  RxBool pinCreate = false.obs;

  bool isObsecure(String char) {
    if (char == '•') {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    ever(verifPin, (value) {
      String length = value.replaceAll(RegExp(r'[^0-9]'), '');

      if (length.length == 6) {
        pinCreate.value = true;
      }
    });
    ever(confirmPin, (value) {
      if (value == verifPin.value) {
        Get.snackbar("Success", "Account Has Been Created",
            backgroundColor: Theme.of(Get.context!).colorScheme.tertiary);
        Get.toNamed(Routes.LANDING);
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
}
