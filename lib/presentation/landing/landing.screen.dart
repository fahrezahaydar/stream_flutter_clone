import 'package:stream/domain/library.dart';

import 'controllers/landing.controller.dart';

class LandingScreen extends GetView<LandingController> {
  const LandingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Obx(() => Scaffold(
          body: Center(
            child: Column(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: color.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Logo(),
                    ),
                    Text(
                      'Stream',
                      style: GoogleFonts.ptSans(
                          color: color.primary,
                          fontSize: 48,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Start managing your Life Finance',
                      style: GoogleFonts.ptSans(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: controller.loading.value
                      ? CircularProgressIndicator(
                          color: color.primary,
                        )
                      : CircularProgressIndicator(
                          color: color.primary,
                          value: controller.count.value,
                        ),
                )
              ],
            ),
          ),
        ));
  }
}
