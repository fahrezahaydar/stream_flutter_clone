import 'package:stream/domain/library.dart';

import 'controllers/create_pin.controller.dart';

class CreatePinScreen extends GetView<CreatePinController> {
  const CreatePinScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              IconButton(icon: const Icon(Icons.help_outline), onPressed: () {})
            ],
          ),
          body: Center(
            child: Column(
              children: [
                Widgets().header(
                    title: "Create Pin",
                    subtitle:
                        "Generate Your Secret and Exclusive Personal Identification Number (PIN)"),
                const Spacer(),
                Column(
                  children: [
                    Container(
                        width: Get.width - 40,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 6; i++) ...[
                              Container(
                                width: 40,
                                alignment: Alignment.center,
                                child: Text(
                                    controller.pinCreate.isFalse
                                        ? controller.verifPin.value[i]
                                        : controller.confirmPin.value[i],
                                    style: textStyle.displayLarge?.copyWith(
                                        fontSize: controller.isObsecure(
                                                controller.pinCreate.isFalse
                                                    ? controller
                                                        .verifPin.value[i]
                                                    : controller
                                                        .confirmPin.value[i])
                                            ? 56
                                            : 28)),
                              ),
                            ]
                          ],
                        )),
                    const SizedBox(height: 20),
                    Visibility(
                        visible: controller.pinCreate.value,
                        child: Text(
                          "Need to Confirm PIN, Please Input your PIN Again",
                          style: textStyle.labelSmall,
                        )),
                  ],
                ),
                const Spacer(),
                Keyboard.forPin(
                    pin: controller.pinCreate.isFalse
                        ? controller.verifPin
                        : controller.confirmPin)
              ],
            ),
          ),
        ));
  }
}
