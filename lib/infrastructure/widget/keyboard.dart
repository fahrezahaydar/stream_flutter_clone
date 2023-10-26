import 'package:stream/domain/library.dart';

class Keyboard extends StatelessWidget {
  final RxInt? value;
  final RxString? pin;
  final EdgeInsetsGeometry? padding;
  final double? rowSpacing;
  final Color? color;
  final bool? isPin;

  const Keyboard(
      {Key? key,
      this.value,
      this.color,
      this.pin,
      this.padding = const EdgeInsets.all(20.0),
      this.rowSpacing = 16,
      this.isPin = false})
      : super(key: key);

  void typing(int number, {required RxInt object}) {
    String code = object.value.toString();
    code += number.toString();
    object.value = int.parse(code);
  }

  void deleting({required RxInt object}) {
    String code = object.value.toString();

    if (code.length == 1) {
      object.value = 0;
    } else {
      code = code.substring(0, code.length - 1);
      object.value = int.parse(code);
    }
  }

  void typePin(int number, {required RxString pin}) {
    String code = pin.value.replaceAll(RegExp(r'[^0-9]'), '');
    if (code.length < 6) {
      code += number.toString();
      while (code.length < 6) {
        code += '•';
      }
      pin.value = code;
    }
  }

  void deletePin({required RxString pin}) {
    String code = pin.value.replaceAll(RegExp(r'[^0-9]'), '');

    if (code.length <= 6 && code.isNotEmpty) {
      code = code.substring(0, code.length - 1);
      while (code.length < 6) {
        code += '•';
      }
      pin.value = code;
    }
  }

  factory Keyboard.forPin({
    Key? key,
    required RxString pin,
    EdgeInsetsGeometry? padding,
    Color? color,
    double? rowSpacing,
  }) {
    color ??= Theme.of(Get.context!).colorScheme.onBackground;
    rowSpacing = Get.height > 800 ? 20 : 10;
    return Keyboard(
      key: key,
      pin: pin,
      color: color,
      padding: padding = const EdgeInsets.all(20),
      rowSpacing: rowSpacing,
      isPin: true,
    );
  }

  factory Keyboard.normal({
    Key? key,
    required RxInt value,
    EdgeInsetsGeometry? padding,
    Color? color,
    double? rowSpacing,
  }) {
    rowSpacing = Get.height > 800 ? 20 : 10;

    color ??= Theme.of(Get.context!).colorScheme.onBackground;
    return Keyboard(
      key: key,
      value: value,
      color: color,
      padding: padding = const EdgeInsets.all(20),
      rowSpacing: rowSpacing,
      isPin: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NumberBoard('1', color: color, onPressed: () {
                if (isPin == false) {
                  typing(1, object: value!);
                } else {
                  typePin(1, pin: pin!);
                }
              }),
              NumberBoard('2', color: color, onPressed: () {
                if (isPin == false) {
                  typing(2, object: value!);
                } else {
                  typePin(2, pin: pin!);
                }
              }),
              NumberBoard('3', color: color, onPressed: () {
                if (isPin == false) {
                  typing(3, object: value!);
                } else {
                  typePin(3, pin: pin!);
                }
              }),
            ],
          ),
          SizedBox(height: rowSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NumberBoard('4', color: color, onPressed: () {
                if (isPin == false) {
                  typing(4, object: value!);
                } else {
                  typePin(4, pin: pin!);
                }
              }),
              NumberBoard('5', color: color, onPressed: () {
                if (isPin == false) {
                  typing(5, object: value!);
                } else {
                  typePin(5, pin: pin!);
                }
              }),
              NumberBoard('6', color: color, onPressed: () {
                if (isPin == false) {
                  typing(6, object: value!);
                } else {
                  typePin(6, pin: pin!);
                }
              })
            ],
          ),
          SizedBox(height: rowSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NumberBoard('7', color: color, onPressed: () {
                if (isPin == false) {
                  typing(7, object: value!);
                } else {
                  typePin(7, pin: pin!);
                }
              }),
              NumberBoard('8', color: color, onPressed: () {
                if (isPin == false) {
                  typing(8, object: value!);
                } else {
                  typePin(8, pin: pin!);
                }
              }),
              NumberBoard('9', color: color, onPressed: () {
                if (isPin == false) {
                  typing(9, object: value!);
                } else {
                  typePin(9, pin: pin!);
                }
              })
            ],
          ),
          SizedBox(height: rowSpacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NumberBoard('', onPressed: () {}),
              NumberBoard('0', color: color, onPressed: () {
                if (isPin == false) {
                  typing(0, object: value!);
                } else {
                  typePin(0, pin: pin!);
                }
              }),
              IconBoard(Icons.arrow_back, color: color, onPressed: () {
                if (isPin == false) {
                  deleting(object: value!);
                } else {
                  deletePin(pin: pin!);
                }
              })
            ],
          ),
        ],
      ),
    );
  }
}

class NumberBoard extends StatelessWidget {
  final String? data;
  final void Function()? onPressed;
  final Color? color;

  const NumberBoard(this.data,
      {super.key, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;
    //ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: onPressed,
      child: Text(
        data!,
        style: textStyle.displayLarge?.copyWith(color: color),
      ),
    );
  }
}

class IconBoard extends StatelessWidget {
  final IconData? icon;
  final void Function()? onPressed;
  final Color? color;
  final ButtonStyle? style;

  const IconBoard(this.icon,
      {super.key, required this.onPressed, this.color, this.style});

  @override
  Widget build(BuildContext context) {
    //TextTheme textStyle = Theme.of(context).textTheme;
    //ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextButton(
      onPressed: onPressed,
      style: style,
      child: Icon(icon, color: color),
    );
  }
}
