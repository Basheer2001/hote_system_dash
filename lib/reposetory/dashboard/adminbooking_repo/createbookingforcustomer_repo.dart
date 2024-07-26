import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';

class CreateBookingForCustomerRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  final MyServices myServices = Get.find<MyServices>();

  Future<AppResponse<String>> createBookingForCustomer({
    required int roomId,
    required String checkInDate,
    required String checkOutDate,
    required int numAdults,
    required int numChildren,
    required String paymentMethod,
  }) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/create/forCustomer",
        {},
        {
          "room_id": roomId,
          "check_in_date": checkInDate,
          "check_out_date": checkOutDate,
          "num_adults": numAdults,
          "num_children": numChildren,
          "payment_method": paymentMethod,
        },
        token: 'Bearer ${myServices.sharedPreferences.getString("token")}',
      );

      if (response.statusCode == 200) {
        return AppResponse<String>(
          success: true,
          data: response.data["data"],
        );
      } else {
        return AppResponse<String>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error creating booking",
        );
      }
    } on dio.DioException catch (e) {
      print("Dio error during booking creation: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during booking creation: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
