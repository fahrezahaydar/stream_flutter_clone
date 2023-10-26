import 'package:stream/domain/library.dart';

class TestController extends GetxController {
  //TODO: Implement TestController

  final count = 0.obs;
  final pin = '••••••'.obs;

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  void changeInfo(int index) {
    selectedInfo.value = index;
  }

  RxInt selectedIndex = 0.obs;
  RxInt selectedInfo = 0.obs;
  PageController pageController = PageController();

  @override
  void onInit() {
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

  List<IconData> listIcon = [
    Icons.home,
    Icons.sync_alt,
    Icons.notifications,
    Icons.person
  ];
}
