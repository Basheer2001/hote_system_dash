import 'dart:convert';
import 'package:dashboardhs/pages/dashboard_screens/manage_bookings/bookingclass.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';

class SearchBookingsRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();
  Future<AppResponse<List<Booking>>> searchBookings(
      String user_id,
      String room_id,
      String check_in_date,
      String check_out_date,
      String payment_status,
      String payment_method,
      ) async {
    print("\n1");

    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/search/bookings",
        {},
        jsonEncode({
          "user_id": user_id,
          "room_id": room_id,
          "check_in_date":check_in_date,
          "check_out_date":check_out_date,
          "payment_status":payment_status,
          "payment_method":payment_method,
        }),
      );
      print("\n2");
      APIProvider.cookies = response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      print("Response cookies: ${ APIProvider.cookies}");
      print("Response header: ${response.headers}");
      print("Response header: ${response}");
      // cookie = response.headers['set-cookie'];

      if (response.statusCode == 200) {
        List<dynamic> roomsJson = response.data['data'];
        List<Booking> book = roomsJson.map((json) => Booking.fromJson(json))
            .toList();
        return AppResponse<List<Booking>>(success: true, data: book);
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