import 'package:intl/intl.dart';
import 'package:stream/domain/library.dart';

class CardCenterController extends GetxController {
  //TODO: Implement CardCenterController

  final count = 0.obs;
  double amount = 24420000;

  String formatCurrency(double amount) {
    final currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ');
    String formattedAmount = currencyFormat.format(amount);
    formattedAmount = formattedAmount.substring(0, formattedAmount.length - 3);

    return formattedAmount;
  }

  List<Widget> item() {
    TextTheme textStyle = Theme.of(Get.context!).textTheme;
    ColorScheme color = Theme.of(Get.context!).colorScheme;
    return [
      Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.95, -0.30),
              end: Alignment(-0.95, 0.3),
              colors: [
                Colors.black,
                Color(0xFF494949),
                Color(0xFF262626),
                Colors.black
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.90),
                side: BorderSide(color: color.outline)),
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  const Icon(
                    Icons.stream,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Stream",
                    style:
                        textStyle.displayMedium?.copyWith(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Widgets().svg("Subtract.svg"),
              const SizedBox(height: 10),
              Text(
                "•••• •••• •••• •••• 5678",
                style: textStyle.displaySmall?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("VALID THRU",
                          style: textStyle.bodySmall
                              ?.copyWith(color: Colors.white)),
                      Text("09/24",
                          style: textStyle.bodySmall
                              ?.copyWith(color: Colors.white))
                    ],
                  ),
                  Text(
                    "VISA",
                    style: textStyle.titleMedium?.copyWith(
                        fontStyle: FontStyle.italic, color: Colors.white),
                  )
                ],
              )
            ],
          )),
      Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.95, -0.30),
              end: Alignment(-0.95, 0.3),
              colors: [
                color.primary,
                Color.fromARGB(200, 0, 91, 238),
                Color.fromARGB(172, 0, 91, 238),
                color.primary
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.90),
                side: BorderSide(color: color.outline)),
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  const Icon(
                    Icons.stream,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Stream",
                    style:
                        textStyle.displayMedium?.copyWith(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Widgets().svg("Subtract.svg"),
              const SizedBox(height: 10),
              Text(
                "•••• •••• •••• •••• 5678",
                style: textStyle.displaySmall?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("VALID THRU",
                          style: textStyle.bodySmall
                              ?.copyWith(color: Colors.white)),
                      Text("09/24",
                          style: textStyle.bodySmall
                              ?.copyWith(color: Colors.white))
                    ],
                  ),
                  Text(
                    "VISA",
                    style: textStyle.titleMedium?.copyWith(
                        fontStyle: FontStyle.italic, color: Colors.white),
                  )
                ],
              )
            ],
          )),
      Container(
          padding: const EdgeInsets.all(20),
          height: 200,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              begin: Alignment(0.95, -0.30),
              end: Alignment(-0.95, 0.3),
              colors: [
                Colors.deepOrange,
                Color.fromARGB(188, 255, 86, 34),
                Color.fromARGB(155, 255, 86, 34),
                Colors.deepOrange,
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11.90),
                side: BorderSide(color: color.outline)),
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  const Icon(
                    Icons.stream,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Stream",
                    style:
                        textStyle.displayMedium?.copyWith(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Widgets().svg("Subtract.svg"),
              const SizedBox(height: 10),
              Text(
                "•••• •••• •••• •••• 5678",
                style: textStyle.displaySmall?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("VALID THRU",
                          style: textStyle.bodySmall
                              ?.copyWith(color: Colors.white)),
                      Text("09/24",
                          style: textStyle.bodySmall
                              ?.copyWith(color: Colors.white))
                    ],
                  ),
                  Text(
                    "VISA",
                    style: textStyle.titleMedium?.copyWith(
                        fontStyle: FontStyle.italic, color: Colors.white),
                  )
                ],
              )
            ],
          )),
    ];
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
