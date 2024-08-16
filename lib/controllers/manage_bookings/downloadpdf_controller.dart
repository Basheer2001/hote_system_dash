import 'dart:io';
import 'dart:typed_data';
import 'package:dashboardhs/reposetory/dashboard/adminbooking_repo/downloadinvocierepo.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../../pages/dashboard_screens/manage_bookings/pdfviewscreen.dart';


class DownloadInvoiceController extends GetxController {
  final DownloadInvoiceRepo invoiceRepo = Get.find<DownloadInvoiceRepo>();

  var isLoading = false.obs;

  Future<void> downloadInvoice(int invoiceId) async {
    try {
      isLoading.value = true;
      Uint8List pdfData = await invoiceRepo.downloadInvoice(invoiceId);
      print("PDF data fetched successfully.");

      // Save the PDF data to a file
      String filePath = await savePdfFile(pdfData, invoiceId);  // Save to a file

      // Navigate to the PDF viewer screen
      Get.to(() => PdfViewerScreen(filePath: filePath));
    } catch (e) {
      print("Error downloading invoice: $e");
      // Handle the error as needed (e.g., show a snackbar or alert)
    } finally {
      isLoading.value = false;
    }
  }

  Future<String> savePdfFile(Uint8List pdfData, int invoiceId) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/invoice_$invoiceId.pdf');
    await file.writeAsBytes(pdfData);
    print("PDF saved at ${file.path}");
    return file.path;  // Return the file path
  }
}


/*
class DownloadpdfController extends GetxController {
  DownloadpdfRepo servicesRepo = Get.find<DownloadpdfRepo>();

  var loading = false.obs;
  var errorMessage = ''.obs;
  var services = <Map<String, dynamic>>[].obs; // List of services

  void downloadInvoice(int invoiceId) async {
    loading.value = true;
    try {
      await servicesRepo.downloadInvoicePdf(invoiceId);
      loading.value = false;

      // Show a success dialog or notification
      Get.snackbar('Success', 'Invoice downloaded successfully');
    } catch (e) {
      loading.value = false;
      errorMessage.value = e.toString();
      Get.defaultDialog(
        title: "Error",
        content: Text(errorMessage.value),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      );
    }
  }
}
*/