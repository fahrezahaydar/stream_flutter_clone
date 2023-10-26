import 'package:intl/intl.dart';
import 'package:stream/domain/library.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  TextEditingController email = TextEditingController();
  double amount = 24420000;

  String formatCurrency(double amount) {
    final currencyFormat =
        NumberFormat.currency(locale: 'id_ID', symbol: 'IDR ');
    String formattedAmount = currencyFormat.format(amount);
    formattedAmount = formattedAmount.substring(0, formattedAmount.length - 3);

    return formattedAmount;
  }

  String formatCurrency2(int amount) {
    double test = amount.toDouble();
    final currencyFormat = NumberFormat.currency(locale: 'id_ID', symbol: '');
    String formattedAmount = currencyFormat.format(test);
    formattedAmount = formattedAmount.substring(0, formattedAmount.length - 3);

    return formattedAmount;
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
  }

  void changeInfo(int index) {
    selectedInfo.value = index;
  }

  RxInt selectedIndex = 0.obs;
  RxInt selectedInfo = 0.obs;
  PageController pageController = PageController();
  ScrollController profile = ScrollController();
  ScrollController home = ScrollController();
  ScrollController notification = ScrollController();

  final count = 0.obs;
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
    pageController.dispose();
  }

  void increment() => count.value++;

  Map<String, double> dataMap = {
    "Entertaiment": 78,
    "Food": 16,
    "Top Up": 6,
  };

  List<Color> colorList = [
    Color(0xFFF86F34),
    Color(0xFF005CEE),
    Color(0xFFFFB731),
  ];

  List<IconData> listIcon = [
    Icons.home,
    Icons.sync_alt,
    Icons.notifications,
    Icons.person
  ];

  List<String> getTitleAlphabet(Map<String, dynamic> history) {
    List<String> titleAlphabet = [];
    if (history.containsKey("data") && history["data"] is List) {
      for (var entry in history["data"]) {
        if (entry is Map &&
            entry.containsKey("title") &&
            entry["title"] is String) {
          String title = entry["title"];
          // Get the first alphabet from the title
          String firstAlphabet = getFirstAlphabet(title);
          if (firstAlphabet.isNotEmpty) {
            titleAlphabet.add(firstAlphabet);
          }
        }
      }
    }
    return titleAlphabet;
  }

  String getFirstAlphabet(String input) {
    for (var character in input.runes) {
      var char = String.fromCharCode(character);
      if (RegExp(r'[A-Za-z]').hasMatch(char)) {
        return char;
      }
    }
    return '';
  }

  Map<String, dynamic> history = {
    "year": 2023,
    "data": [
      {
        "month": "Mar",
        "transaction": [
          {
            "date": "12 Mar 2021",
            "title": "Settlement",
            "plus": true,
            "amount": 32123
          },
          {
            "date": "10 Mar 2021",
            "title": "Google Play - Mobile Legend Bang Bang",
            "plus": false,
            "amount": 80000
          },
          {
            "date": "9 Mar 2021",
            "title": "Nohan Putra",
            "plus": true,
            "amount": 150000
          },
        ],
      },
      {
        "month": "Feb",
        "transaction": [
          {
            "date": "24 Feb 2021",
            "title": "Settlement",
            "plus": true,
            "amount": 32123
          },
          {
            "date": "20 Feb 2021",
            "title": "Google Play - Mobile Legend Bang Bang",
            "plus": false,
            "amount": 80000
          },
          {
            "date": "19 Feb 2021",
            "title": "Nohan Putra",
            "plus": true,
            "amount": 150000
          },
          {
            "date": "17 Feb 2021",
            "title": "Aruni Putri",
            "plus": true,
            "amount": 240000
          },
          {
            "date": "13 Feb 2021",
            "title": "Nohan Putra",
            "plus": true,
            "amount": 150000
          },
        ],
      }
    ]
  };
}
