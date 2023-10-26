import 'package:stream/domain/library.dart';
import 'package:intl/intl.dart';

class SendController extends GetxController {
  //TODO: Implement SendController

  RxInt amount = 0.obs;
  RxString category = 'Other'.obs;
  List<String> list = [
    "Food & Drink",
    "Groceries",
    "Entertainment",
    "Shopping",
    "Transportation",
    "Utilities",
    "Healthcare",
    "Travel",
    "Education",
    "Beverages",
    "Dining Out",
    "Home & Rent",
    "Gifts & Donations",
    "Personal Care",
    "Other"
  ];
  String formatCurrency(int amount) {
    final currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ');
    String formattedAmount = currencyFormat.format(amount);
    formattedAmount = formattedAmount.substring(0, formattedAmount.length - 3);

    return formattedAmount;
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
}
