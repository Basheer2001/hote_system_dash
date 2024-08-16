

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';

class PaymentStatusRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();
  MyServices myServices = Get.find();

  Future<AppResponse<Map<String, dynamic>>> updatePaymentStatus(String bookingId, String paymentStatus) async {
    try {
      String url = "${APIProvider.url}dashboard/bookings/$bookingId/payment-status";
      dio.Response response = await apiProvider.putRequest(
        url,
        {"payment_status": paymentStatus},
        null, // Assuming no additional headers are required
      );

      if (response.statusCode == 200 && response.data != null) {
        return AppResponse<Map<String, dynamic>>(
          success: true,
          data: response.data,
        );
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error updating payment status",
        );
      }
    } on Exception catch (e) {
      print("Error during payment status update: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
