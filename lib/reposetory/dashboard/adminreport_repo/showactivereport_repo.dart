
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../../contsant/sharedprefrences/shared.dart';
import '../../../pages/dashboard_screens/managing_report/reportclass.dart';
import '../../../providers/apiprovider.dart';

class ReportRepo extends GetxService {
  final APIProvider apiProvider = Get.find<APIProvider>();


  Future<List<Report>> getReports() async {
    try {
      String? token = await getToken();
      if (token == null) {
        throw Exception("User not logged in");
      }

      final response = await apiProvider.getRequest(
        "${APIProvider.url}reports",
        {},
        headers: {'Authorization': 'Bearer $token'},
      );

      print("Response data: ${response.data}");

      if (response.statusCode == 200) {
        List<dynamic> reportsJson = response.data['msg']['reports'];
        return reportsJson.map((json) => Report.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch reports');
      }
    } catch (e) {
      print("Error fetching reports: $e");
      throw e;
    }
  }}