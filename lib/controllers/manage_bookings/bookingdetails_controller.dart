
import 'package:get/get.dart';

import '../../pages/dashboard_screens/manage_bookings/bookingdetail/bookingmodel.dart';
import '../../reposetory/dashboard/adminbooking_repo/bookingdetail_repo.dart';

//
/*
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
*/
class ShowBookingDetailsController extends GetxController {
  final ShowBookingDetailsRepo bookingDetailsRepo = Get.find<ShowBookingDetailsRepo>();

  var isLoading = false.obs;
  var bookingDetails = Rxn<BookingDetails>();

  Future<void> fetchBookingDetails(int bookingId) async {
    try {
      isLoading.value = true;
      BookingDetails details = await bookingDetailsRepo.showBookingDetails(bookingId);
      bookingDetails.value = details;
    } catch (e) {
      print("Error: $e");
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
