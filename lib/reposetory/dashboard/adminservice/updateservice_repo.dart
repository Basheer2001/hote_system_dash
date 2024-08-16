
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';


class UpdateServiceRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  final MyServices myServices = Get.find();

  Future<AppResponse<Map<String, dynamic>>> updateService({
    required int serviceId,
    required String name,
    required String description,
    required String price,
    required String duration,
  }) async {
    try {
      String url = "${APIProvider.url}dashboard/services/$serviceId";

      dio.Response response = await apiProvider.putRequest(
        url,
        {}, // No query parameters
        {
          "name": name,
          "description": description,
          "price": price,
          "duration": duration,
        },
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
          errorMessage: response.data["msg"] ?? "Error updating service",
        );
      }
    } on dio.DioException catch (e) {
      print("Dio error during update service: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during update service: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
