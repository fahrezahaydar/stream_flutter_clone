import 'package:stream/domain/library.dart';
import 'package:stream/infrastructure/config/sizes.dart';

import 'controllers/verification.controller.dart';

class VerificationScreen extends GetView<VerificationController> {
  VerificationScreen({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(icon: const Icon(Icons.help_outline), onPressed: () {})
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        themeController.toggleTheme();
      }),
      body: Center(
        child: Column(
          children: [
            Widgets().header(
                title: "Verification",
                subtitle:
                    "Verify the handphone number by entering the verification code"),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(spacerM),
              child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 6; i++) ...[
                        Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: Text(controller.verifS.value[i],
                              style: textStyle.displayLarge?.copyWith(
                                  fontSize: controller.isObsecure(
                                          controller.verifS.value[i])
                                      ? 56
                                      : 28)),
                        )
                      ]
                    ],
                  )),
            ),
            Text("Didn’t receive verification code?",
                textAlign: TextAlign.center, style: textStyle.labelLarge),
            TextButton(
                onPressed: () {},
                child: Text("Resend Code",
                    style: textStyle.displaySmall
                        ?.copyWith(color: color.primary))),
            const Spacer(flex: 2),
            Keyboard.forPin(pin: controller.verifS),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
