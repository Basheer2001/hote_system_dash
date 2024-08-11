import 'dart:convert';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/bookingclass.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';

class SearchBookingsRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<List<Booking>>> searchBookings(String roomId) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/search/bookings",
        {},
        jsonEncode({"room_id": "2"}),
      );

      if (response.statusCode == 200 && response.data != null) {
        List<dynamic> bookingsJson = response.data;
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
}
