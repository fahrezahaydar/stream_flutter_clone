// ignore_for_file: prefer_const_constructors

import 'package:stream/domain/library.dart';
import 'controllers/card_center.controller.dart';
import 'package:stream/infrastructure/config/sizes.dart';

class CardCenterScreen extends GetView<CardCenterController> {
  const CardCenterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Info'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Obx(() => SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VerticalSpace(spacerM),
                    CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          controller.count.value = index;
                          print(controller.item().length);
                        },
                      ),
                      items: controller.item(),
                    ),
                    VerticalSpace(spacerM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < controller.item().length; i++) ...[
                          if (controller.count.value != i)
                            Container(
                                height: 5,
                                width: 5,
                                decoration: ShapeDecoration(
                                    shape: const CircleBorder(),
                                    color: color.outlineVariant)),
                          if (controller.count.value == i)
                            Container(
                                height: 5,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: color.outlineVariant)),
                          if (i != controller.item().length - 1)
                            HorizontalSpace(spacerXs)
                        ]
                      ],
                    ),
                    VerticalSpace(spacerM),
                    Divider(
                      thickness: 3,
                      color: color.outline,
                    ),
                    Padding(
                      padding: EdgeInsets.all(spacerXl),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('Active balance',
                                style: textStyle.labelLarge),
                            subtitle: Text(
                                controller.formatCurrency(controller.amount),
                                style: textStyle.displaySmall),
                            trailing: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Show CVV",
                                  style: textStyle.displaySmall
                                      ?.copyWith(color: color.primary),
                                )),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('Single Purchase Limit',
                                style: textStyle.labelLarge),
                            subtitle: Text(
                                controller.formatCurrency(controller.amount),
                                style: textStyle.bodyMedium),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text('ATM Withdrawn Limit',
                                style: textStyle.labelLarge),
                            subtitle: Text(
                                controller.formatCurrency(controller.amount),
                                style: textStyle.bodyMedium),
                          ),
                          VerticalSpace(spacerM),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              print('Test1');
                            },
                            leading: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: color.primary),
                              child: Icon(Icons.dialpad, color: Colors.white),
                            ),
                            title:
                                Text("Change PIN", style: textStyle.bodyMedium),
                          ),
                          VerticalSpace(spacerM),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              print('Test12');
                            },
                            leading: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: color.primary),
                              child: Icon(Icons.credit_card_off_outlined,
                                  color: Colors.white),
                            ),
                            title:
                                Text("Block Card", style: textStyle.bodyMedium),
                          ),
                          VerticalSpace(spacerM),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {
                              print('Test12');
                            },
                            leading: Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: color.primary),
                              child:
                                  Icon(Icons.credit_card, color: Colors.white),
                            ),
                            title: Text("Change Limit",
                                style: textStyle.bodyMedium),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}
