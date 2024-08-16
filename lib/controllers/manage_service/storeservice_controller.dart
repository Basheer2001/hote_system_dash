
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminservice/storeservice_repo.dart';

class StoreServiceController extends GetxController {
  final StoreServiceRepo createServiceRepo = Get.find<StoreServiceRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  TextEditingController priceTextController = TextEditingController();
  TextEditingController durationTextController = TextEditingController();

  var firstSubmit = false.obs;
  var createServiceLoadingState = false.obs;

  void createService() async {
    firstSubmit.value = true;
    if (formKey.currentState!.validate()) {
      createServiceLoadingState.value = true;

      AppResponse<Map<String, dynamic>> response = await createServiceRepo.createService(
        name: nameTextController.text,
        description: descriptionTextController.text,
        price: priceTextController.text,
        duration: durationTextController.text,
      );

      createServiceLoadingState.value = false;

      if (response.success) {
        Get.defaultDialog(
          title: "Success",
          content: Text("Service created successfully"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        );
      } else {
        Get.defaultDialog(
          title: "Error",
          content: Text(response.errorMessage ?? "Unknown error occurred"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        );
      }
    }
  }
}
