import 'package:stream/domain/library.dart';

import 'controllers/authentication.controller.dart';

class AuthenticationScreen extends GetView<AuthenticationController> {
  AuthenticationScreen({Key? key}) : super(key: key);
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
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Widgets().header(
                    title: "Register",
                    subtitle:
                        "Choose your country code and enter your phone number"),
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
                      const VerticalSpace(20),
                      StreamTextField(
                        title: "Phone Number",
                        controller: controller.phoneNumber,
                        hintText: "85-XXXX-XXXX-X",
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                              'By submitting this application you confirm that you are authorized to share this information and agree with our ',
                          style: textStyle.labelSmall,
                        ),
                        TextSpan(
                          text: '\nTerm and Conditions',
                          style: textStyle.labelSmall
                              ?.copyWith(color: color.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Add your navigation or handling code here
                            },
                        ),
                      ])),
                )
              ],
            )),
            PrimaryButton(
              'Send Verification Code',
              onPressed: () => Get.toNamed(Routes.VERIFICATION),
            )
          ],
        ),
      ),
    );
  }
}
