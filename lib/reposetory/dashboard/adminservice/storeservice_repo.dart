

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';

class StoreServiceRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<Map<String, dynamic>>> createService({
    required String name,
    required String description,
    required String price,
    required String duration,
  }) async {
    try {
      // Create FormData for the request
      var formData = dio.FormData.fromMap({
        "name": name,
        "description": description,
        "price": price,
        "duration": duration,
      });

      // Make the API request with cookies if available
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/services",
        {},
        formData,
        cookies: APIProvider.cookies?.first,
      );

      // Update cookies if received in response
      APIProvider.cookies = response.headers['set-cookie'];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200 && response.data["status"] == true) {
        return AppResponse<Map<String, dynamic>>(success: true, data: response.data["data"]);
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Service creation failed with status code ${response.statusCode}",
        );
      }
    } catch (e) {
      print("Error during service creation: $e");
      return AppResponse<Map<String, dynamic>>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
