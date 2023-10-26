import 'package:stream/domain/library.dart';
import 'package:stream/infrastructure/config/sizes.dart';

import 'controllers/send.controller.dart';

class SendScreen extends GetView<SendController> {
  SendScreen({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Obx(() => SafeArea(
          child: Stack(
            children: [
              Container(
                  height: Get.height,
                  width: Get.width,
                  color: color.background.withOpacity(0.9)),
              SvgPicture.asset(
                "assets/svg/Frame 340.svg",
                alignment: Alignment.centerLeft,
                colorFilter: ColorFilter.mode(
                    color.secondaryContainer.withOpacity(0.3), BlendMode.srcIn),
              ),
              Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    title: Text('Send', style: textStyle.displayMedium),
                    centerTitle: true,
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(spacerM),
                        child: Column(
                          children: [
                            Text("Amount", style: textStyle.labelLarge),
                            Text(
                                controller
                                    .formatCurrency(controller.amount.value),
                                style: textStyle.displayLarge)
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            color: color.background,
                            padding: const EdgeInsets.all(spacerM),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: color.primary,
                                      radius: 24,
                                    ),
                                    const HorizontalSpace(spacerM),
                                    Text("Ayana Putri",
                                        style: textStyle.bodyLarge),
                                    const Spacer(),
                                    FlatButton.icon(Icons.send,
                                        style: const ButtonStyle(
                                            alignment: Alignment.centerRight),
                                        color: color.onSurface,
                                        onPressed: () {})
                                  ],
                                ),
                                Divider(
                                  color: color.outline,
                                  height: 40,
                                ),
                                DropdownButton<String>(
                                  underline: Container(),
                                  selectedItemBuilder: (BuildContext context) {
                                    return controller.list
                                        .map<Widget>((String item) {
                                      return Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color:
                                                    color.secondaryContainer),
                                            width: 48,
                                            height: 48,
                                            child: Icon(Icons.category),
                                          ),
                                          const HorizontalSpace(spacerM),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Category",
                                                  style: textStyle.labelSmall),
                                              Text(item,
                                                  style: textStyle.bodyLarge),
                                            ],
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.expand_more,
                                            color: color.onSurface,
                                          )
                                        ],
                                      );
                                    }).toList();
                                  },
                                  padding: EdgeInsets.zero,
                                  icon: SizedBox(),
                                  value: controller.category.value,
                                  hint: Text("Data"),
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      controller.category.value = newValue;
                                      print(controller.category.value);
                                    }
                                  },
                                  isExpanded: true,
                                  menuMaxHeight: Get.width,
                                  items: controller.list.map((String category) {
                                    return DropdownMenuItem<String>(
                                      value: category,
                                      child: Text(category,
                                          style: textStyle.bodyLarge),
                                    );
                                  }).toList(),
                                  style: textStyle.bodyLarge,
                                )
                              ],
                            )),
                      ),
                      Container(
                        color: color.background,
                        child: Column(
                          children: [
                            Keyboard.normal(value: controller.amount),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
