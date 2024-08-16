import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../pages/dashboard_screens/manage_bookings/searchbooking/searchbookingmodel.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';




/*
class SearchBookingsRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();
  MyServices myServices = Get.find();

  Future<AppResponse<List<Map<String, dynamic>>>> searchBookingsByRoomId(int roomId) async {
    try {
      String? token = myServices.getToken();
      if (token == null) {
        return AppResponse<List<Map<String, dynamic>>>(
          success: false,
          errorMessage: "Token not found",
        );
      }

      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/search/bookings",
        {}, // Empty queryParams if not needed
        {'room_id': roomId}, // Body parameter
        token: token, // Pass the token as a named parameter
      );

      if (response.statusCode == 200 && response.data != null) {
        List<Map<String, dynamic>> bookingsList = List<Map<String, dynamic>>.from(response.data["data"]);
        return AppResponse<List<Map<String, dynamic>>>(
          success: true,
          data: bookingsList,
        );
      } else {
        return AppResponse<List<Map<String, dynamic>>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error retrieving bookings",
        );
      }
    } on dio.DioError catch (e) {
      print("Dio error during bookings search: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during bookings search: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
*/

class BookingSearchRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<List<Booking>>> searchBookings(int roomId) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/search/bookings",
        {},
        jsonEncode({"room_id": roomId}),
      );

      if (response.statusCode == 200) {
        List<dynamic> bookingsJson = response.data['data'];
        List<Booking> bookings = bookingsJson.map((json) => Booking.fromJson(json)).toList();
        return AppResponse<List<Booking>>(success: true, data: bookings);
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } catch (e) {
      print("Error during booking search: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}




/*class SearchBookingsRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<List<Booking>>> searchBookings(String roomId) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/search/bookings",
        {},
        jsonEncode({"room_id": roomId}),
      );

      if (response.statusCode == 200 && response.data != null) {
        List<dynamic> bookingsJson = response.data['data'];
        List<Booking> bookings = bookingsJson.map((json) => Booking.fromJson(json)).toList();
        return AppResponse<List<Booking>>(success: true, data: bookings);
      } else {
        return AppResponse<List<Booking>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error searching bookings",
        );
      }
    } catch (e) {
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}*/