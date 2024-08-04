import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';

class UpdateRoomRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<void>> updateRoom({
    required int roomId,
    required String floor,
    required String status,
    required int roomNumber,
    required int roomClassId,
    required double averageRating,
   // required String photo,
    required String view,
  }) async {
    try {
    dio.Response response = await apiProvider.postRequest(
    "${APIProvider.url}dashboard/update/room/$roomId",
    {},
    jsonEncode({
    "floor": floor.toString(),
    "status": status,
    "room_number": roomNumber.toString(),
    "room_class_id": roomClassId.toString(),
    "average_rating": averageRating.toString(),
    //"photo": photo,
      "view" : view
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
