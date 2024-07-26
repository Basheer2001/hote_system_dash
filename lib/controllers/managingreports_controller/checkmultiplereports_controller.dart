import 'package:get/get.dart';

import '../../models/appresponse.dart';
import '../../reposetory/dashboard/adminreport_repo/checkmultiplereports_repo.dart';


class CheckMultipleReportsController extends GetxController {
  CheckMultipleReportsRepo reportUpdateRepo = Get.find<CheckMultipleReportsRepo>();

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var successMessage = ''.obs;

  Future<void> updateReports(List<int> reportIds) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      successMessage.value = '';

      AppResponse<String> response = await reportUpdateRepo.updateReports(reportIds);

      if (response.success) {
        successMessage.value = response.data ?? 'Reports updated successfully';
      } else {
        errorMessage.value = response.errorMessage ?? 'Failed to update reports';
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
