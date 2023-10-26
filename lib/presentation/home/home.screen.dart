// ignore_for_file: prefer_const_constructors

import 'package:stream/domain/library.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Obx(() => Scaffold(
        body: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: <Widget>[
              Home(),
              History(),
              Notification(),
              Profile(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: Get.width,
          decoration: BoxDecoration(color: color.background, boxShadow: [
            BoxShadow(
                color: color.outlineVariant.withOpacity(0.3),
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
                  controller.pageController.animateToPage(
                      controller.selectedIndex.value,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInCirc);
                },
              ),
            ],
          ]),
        )));
  }
}

class Profile extends StatelessWidget {
  Profile({
    super.key,
  });
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(Get.context!).textTheme;
    final color = Theme.of(Get.context!).colorScheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          Widgets().contentHeader(
              color: Colors.transparent,
              icon: Icons.edit,
              title: "Profile",
              onPressed: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: color.outline)),
              width: Get.width - 40,
              child: Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: color.outline, width: 4.0),
                    ),
                    child: const CircleAvatar(
                        radius: 36,
                        backgroundImage:
                            NetworkImage('https://i.pravatar.cc/150?img=12')),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Surya Pamungkas", style: textStyle.displayMedium),
                      const SizedBox(height: 5),
                      Text("@suryapmks", style: textStyle.bodySmall),
                    ],
                  )
                ],
              ),
            ),
          ),
          VerticalSpace(spacerM),
          Widgets().profileMenu('Account Information', onPressed: () {}),
          Widgets().profileMenu('Personal Information', onPressed: () {}),
          Widgets().profileMenu('Device Information', onPressed: () {}),
          Widgets().profileMenu('About', onPressed: () {}),
          PrimaryButton(
            'Log Out',
            onPressed: () => Get.offAllNamed(Routes.LANDING),
          )
        ],
      ),
    );
  }
}

class Notification extends StatelessWidget {
  Notification({
    super.key,
  });
  final controller = Get.find<HomeController>();
  final textStyle = Theme.of(Get.context!).textTheme;
  final color = Theme.of(Get.context!).colorScheme;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Widgets().contentHeader(
                icon: Icons.more_vert,
                title: "Notification & Message",
                onPressed: () {}),
            Row(
              children: [
                TextButton(
                    onPressed: () => controller.changeInfo(0),
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      width: Get.width / 2,
                      child: Text(
                        "Notifications",
                        style: controller.selectedInfo.value == 0
                            ? textStyle.displaySmall
                                ?.copyWith(color: color.primary)
                            : textStyle.displaySmall,
                      ),
                    )),
                TextButton(
                    onPressed: () => controller.changeInfo(1),
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      width: Get.width / 2,
                      child: Text(
                        "Messages",
                        style: controller.selectedInfo.value == 1
                            ? textStyle.displaySmall
                                ?.copyWith(color: color.primary)
                            : textStyle.displaySmall,
                      ),
                    ))
              ],
            ),
            Expanded(
              child: ListView(
                controller: controller.notification,
                children: [
                  if (controller.selectedInfo.value == 0)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                            endIndent: Get.width / 2,
                            thickness: 3,
                            color: color.primary),
                        Container(
                          alignment: Alignment.center,
                          height: 400,
                          width: Get.width,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.notifications_none_outlined,
                                    size: 48, color: color.outlineVariant),
                                const SizedBox(height: 20),
                                Text("There are currently no notifications",
                                    style: textStyle.bodySmall)
                              ]),
                        ),
                      ],
                    ),
                  if (controller.selectedInfo.value == 1)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Divider(
                            indent: Get.width / 2,
                            thickness: 3,
                            color: color.primary),
                        Container(
                          alignment: Alignment.center,
                          height: 400,
                          width: Get.width,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.notifications_none_outlined,
                                    size: 48, color: color.outlineVariant),
                                const SizedBox(height: 20),
                                Text("There are currently no messages",
                                    style: textStyle.bodySmall)
                              ]),
                        ),
                      ],
                    ),
                ],
              ),
            )
          ],
        ));
  }
}

