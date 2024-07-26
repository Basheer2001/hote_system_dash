import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';



class LoginAdminRepo extends GetxService{
  MyServices myServices=Get.find();

  APIProvider apiProvider=Get.find<APIProvider>();

  Future<AppResponse<String>> login(String username, String password) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/login",
        {},
        jsonEncode({
          "email": username,
          "password": password,
        }),
      );

      String token = response.data["data"];
      myServices.sharedPreferences.setString("token", token);

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");
      print("Response token: $token");

      if (response.statusCode == 200) {
        if (response.data != null && response.data["data"] != null) {
          return AppResponse<String>(
            success: true,
            data: response.data["data"],
          );
        } else {
          throw Exception("Token not found in response data");
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioException catch (e) {
      print("Dio error during login: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }


  Future<AppResponse<String>> checkpassword(String password) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}checkPassword",
        {},
        jsonEncode({
          "password": password,
        }),
      );

      String token = response.data["data"];

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");
      print("Response token: $token");

      if (response.statusCode == 200) {
        if (response.data != null && response.data["data"] != null) {
          return AppResponse<String>(
            success: true,
            data: response.data["data"],
          );
        } else {
          throw Exception("Token not found in response data");
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioException catch (e) {
      print("Dio error during login: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during login: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }

/*Future<AppResponse<bool>> logout(String token) async {
    try {
      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}logout",
        null,
        cookie: 'Bearer $token',
      );

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        return AppResponse<bool>(
          success: true,
          data: true,
        );
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioException catch (e) {
      print("Dio error during logout: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during logout: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }*/


}