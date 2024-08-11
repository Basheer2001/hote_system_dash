import 'package:dio/dio.dart'as dio;
import 'package:get/get.dart';

import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';

class GetUserProfileRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();
  MyServices myServices=Get.find();

  Future<AppResponse<Map<String, dynamic>>> getUserProfile(int userId) async {
    try {
      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/getProfile/$userId",
        {},
        headers: {
          'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return AppResponse<Map<String, dynamic>>(
          success: true,
          data: response.data,
        );
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error fetching profile data",
        );
      }
    } on dio.DioException catch (e) {
      print("Dio error during profile fetch: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during profile fetch: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
