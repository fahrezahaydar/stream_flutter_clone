// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:stream/domain/library.dart';
import 'package:stream/presentation/home/controllers/home.controller.dart';

import 'controllers/test.controller.dart';

class TestScreen extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = Theme.of(context).colorScheme;
    return Obx(() => Scaffold(
        body: SafeArea(child: Text("${controller.selectedIndex.value}")),
        bottomNavigationBar: Container(
          width: Get.width,
          decoration: BoxDecoration(color: color.background, boxShadow: [
            BoxShadow(
                color: color.onBackground.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 15,
                offset: Offset(0, 10))
          ]),
          padding: EdgeInsets.all(spacerM),
          height: 80,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            for (int i = 0; i < controller.listIcon.length; i++) ...[
              FlatButton.icon(
                controller.listIcon[i],
                size: 32,
                color: controller.selectedIndex.value == i
                    ? color.primary
                    : color.outlineVariant,
                onPressed: () {
                  controller.selectedIndex.value = i;
                },
              ),
            ],
          ]),
        )));
  }
}
