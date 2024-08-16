import 'package:dio/dio.dart'as dio;
import 'package:get/get.dart';

import '../../../contsant/sharedprefrences/shared.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';

class IndexServicesRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<AppResponse<List<Map<String, dynamic>>>> getAllServices() async {
    try {
      String? token = await getToken(); // Retrieve token

      final response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/services",
        {}, // Add query parameters if required
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200 && response.data != null) {
        List<Map<String, dynamic>> servicesList = List<Map<String, dynamic>>.from(response.data["data"]);
        return AppResponse<List<Map<String, dynamic>>>(
          success: true,
          data: servicesList,
        );
      } else {
        return AppResponse<List<Map<String, dynamic>>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error fetching services data",
        );
      }
    } on dio.DioError catch (e) {
      print("Dio error during services fetch: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during services fetch: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
