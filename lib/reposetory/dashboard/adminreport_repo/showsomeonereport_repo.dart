import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';

class ShowSomeonereportRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>(); // Assuming you have an APIProvider setup
  MyServices myServices=Get.find();

  Future<AppResponse<List<Map<String, dynamic>>>> getUserReports(int userId) async {
    try {
      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/users/$userId/reports",
        {},
        headers: {
          'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
          'Content-Type': 'application/json',// Adjust as per your authentication service
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        List<Map<String, dynamic>> reportsList = List<Map<String, dynamic>>.from(response.data["data"]);
        return AppResponse<List<Map<String, dynamic>>>(
          success: true,
          data: reportsList,
        );
      } else {
        return AppResponse<List<Map<String, dynamic>>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error fetching user reports",
        );
      }
    } catch (e) {
      print("Error during user reports fetch: $e");
      return AppResponse<List<Map<String, dynamic>>>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
