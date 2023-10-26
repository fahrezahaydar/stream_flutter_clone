import 'package:stream/domain/library.dart';

class LandingController extends GetxController {
  //TODO: Implement LandingController

  RxDouble count = 0.0.obs;
  RxBool loading = true.obs;
  @override
  void onInit() {
    Future.delayed(Duration(seconds: 4), () {
      loading.value = false;
    });
    ever(loading, (value) {
      if (value == false) {
        Get.offAllNamed(Routes.SIGN_IN);
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
