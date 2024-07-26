import 'package:get/get.dart';
import '../../pages/dashboard_screens/manage_bookings/bookingclass.dart';
import '../../reposetory/dashboard/adminbooking_repo/showallbookings_repo.dart';

class ShowAllBookingsController extends GetxController {
  final ShowAllBookingsRepo bookingRepo = Get.find<ShowAllBookingsRepo>();

  var isLoading = false.obs;
  var bookings = <Booking>[].obs;

  @override
  void onInit() {
    showallBookings();
    super.onInit();
  }

  Future<void> showallBookings() async {
    try {
      isLoading.value = true;
      List<Booking> bookingsList = await bookingRepo.showallBookings();
      print("Fetched bookings: $bookingsList");
      bookings.assignAll(bookingsList);
    } catch (e) {
      print("Error fetching bookings: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
