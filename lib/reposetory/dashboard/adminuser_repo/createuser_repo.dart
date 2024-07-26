import 'dart:io'; // Import the 'dart:io' library
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';





class CreateUserRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();
  MyServices myServices=Get.find();

  Future<AppResponse<Map<String, dynamic>>> createUser({
    required String firstname,
    required String lastname,
    required String password,
    required String confirmation,
    required String address,
    required String personalid,
    required String phone,
    required String bio,
    required String permissionid,
    required String email,
    File? photo,
  }) async {
    try {
      // Create FormData for the request
      var formData = dio.FormData.fromMap({
        "first_name": firstname,
        "last_name": lastname,
        "password": password,
        "password_confirmation": confirmation,
        "address": address,
        "personal_id": personalid,
        "phone": phone,
        "bio": bio,
        "permission_id": permissionid,
        "email": email,
        if (photo != null) 'photo': await dio.MultipartFile.fromFile(photo.path),
      });

      // Make the API request with cookies if available
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/create/user",
        {},
        formData,
        cookies: APIProvider.cookies?.first,
      );

      // Update cookies if received in response
      APIProvider.cookies = response.headers['set-cookie'];

      String token = response.data["data"];
      myServices.sharedPreferences.setString("token", token);
      APIProvider.token = token;

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");
      print("Response token: $token");
      print("Response cookies: ${APIProvider.cookies}");

      if (response.statusCode == 200) {
        return AppResponse<Map<String, dynamic>>(success: true);
      } else {
        return AppResponse<Map<String, dynamic>>(
          success: false,
          errorMessage: "Registration request failed with status code ${response.statusCode}",
        );
      }
    } catch (e) {
      print("Error during registration: $e");
      return AppResponse<Map<String, dynamic>>(
        success: false,
        errorMessage: e.toString(),
      );
    }
  }
}
