import '../../../domain/library.dart';

class VerificationController extends GetxController {
  //TODO: Implement VerificationController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    ever(verifS, (value) {
      if (value == '123123') {
        Get.toNamed(Routes.PERSONAL_INFO);
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    verifS.value = "••••••";
  }

  RxInt verifCode = 0.obs;
  RxString verifS = '••••••'.obs;

  bool isObsecure(String char) {
    if (char == '•') {
      return true;
    } else {
      return false;
    }
  }
}
