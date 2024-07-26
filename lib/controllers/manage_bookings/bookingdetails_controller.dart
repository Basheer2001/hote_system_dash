
import 'package:get/get.dart';

import '../../pages/dashboard_screens/manage_bookings/bookingclass.dart';
import '../../reposetory/dashboard/adminbooking_repo/bookingdetail_repo.dart';


class BookingDetailsController extends GetxController {
  final BookingDetailsRepo bookingDetailsRepo = Get.find<BookingDetailsRepo>();


  var isLoading = false.obs;
  var bookingDetails = Rxn<Booking>();

  Future<void> fetchBookingDetails(int bookingId) async {
    try {
      isLoading.value = true;
      Booking booking = await bookingDetailsRepo.getBookingDetails(bookingId);
      print("Fetched booking details: $booking");
      bookingDetails.value = booking;
    } catch (e) {
      print("Error fetching booking details: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
