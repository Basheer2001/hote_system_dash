import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import '../../../providers/apiprovider.dart';


class DownloadInvoiceRepo extends GetxService {
  final Dio _dio = Dio();

  Future<Uint8List> downloadInvoice(int invoiceId) async {
    try {
      final response = await _dio.get(
        '${APIProvider.url}dashboard/invoices/download/$invoiceId',
        options: Options(
          responseType: ResponseType.bytes, // Get response as bytes
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to download invoice');
      }
    } catch (e) {
      throw Exception('Error downloading invoice: $e');
    }
  }
}


/*class DownloadpdfRepo extends GetxService {
  APIProvider apiProvider = Get.find<APIProvider>();

  Future<void> downloadInvoicePdf(int invoiceId) async {
    try {
      String? token = await getToken(); // Retrieve token

      final response = await apiProvider.getRequest(
        "${APIProvider.url}dashboard/invoices/download/$invoiceId",
        {}, // No query parameters needed
        headers: {'Authorization': 'Bearer $token'},
        responseType: dio.ResponseType.bytes, // Set the response type to bytes for binary data
      );

      if (response.statusCode == 200) {
        final dir = await getApplicationDocumentsDirectory();
        final file = File('${dir.path}/invoice_$invoiceId.pdf');
        await file.writeAsBytes(response.data);

        print('PDF saved at ${file.path}');
        // Optionally, return the file path
        await OpenFile.open(file.path);
      } else {
        throw Exception('Failed to download PDF');
      }
    } on dio.DioError catch (e) {
      print("Dio error during PDF download: $e");
      throw Exception('Failed to download PDF');
    } catch (e) {
      print("Error during PDF download: $e");
      throw Exception('Failed to download PDF');
    }
  }

  Future<String?> getToken() async {
    // Retrieve and return the token (placeholder implementation)
    return 'your_token_here';
  }
}*/




