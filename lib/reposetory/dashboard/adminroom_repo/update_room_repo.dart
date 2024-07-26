import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';

class UpdateRoomRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<void>> updateRoom({
    required int roomId,
    required int floor,
    required String status,
    required int roomNumber,
    required int roomClassId,
    required double averageRating,
    required String photo,
  }) async {
    try {
    dio.Response response = await apiProvider.postRequest(
    "${APIProvider.url}dashboard/update/room/$roomId",
    {},
    jsonEncode({
    "floor": floor,
    "status": status,
    "room_number": roomNumber,
    "room_class_id": roomClassId,
    "average_rating": averageRating,
    "photo": photo,
    }),
    );




      if (response.statusCode == 200) {
        return AppResponse<void>(
          success: true,
          data: null,
          errorMessage: response.data['msg'],
        );
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during room update: $e");
      return AppResponse<void>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