class History extends StatelessWidget {
  History({
    super.key,
  });
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          Widgets().contentHeader(
              icon: Icons.filter_alt,
              title: 'Transaction History',
              onPressed: () {}),
          Padding(
            padding: EdgeInsets.all(spacerM),
            child: Column(
              children: [
                Text("Active Balance", style: textStyle.labelLarge),
                Text(controller.formatCurrency(controller.amount),
                    style: textStyle.displayMedium)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(spacerM),
            child: Column(
              children: [
                for (int i = 0; i < controller.history["data"].length; i++) ...[
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${controller.history["data"][i]["month"]} ${controller.history["year"]}",
                            style: textStyle.labelLarge),
                        VerticalSpace(spacerS),
                        for (int j = 0;
                            j <
                                controller
                                    .history["data"][i]["transaction"].length;
                            j++) ...[
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                                controller.history["data"][i]["transaction"][j]
                                    ["title"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textStyle.bodyLarge),
                            leading: Container(
                                height: 48,
                                width: 48,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: color.secondaryContainer,
                                    borderRadius:
                                        BorderRadius.circular(spacerS)),
                                child: Text(
                                  controller.getFirstAlphabet(
                                      controller.history["data"][i]
                                          ["transaction"][j]["title"]),
                                  style: textStyle.titleSmall
                                      ?.copyWith(color: color.onBackground),
                                )),
                            subtitle: Text(
                                controller.history["data"][i]["transaction"][j]
                                    ["date"],
                                style: textStyle.labelSmall),
                            trailing: Text(
                                "+ ${controller.formatCurrency2(controller.history["data"][i]["transaction"][j]["amount"])}",
                                style: textStyle.displaySmall?.copyWith(
                                    color: controller.history["data"][i]
                                            ["transaction"][j]["plus"]
                                        ? color.tertiary
                                        : Colors.red)),
                          ),
                          VerticalSpace(spacerS),
                        ],
                      ]),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  Home({
    super.key,
  });
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: color.primary,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.formatCurrency(controller.amount),
                            style: textStyle.displayLarge
                                ?.copyWith(color: Colors.white)),
                        VerticalSpace(spacerXs),
                        Text("Active Balance",
                            style: textStyle.displaySmall
                                ?.copyWith(color: Colors.white))
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Widgets().iconTitleBelow("Send",
                        icon: Icons.send,
                        onPressed: () => Get.toNamed(Routes.SEND)),
                    Widgets().iconTitleBelow("Request",
                        icon: Icons.exit_to_app, onPressed: () {}),
                    Widgets().iconTitleBelow("QR Code",
                        icon: Icons.qr_code, onPressed: () {}),
                    Widgets().iconTitleBelow("Card Info",
                        icon: Icons.credit_card,
                        onPressed: () => Get.toNamed(Routes.CARD_CENTER)),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Moneytory", style: textStyle.displaySmall),
                const Spacer(),
                Icon(
                  Icons.chevron_right,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacerM),
            child: Container(
              padding: EdgeInsets.all(spacerM),
              decoration: BoxDecoration(
                  color: color.secondaryContainer,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Expenses", style: textStyle.bodyLarge),
                          VerticalSpace(spacerXs),
                          Text("01 Mar 2021 - 16 Mar 2021",
                              style: textStyle.labelMedium
                                  ?.copyWith(color: Colors.grey.shade400)),
                          VerticalSpace(spacerM),
                          Text("IDR 540.000", style: textStyle.displayMedium),
                        ],
                      ),
                      Spacer(),
                      PieChart(
                        dataMap: controller.dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 16,
                        chartRadius: 80,
                        colorList: controller.colorList,
                        initialAngleInDegree: 0,
                        chartType: ChartType.ring,
                        ringStrokeWidth: 20,
                        legendOptions: LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.right,
                          showLegends: false,
                          legendShape: BoxShape.circle,
                          legendTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: false,
                          showChartValues: false,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                        ),
                        // gradientList: ---To add gradient colors---
                        // emptyColorGradient: ---Empty Color gradient---
                      )
                    ],
                  ),
                  VerticalSpace(spacerM),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < controller.dataMap.length; i++) ...[
                        Container(
                          padding: EdgeInsets.all(spacerS),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(spacerL),
                              color: controller.colorList[i]),
                          child: Text(
                            "${controller.dataMap.values.elementAt(i).toInt()} % ${controller.dataMap.keys.elementAt(i)}",
                            style: textStyle.bodySmall
                                ?.copyWith(color: Colors.white),
                          ),
                        )
                      ]
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Card Info", style: textStyle.displaySmall),
                const Spacer(),
                Icon(
                  Icons.chevron_right,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacerM),
            child: Container(
              padding: EdgeInsets.all(spacerM),
              decoration: BoxDecoration(
                  color: color.secondaryContainer,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Virtual Card", style: textStyle.bodyLarge),
                      leading: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            color: color.primary,
                            borderRadius: BorderRadius.circular(spacerS)),
                        child: Icon(Icons.credit_card, color: Colors.white),
                      ),
                      subtitle: Text(" • • • • 5 6 7 8",
                          style: textStyle.labelMedium),
                      trailing:
                          Text("20.400.000", style: textStyle.displaySmall)),
                  Divider(
                    thickness: 0.5,
                    height: spacerXl,
                    color: color.outlineVariant,
                  ),
                  ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Basic Card", style: textStyle.bodyLarge),
                      leading: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            color: color.primary,
                            borderRadius: BorderRadius.circular(spacerS)),
                        child: Icon(Icons.credit_card, color: Colors.white),
                      ),
                      subtitle: Text(" • • • • 5 6 7 8",
                          style: textStyle.labelMedium),
                      trailing:
                          Text("4.020.000", style: textStyle.displaySmall)),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Last Transaction", style: textStyle.displaySmall),
                const Spacer(),
                Icon(
                  Icons.chevron_right,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacerM),
            child: Container(
              padding: EdgeInsets.all(spacerM),
              decoration: BoxDecoration(
                  color: color.secondaryContainer,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  for (int j = 0; j < 3; j++) ...[
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                          controller.history["data"][0]["transaction"][j]
                              ["title"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle.bodyLarge),
                      leading: Container(
                          height: 48,
                          width: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: color.primary,
                              borderRadius: BorderRadius.circular(spacerS)),
                          child: Text(
                            controller.getFirstAlphabet(controller
                                .history["data"][0]["transaction"][j]["title"]),
                            style: textStyle.titleSmall
                                ?.copyWith(color: Colors.white),
                          )),
                      subtitle: Text(
                          controller.history["data"][0]["transaction"][j]
                              ["date"],
                          style: textStyle.labelSmall),
                      trailing: Text(
                          "+ ${controller.formatCurrency2(controller.history["data"][0]["transaction"][j]["amount"])}",
                          style: textStyle.displaySmall?.copyWith(
                              color: controller.history["data"][0]
                                      ["transaction"][j]["plus"]
                                  ? color.tertiary
                                  : Colors.red)),
                    ),
                    if (j < 2)
                      Divider(
                        thickness: 0.5,
                        height: spacerXl,
                        color: color.outlineVariant,
                      ),
                  ],
                ],
              ),
            ),
          ),
          VerticalSpace(spacerM)
        ],
      ),
    );
  }
}
