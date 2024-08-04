import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';
import '../adminprofile_repo/adminprofilerepo.dart';


class BanUnbanRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();
  MyServices myServices=Get.find();
  Future<AppResponse<Map<String, dynamic>>> banUser(String userId) async {
    return await _changeUserStatus(userId, 'ban');
  }

  Future<AppResponse<Map<String, dynamic>>> unbanUser(String userId) async {
    return await _changeUserStatus(userId, 'unban');
  }

  Future<AppResponse<Map<String, dynamic>>> _changeUserStatus(String userId, String action) async {
    try {
      String url = "${APIProvider.url}dashboard/users/$userId/$action";
      dio.Response response = await apiProvider.putRequest(
        url,
        {},
        null, // Assuming no body is required
        // headers: {
        //   'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
        //   'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
        // },
      );

      if (response.statusCode == 200 && response.data != null) {
        return AppResponse<Map<String, dynamic>>(
          success: true,
          data: response.data,
        );
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: response.data["msg"] ?? "Error $action user",
        );
      }
    } on Exception catch (e) {
      print("Error during $action user: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
