
import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../pages/dashboard_screens/managing_rooms/serachroomclass.dart';
import '../../../providers/apiprovider.dart';

class CDRoomRepo extends GetxService {
  final APIProvider apiProvider = APIProvider();

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
    required int roomClassId,
    required String photo,
    required String view,
  }) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/create/rooms", // Adjust endpoint as per your API
        {},
        jsonEncode({
          "floor": floor,
          "status": status,
          "room_number": roomNumber,
          "room_class_id": roomClassId,
          "photo": photo,
          "view": view,
        }),

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
