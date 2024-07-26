import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/dashboard_screens/managing_report/reports.dart';
import '../../reposetory/dashboard/adminreport_repo/showactivereport_repo.dart';

class ReportController extends GetxController {
  final ReportRepo reportRepo = Get.find<ReportRepo>();

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  var isLoading = false.obs;
  var reports = <Reportt>[].obs;


  var firstSubmit =false.obs;
  var loginLoadingState=false.obs;

  TextEditingController titleController=TextEditingController(text:"room");
  TextEditingController descriptionController=TextEditingController(text:"picture");
  @override
  void onInit() {
    fetchReports();
    super.onInit();
  }

  Future<void> fetchReports() async {
    try {
      isLoading.value = true;
      List<Reportt> reportsList = (await reportRepo.getReports()).cast<Reportt>();
      print("Fetched reports: $reportsList");
      reports.assignAll(reportsList);
    } catch (e) {
      print("Error fetching reports: $e");
    } finally {
      isLoading.value = false;
    }
  }}