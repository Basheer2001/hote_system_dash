import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../contsant/room/reportroomm.dart';
import '../../../contsant/room/roomclass.dart';
import '../../../contsant/sharedprefrences/shared.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';


class AdminRoomRepo extends GetxService {
  final APIProvider apiProvider = APIProvider(); // Assuming APIProvider setup correctly

  Future<RoomDetail> getRoomDetails(int roomId) async {
    try {
      String? token = await getToken(); // Retrieve token

      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}getRoomDetails/$roomId",
        {}, // Add query parameters if required
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200 && response.data['status']) {
        return RoomDetail.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch room details');
      }
    } catch (e) {
      print("Error fetching room details: $e");
      throw e;
    }
  }

  Future<List<RoomDetail>> getAllRooms() async {
    try {
      String? token = await getToken(); // Retrieve token

      final response = await apiProvider.getRequest(
        "${APIProvider.url}getAllRooms",
        {}, // Add query parameters if required
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200 && response.data['status']) {
        List<dynamic> roomsJson = response.data;
        return roomsJson.map((json) => RoomDetail.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch rooms');
      }
    } catch (e) {
      print("Error fetching rooms: $e");
      throw e;
    }
  }



}