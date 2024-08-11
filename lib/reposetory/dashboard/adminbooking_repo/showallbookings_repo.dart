import 'package:get/get.dart';
import '../../../pages/dashboard_screens/manage_bookings/showallbookings/showallbookingsclass.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';


class ShowAllBookingsRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  final MyServices myServices = Get.find<MyServices>();

  Future<List<Booking>> showallBookings() async {
    try {
      String? token = myServices.getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/bookings",
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
       // List<dynamic> bookingsJson = response.data['msg']['bookings'];
        print('asdfggggggggggggggggggggg');
        List<dynamic> bookingsJson = response.data['data'];
        print('asdfggggggggggggggggggggg');

        print("Bookings JSON: $bookingsJson"); // Debug print
        print('asdfggggggggggggggggggggg');
        print('asdfaaaaaaaaaaaaaaaaaaaa');

        return bookingsJson.map((json) => Booking.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch bookings');
      }
    } catch (e) {
      print("Error fetching bookings: $e");
      throw e;
    }
  }
}
