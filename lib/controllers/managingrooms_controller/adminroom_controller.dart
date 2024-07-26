import 'package:dashboardhs/contsant/room/roomclass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../contsant/room/reportroomm.dart';
import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminroom_repo/adminroomgetrepo.dart';



class AdminRoomController extends GetxController {
  final AdminRoomRepo roomDetailsRepository = Get.find<AdminRoomRepo>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController searchTextController = TextEditingController();
  TextEditingController viewTextController = TextEditingController();
  TextEditingController statusTextController = TextEditingController();

  var isLoading = false.obs;
  var roomDetail = Rxn<RoomDetail>();
  var rooms = <RoomDetail>[].obs;

  var roomss = <Roomm>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchRoomDetails(int roomId) async {
    try {
      isLoading.value = true;
      RoomDetail fetchedRoomDetail = await roomDetailsRepository.getRoomDetails(
          roomId);
      roomDetail.value = fetchedRoomDetail;
    } catch (e) {
      print("Error fetching room details: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getAllRooms() async {
    try {
      isLoading.value = true;
      List<RoomDetail> fetchedRooms = await roomDetailsRepository.getAllRooms();
      rooms.assignAll(fetchedRooms);
    } catch (e) {
      print("Error fetching rooms: $e");
    } finally {
      isLoading.value = false;
    }
  }



}