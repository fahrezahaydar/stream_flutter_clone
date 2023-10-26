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
        title: const Text('Card Center'),
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
                    Divider(thickness: 3),
                    Padding(
                      padding: EdgeInsets.all(spacerXl),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Active balance',
                                      style: textStyle.labelLarge),
                                  VerticalSpace(spacerXs),
                                  Text(
                                      controller
                                          .formatCurrency(controller.amount),
                                      style: textStyle.displaySmall),
                                ],
                              ),
                              Spacer(),
                              TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Icon(Icons.lock_outline,
                                          color: color.primary),
                                      HorizontalSpace(spacerXs),
                                      Text(
                                        "Show CVV",
                                        style: textStyle.displaySmall
                                            ?.copyWith(color: color.primary),
                                      ),
                                      HorizontalSpace(spacerS),
                                    ],
                                  ))
                            ],
                          ),
                          VerticalSpace(spacerM),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Single Purchase Limit',
                                      style: textStyle.labelLarge),
                                  VerticalSpace(spacerXs),
                                  Text(
                                      controller
                                          .formatCurrency(controller.amount),
                                      style: textStyle.bodyMedium),
                                ],
                              ),
                              Spacer(),
                              FlatButton.icon(Icons.more_vert,
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      alignment: Alignment.centerRight))
                            ],
                          ),
                          VerticalSpace(spacerM),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('ATM Withdrawn Limit',
                                      style: textStyle.labelLarge),
                                  VerticalSpace(spacerXs),
                                  Text(
                                      controller
                                          .formatCurrency(controller.amount),
                                      style: textStyle.bodyMedium),
                                ],
                              ),
                              Spacer(),
                              FlatButton.icon(Icons.more_vert,
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      alignment: Alignment.centerRight))
                            ],
                          ),
                          VerticalSpace(spacerM),
                          TextButton(
                            onPressed: () {
                              print('Test');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: color.primary),
                                  child:
                                      Icon(Icons.dialpad, color: Colors.white),
                                ),
                                HorizontalSpace(spacerS),
                                Text("Change PIN", style: textStyle.bodyMedium),
                                Spacer()
                              ],
                            ),
                          ),
                          VerticalSpace(spacerM),
                          TextButton(
                            onPressed: () {
                              print('Test');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: color.primary),
                                  child: Icon(Icons.credit_card_off_outlined,
                                      color: Colors.white),
                                ),
                                HorizontalSpace(spacerS),
                                Text("Block Card", style: textStyle.bodyMedium),
                                Spacer()
                              ],
                            ),
                          ),
                          VerticalSpace(spacerM),
                          TextButton(
                            onPressed: () {
                              print('Test');
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: color.primary),
                                  child: Icon(Icons.credit_card,
                                      color: Colors.white),
                                ),
                                HorizontalSpace(spacerS),
                                Text("Change Limit",
                                    style: textStyle.bodyMedium),
                                Spacer()
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}
