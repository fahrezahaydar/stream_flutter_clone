import 'package:stream/domain/library.dart';
import 'package:stream/infrastructure/config/sizes.dart';

import 'controllers/sign_in.controller.dart';

class SignInScreen extends GetView<SignInController> {
  SignInScreen({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        themeController.toggleTheme();
      }),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(spacerM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      color: color.primary,
                      borderRadius: BorderRadius.circular(12)),
                  child: const Logo(),
                ),
                Text('Stream', style: textStyle.titleMedium),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Widgets().header(
                  title: "Sign In",
                  subtitle: "Enter your Email to Access your Account"),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamTextField(
                      title: "Email",
                      controller: controller.email,
                      hintText: "sample@email.com",
                    ),
                  ],
                ),
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'New Member ?   ', style: textStyle.bodySmall),
                    TextSpan(
                      text: 'Register',
                      style: textStyle.displaySmall
                          ?.copyWith(color: color.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.AUTHENTICATION);
                        },
                    ),
                  ])),
              const Spacer(flex: 2),
            ],
          )),
          PrimaryButton("Login", onPressed: () {
            Get.offAllNamed(Routes.INPUT_PIN);
          })
        ],
      ),
    );
  }
}
