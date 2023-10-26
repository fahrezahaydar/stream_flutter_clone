import 'package:stream/domain/library.dart';

import 'controllers/personal_info.controller.dart';

class PersonalInfoScreen extends GetView<PersonalInfoController> {
  const PersonalInfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              IconButton(icon: const Icon(Icons.help_outline), onPressed: () {})
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Widgets().header(
                          title: "Personal Info",
                          subtitle:
                              "Personal information is used for registration and validation Stream"),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamTextField(
                              title: "Full Name",
                              controller: controller.fullName,
                              hintText: "Example : Surya Pamungkas",
                            ),
                            const VerticalSpace(20),
                            StreamTextField(
                              title: "Place of Birth",
                              controller: controller.place,
                              hintText: "Example : Kota Yogyakarta",
                            ),
                            const VerticalSpace(20),
                            StreamTextField(
                              title: "Date of Birth",
                              readOnly: true,
                              controller: controller.dateOfBirth,
                              hintText: "Example : 2000-10-10",
                              onTap: () => controller.selectDate(context),
                            ),
                            const VerticalSpace(20),
                            Widgets().gender(
                                title: "Gender",
                                value: controller.selectedGender.value,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    controller.changeGender(newValue);
                                  }
                                },
                                list: controller.genders),
                            const VerticalSpace(20),
                            StreamTextField(
                              title: "Address",
                              controller: controller.address,
                              hintText: "Example : Kota Yogyakarta",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                'Continue',
                onPressed: () {
                  Get.toNamed(Routes.CREATE_PIN);
                },
              )
            ],
          ),
        ));
  }
}
