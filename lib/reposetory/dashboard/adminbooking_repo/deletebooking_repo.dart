import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';


/*
class DeleteBookingRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<void>> deleteBooking(String userId) async {
    try {
      dio.Response response = await apiProvider.deleteRequest(
        "${APIProvider.url}dashboard/destroy/bookings/$userId",

        headers: {
          // Add headers if needed
        },
      );

      if (response.statusCode == 200) {
        return AppResponse(success: true);
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Unknown error');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}*/

class DeleteBookingRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<void>> deleteRoom(String userId) async {
    try {
      dio.Response response = await apiProvider.deleteRequest(
        "${APIProvider.url}dashboard/destroy/bookings/$userId",
        headers: {
          // Add headers if needed
        },
      );

      if (response.statusCode == 200) {
        return AppResponse(success: true);
      } else {
        // Improved error handling
        String errorMessage = response.data['error'] ?? 'Unknown error';
        throw Exception('Error: $errorMessage');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
