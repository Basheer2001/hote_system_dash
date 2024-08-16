

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';

class ShowServiceByIdRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  final MyServices myServices = Get.find<MyServices>();

  Future<AppResponse<Map<String, dynamic>>> getServiceById({
    required int serviceId,
  }) async {
    try {
      // Retrieve token from shared preferences
      String? token = myServices.sharedPreferences.getString("token");
      if (token == null) {
        throw Exception("Token is not available.");
      }

      // Perform the GET request
      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/services/$serviceId",
        null, // No query parameters needed
        headers: {'Authorization': 'Bearer $token'},
      );

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        return AppResponse<Map<String, dynamic>>(
          success: true,
          data: response.data['data'],
        );
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: response.data['msg'] ?? "Failed to retrieve service",
        );
      }
    } on dio.DioException catch (e) {
      print("Dio error during service retrieval: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse<Map<String, dynamic>>(
        success: false,
        errorMessage: errorMessage,
      );
    } catch (e) {
      print("Error during service retrieval: $e");
      return AppResponse<Map<String, dynamic>>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
