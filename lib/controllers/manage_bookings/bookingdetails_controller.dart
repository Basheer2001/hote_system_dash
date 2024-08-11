
import 'package:get/get.dart';

import '../../pages/dashboard_screens/manage_bookings/bookingclass.dart';
import '../../reposetory/dashboard/adminbooking_repo/bookingdetail_repo.dart';

//
class AdminBookingController extends GetxController {
  final AdminBookingRepo bookingRepo = Get.find<AdminBookingRepo>();

  var isLoading = false.obs;
  var bookingDetail = Rxn<Booking>();

  Future<void> fetchBookingDetails(int bookingId) async {
    try {
      isLoading.value = true;
      Booking fetchedBookingDetail = await bookingRepo.getBookingDetails(bookingId);
      bookingDetail.value = fetchedBookingDetail;
    } catch (e) {
      print("Error fetching booking details: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
