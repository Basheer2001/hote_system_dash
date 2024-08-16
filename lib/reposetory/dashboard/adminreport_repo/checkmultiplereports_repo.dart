import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../models/appresponse.dart';
import '../../../providers/apiprovider.dart';
import '../../../service.dart';


class CheckMultipleReportsRepo extends GetxService {
  MyServices myServices = Get.find<MyServices>();
  APIProvider apiProvider = Get.find<APIProvider>();

  //Future<AppResponse<String>> updateReports(List<int> reportIds) async {
  Future<AppResponse<String>> updateReports(String reportIds) async {
    try {
      dio.Response response = await apiProvider.postRequest(
        "${APIProvider.url}dashboard/reports/check",
        {},
        {
        //  "reports": reportIds,
          "reports[]": reportIds,
        },
      );

      print("Response status code: ${response.statusCode}");
      print("Response body: ${response.data}");

      if (response.statusCode == 200) {
        if (response.data != null && response.data["status"] == true) {
          return AppResponse<String>(
            success: true,
            data: response.data["msg"],
          );
        } else {
          throw Exception("Failed to update reports");
        }
      } else {
        throw Exception("Server responded with status code ${response.statusCode}");
      }
    } on dio.DioException catch (e) {
      print("Dio error during update: $e");
      String errorMessage = "Network error occurred";
      if (e.response != null) {
        errorMessage = "Server error: ${e.response!.statusCode}";
      }
      return AppResponse(success: false, errorMessage: errorMessage);
    } catch (e) {
      print("Error during update: $e");
      return AppResponse(success: false, errorMessage: e.toString());
    }
  }
}
