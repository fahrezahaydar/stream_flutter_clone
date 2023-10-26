import 'package:stream/domain/library.dart';

import 'controllers/input_pin.controller.dart';

class InputPinScreen extends GetView<InputPinController> {
  const InputPinScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color.primary,
      appBar: AppBar(
        backgroundColor: color.primary,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  color: color.primary,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Logo(),
            ),
            const SizedBox(width: 4),
            Text(
              "Stream",
              style: textStyle.displayLarge
                  ?.copyWith(color: Colors.white, letterSpacing: -1),
            )
          ],
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const Spacer(flex: 2),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Enter your PIN",
                  style: textStyle.displayMedium?.copyWith(color: Colors.white),
                ),
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 6; i++) ...[
                          Container(
                            width: 40,
                            height: 72,
                            alignment: Alignment.center,
                            child: Text(
                              controller.pin.value[i],
                              style: textStyle.displayLarge?.copyWith(
                                  fontSize: controller.isObsecure(i) ? 56 : 28,
                                  color: controller.isObsecure(i)
                                      ? Colors.white.withOpacity(0.5)
                                      : Colors.white),
                            ),
                          )
                        ]
                      ],
                    )),
                const SizedBox(height: 10),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Forgot your PIN ?   ',
                        style:
                            textStyle.bodySmall?.copyWith(color: Colors.white),
                      ),
                      TextSpan(
                        text: 'RESET PIN',
                        style: textStyle.displaySmall
                            ?.copyWith(color: Colors.white),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Add your navigation or handling code here
                            print('Term and Conditions clicked');
                            Get.toNamed(Routes.AUTHENTICATION);
                          },
                      ),
                    ])),
              ],
            ),
          ),
          const Spacer(flex: 2),
          Keyboard.forPin(
            pin: controller.pin,
            color: Colors.white,
          ),
          const Spacer(flex: 1),
        ],
      )),
    );
  }
}
