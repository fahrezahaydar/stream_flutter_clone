import 'package:stream/domain/library.dart';

class PersonalInfoController extends GetxController {
  //TODO: Implement PersonalInfoController

  Rx<DateTime> selectedDate = DateTime.now().obs;
  TextEditingController dateOfBirth = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController place = TextEditingController();
  TextEditingController address = TextEditingController();

  void selectDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      dateOfBirth.text = "${picked.toLocal()}".split(' ')[0];
    }
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

  RxString selectedGender = 'Male'.obs; // Default selected gender

  List<String> genders = ['Male', 'Female'];

  void changeGender(String newGender) {
    selectedGender.value = newGender;
  }

  void showGenderDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Gender'),
          content: DropdownButton<String>(
            value: selectedGender.value,
            onChanged: (String? newValue) {
              if (newValue != null) {
                changeGender(newValue);
                Get.back(); // Close the dialog
              }
            },
            items: genders.map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
