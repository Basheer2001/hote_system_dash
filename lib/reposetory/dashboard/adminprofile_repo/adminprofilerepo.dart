

import 'dart:io';

import 'package:get/get.dart';
import 'package:dio/dio.dart'as dio;
import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';



class AdminProfileRepo extends GetxService{

  MyServices myServices=Get.find();
  APIProvider apiProvider=Get.find<APIProvider>();

  Future<AppResponse<Map<String, dynamic>>> MyProfile() async {
    try {
      dio.Response response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/myProfile",
        {},
        headers: {
          'Authorization': 'Bearer ${myServices.sharedPreferences.getString("token")}',
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        return AppResponse<Map<String, dynamic>>(
          success: true,
          data: response.data["data"],
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


  Future<AppResponse<String>> updateprofile(
      String firstname,
      String lastname,
      String number ,
      String newpassword ,
      String newpasswordconfirmation,
      String currentpassword,
      String address,
      {File?photo}
      ) async {
    print("\n1");
    try {
      APIProvider.cookies=null;


      var formData = dio.FormData.fromMap({
        "first_name": firstname,
        "last_name": lastname,
        "number":number,
        "newpassword": newpassword,
        "password_confirmation":newpasswordconfirmation,
        "current_password": currentpassword,
        "address": address,

        if (photo != null) 'photo': await dio.MultipartFile.fromFile(photo.path),
      });

      dio.Response response = await apiProvider.postRequest(
          "${APIProvider.url}user/profile",
          {},
          formData,// Pass formData instead of jsonEncode
          token: APIProvider.token
      );
      print("\n2");
      //APIProvider.cookies =response.headers['set-cookie'];

      //String token = response.data["data"];
      //
      // print("Response status code: ${response.statusCode}");
      // print("Response cookies: ${ APIProvider.cookies}");
      // print("Response header: ${response.headers}");
      // print("Response body: ${response.data}");
      // print("Response token: $token");

      if (response.statusCode == 200) {
        if (response.data != null) {
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
      print("Dio error : $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
        // Optionally, handle different types of Dio errors (e.g., timeouts, connectivity issues)
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error : $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }


}