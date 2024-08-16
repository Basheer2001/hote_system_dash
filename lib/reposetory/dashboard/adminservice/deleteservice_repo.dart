

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';

class DeleteServiceRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  final MyServices myServices = Get.find();

  Future<AppResponse<void>> deleteService(int serviceId) async {
    try {
      dio.Response response = await apiProvider.deleteRequest(
        "${APIProvider.url}dashboard/services/$serviceId",
        headers: {
          'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
      );

      if (response.statusCode == 200) {
        // Success response
        return AppResponse(success: true);
      } else if (response.statusCode == 400) {
        // Client error
        return AppResponse(success: false, errorMessage: response.data['error'] ?? 'Bad request');
      } else if (response.statusCode == 500) {
        // Server error
        return AppResponse(success: false, errorMessage: 'Server error');
      } else {
        // Unknown error
        return AppResponse(success: false, errorMessage: 'Unknown error');
      }
    } catch (e) {
      // Catch any other exceptions
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
