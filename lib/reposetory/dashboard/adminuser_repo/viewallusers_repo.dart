import 'package:dio/dio.dart'as dio;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../contsant/sharedprefrences/shared.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';


class ViewAllUsersRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();


  Future<AppResponse<List<Map<String, dynamic>>>> getAllusers() async {
    try {
      String? token = await getToken(); // Retrieve token

      final response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/users",
        {}, // Add query parameters if required
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200 && response.data != null) {
        List<Map<String, dynamic>> usersList = List<Map<String, dynamic>>.from(response.data);
        return AppResponse<List<Map<String, dynamic>>>(
          success: true,
          data: usersList,
        );
      }
      else {
        return AppResponse<List<Map<String, dynamic>>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error fetching users data",
        );
      }
    } on dio.DioError catch (e) {
      print("Dio error during users fetch: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during users fetch: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }}}
