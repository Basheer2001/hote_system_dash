import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../pages/dashboard_screens/managing_rooms/serachroomclass.dart';
import '../../../providers/apiprovider.dart';

class RoomSearchRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();
  Future<AppResponse<List<Room>>> searchRooms(
      String search,
      String view,
      String status,
      ) async {
    print("\n1");

    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}searchRooms",
        {},
        jsonEncode({
          "search": search,
          "view": view,
          "status":status,
        }),
      );
      print("\n2");

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      print("Response header: ${response.headers}");
      print("Response header: ${response}");
      // cookie = response.headers['set-cookie'];

      if (response.statusCode == 200) {
        List<dynamic> roomsJson = response.data;
        List<Room> rooms = roomsJson.map((json) => Room.fromJson(json))
            .toList();
        return AppResponse<List<Room>>(success: true, data: rooms);
      } else {
        throw Exception(
            "Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }




}