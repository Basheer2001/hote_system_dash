
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../pages/dashboard_screens/managing_rooms/serachroomclass.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';

class CDRoomRepo extends GetxService {
  final APIProvider apiProvider = APIProvider();
  MyServices myServices=Get.find();

  Future<AppResponse<void>> deleteRoom(int roomId) async {
    try {
      dio.Response response = await apiProvider.deleteRequest(
        "${APIProvider.url}dashboard/rooms/$roomId",
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        return AppResponse<void>(success: true, data: null);
      } else {
        throw Exception("Failed to delete the room");
      }
    } catch (e) {
      return AppResponse<void>(success: false, errorMessage: e.toString());
    }
  }

  Future<AppResponse<Room>> createRoom({
    required String floor,
    required String status,
    required String roomNumber,
    required String roomClassId,
    required  File?photo,

  required String view,
  }) async {
    try {
      var formData = dio.FormData.fromMap({
        "floor": floor,
        "status": status,
        "room_number": roomNumber,
        "room_class_id": roomClassId,
        'photo': await dio.MultipartFile.fromFile(photo!.path),
        "view": view,
        // "floor": '1F',
        // "status": 'available',
        // "room_number": '1233',
        // "room_class_id": '2',
        // 'photo': await dio.MultipartFile.fromFile(photo!.path),
        // "view": 'sea',


      });
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/create/rooms", // Adjust endpoint as per your API
        {},
        // jsonEncode({
        //   "floor": floor,
        //   "status": status,
        //   "room_number": roomNumber,
        //   "room_class_id": roomClassId,
        //   "photo": photo,
        //   "view": view,
        // }),
        formData,
        token: myServices.getToken()

      );

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200 && response.data['status'] == true) {
        Room room = Room.fromJson(response.data['data']);
        return AppResponse<Room>(success: true, data: room);
      } else {
        throw Exception("Failed to create room: ${response.data['msg']}");
      }
    } catch (e) {
      print("Error during room creation: $e");
      return AppResponse<Room>(success: false, errorMessage: e.toString());
    }
  }

}
