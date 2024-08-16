import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';

class UpdateRoomRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  MyServices myServices=Get.find();


 int  roomId=2;
  Future<AppResponse<void>> updateRoom(
     String? floor,
     String? status,
     String ?roomNumber,
    String ?roomClassId,
     String? averageRating,
      File?photo,
      String? view
  ) async
  {
    print("\n1");
    try {
      APIProvider.cookies = null;


      var formData = dio.FormData.fromMap({
        "floor": floor,
        "status": status,
        "roomNumber": roomNumber,
        "roomClassId": roomClassId,
        "averageRating": averageRating,
        'photo': await dio.MultipartFile.fromFile(photo!.path),

      'view': view
       //   "floor": 'GF',
       //  "status": 'booked',
       //  "roomNumber": '2',
       //  "roomClassId": '2',
       //  "averageRating": '0.00',
       // // "photo": photo,
       //  'view': 'garden'


      });


      dio.Response response = await apiProvider.postRequest(
          "${APIProvider.url}dashboard/update/room/$roomId",
          {},
          formData, // Pass formData instead of jsonEncode
          token: myServices.sharedPreferences.getString("token"),

      );
      print("\n2");

      if (response.statusCode == 200) {
        if (response.data != null) {
          return AppResponse<String>(
            success: true,
            //data: response.data["data"],
          );
        } else {
          throw Exception("Token not found in response data");
        }
      } else {
        throw Exception(
            "Server responded with status code ${response.statusCode}");
      }
    } on dio.DioException catch (e) {
      print("Dio error : $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error : $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}

/* Future<AppResponse<void>> updateRoom({
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
  }*/
