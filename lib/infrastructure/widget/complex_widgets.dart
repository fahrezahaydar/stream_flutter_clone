import 'package:stream/domain/library.dart';

class ComplexWidgets {
  final color = Theme.of(Get.context!).colorScheme;

  void type(int number, {required RxString pin, String? obsecure = '•'}) {
    String code = pin.value.replaceAll(RegExp(r'[^0-9]'), '');
    if (code.length < 6) {
      code += number.toString();
      while (code.length < 6) {
        code += obsecure!;
      }
      pin.value = code;
    }
  }

  void type2(int number, {required RxInt pin}) {
    String code = pin.value.toString();
    code += number.toString();
    pin.value = int.parse(code);
  }

  void delete({required RxString pin, String? obsecure = '•'}) {
    String code = pin.value.replaceAll(RegExp(r'[^0-9]'), '');

    if (code.length <= 6 && code.isNotEmpty) {
      code = code.substring(0, code.length - 1);
      while (code.length < 6) {
        code += obsecure!;
      }
      pin.value = code;
    }
  }

  void delete2({required RxInt pin}) {
    String code = pin.value.toString();

    if (code.length == 1) {
      // If the PIN is '9', set it to 0
      pin.value = 0;
    } else {
      // Otherwise, remove the last digit
      code = code.substring(0, code.length - 1);
      pin.value = int.parse(code);
    }
  }
}
