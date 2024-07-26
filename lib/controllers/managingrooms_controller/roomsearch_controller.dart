import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../models/appresponse.dart';
import '../../pages/dashboard_screens/managing_rooms/serachroomclass.dart';
import '../../reposetory/dashboard/adminroom_repo/searchroom_repo.dart';



class RoomSearchController extends GetxController {
  RoomSearchRepo roomSearchRepo = Get.find<RoomSearchRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchTextController = TextEditingController();
  TextEditingController viewTextController = TextEditingController();
  TextEditingController statusTextController = TextEditingController();


  var isLoading = false.obs;
  var rooms = <Room>[].obs;

  void searchRooms() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      String search = searchTextController.text;
      String view = viewTextController.text;
     String status=statusTextController.text;

      AppResponse<List<Room>> response = await roomSearchRepo.searchRooms(
        search,
        view,
        status,
      );

      isLoading.value = false;

      if (response.success) {
        rooms.assignAll(response.data!);
      } else {
        Get.defaultDialog(
          title: "Error",
          content: Text(response.errorMessage!),
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
