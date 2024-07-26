import 'package:get/get.dart';
import '../../pages/dashboard_screens/manage_bookings/bookingclass.dart';
import '../../reposetory/dashboard/adminbooking_repo/deletebooking_repo.dart';


class DeleteBookingController extends GetxController {
  final DeleteBookingRepo bookingRepo = Get.find<DeleteBookingRepo>();

  var isLoading = false.obs;
  var bookings = <Booking>[].obs;

  @override
  void onInit() {
    super.onInit();
  }


  Future<void> deleteBooking(int bookingId) async {
    try {
      isLoading.value = true;
      await bookingRepo.deleteBooking(bookingId);
      bookings.removeWhere((booking) => booking.id == bookingId.toString());
    } catch (e) {
      print("Error deleting booking: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
