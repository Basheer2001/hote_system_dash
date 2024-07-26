import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';


class SearchUserByNameRepo extends GetxService{

  APIProvider apiProvider=Get.find<APIProvider>();
  MyServices myServices=Get.find();


  Future<AppResponse<List<Map<String, dynamic>>>> searchUsersByName(String name) async {
  try {
    String? token = myServices.getToken();
    if (token == null) {
      return AppResponse<List<Map<String, dynamic>>>(
        success: false,
        errorMessage: "Token not found",
      );
    }

    dio.Response response = await apiProvider.getRequest(
      "${APIProvider.url}dashboard/search",
      {
        'search': name,
      },
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200 && response.data != null) {
      List<Map<String, dynamic>> userList = List<Map<String, dynamic>>.from(response.data["data"]);
      return AppResponse<List<Map<String, dynamic>>>(
        success: true,
        data: userList,
      );
    } else {
      return AppResponse<List<Map<String, dynamic>>>(
        success: false,
        errorMessage: response.data["msg"] ?? "Error searching users",
      );
    }
  } on dio.DioError catch (e) {
    print("Dio error during user search: $e");
    String errorMessage = "Network error occurred";
    if (e.response != null) {
      errorMessage = "Server error: ${e.response!.statusCode}";
    }
    return AppResponse(success: false, errorMessage: errorMessage);
  } catch (e) {
    print("Error during user search: $e");
    return AppResponse(success: false, errorMessage: e.toString());
  }
}
}