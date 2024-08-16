import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../service.dart';
class APIProvider extends GetxService{
  ////
  //static String url = "http://192.168.1.110:8000/api/";
  static String? token;
  static String url = "http://127.0.0.1:8000/api/";
 // static String url = "http://192.168.1.4:8000/api/";



  late dio.Dio _dio;
  static List<String>? cookies;



  // Getter for the token
//Dio getc()=>Dio()..httpClientAdapter=BrowserHttpClientAdapter(withCredentials: true);
  APIProvider(){
    _dio=dio.Dio(
      dio.BaseOptions(
      //     headers: {
      //       'Cookie': cookies??cookies,
      //       //'Authorization' : token?? 'Bearer ${token}',
      //       //'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjNlMGU3ZDA4NDY2MzcxNDE1NDc5OTVlZDVlZjJiYjMwMTRlMGI4OWFmNThhZTA3NTRkMmFiYzEzYzQwMjgzZDcxMDRkODVlN2YxYTM2ZjUiLCJpYXQiOjE3MjI0NDc3ODUuMjcyMTU4LCJuYmYiOjE3MjI0NDc3ODUuMjcyMTY1LCJleHAiOjE3NTM5ODM3ODQuODMyMjIxLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.JORNyQUX_C9RxZClziMVTTBpbliJDLKh_bIsPwLQqdAnz0NxmFay4eWdnQkhoO-Dm0oJHmGJ350K_uGrD8kb5FQq7Iwsf9XNs1oPiuhUzciicuTW6WoDU-h55mD6zIxn1u-kQKsUWckTH_PzOVyZy70LiZnkG4b8flQpeHInWrrB-E0QPK_8LRSlY_Q-r-O7tNfcPVBmmk-GgItlSzsFEi42vSfnfWmfgrI_2pCXllQmqJmGb6jWzV5jCbG4s9Wu4733IuGbrfLW3pT5TEQoUgjaPKa0NgY1XfTDSgimm5c-6VVNr06HuYDsKC0j-fUG_IU89uN4SjY-63WRwPXkEzzugXVph4-XLjLAlKMuNvg9gLDAgVqvMvJEVMeayYT7SLPk9sozQnbbWP4yE9ykoguIurvJZb9hXM-qgxHN1EapgU9MnGacSDzl3vIY5FZsEaC0bhL_adiuqS6T3WpvOOFZ2dABXIkJphxBDwBKVV9TLpK502I_NfUdluJhSSvgOXTpVrg3h9LfEXaHl5WGPaPXG4OpvkB6EvLTlnIm_W2_3svmeTXdB6Fsn0y9vI5gO3G7KUoiCDZelmXWo0du_BQU2brT5__MwOh1OjCUGtoyIkLyRr126Fzm4wSbvOXh0BW8R18j-4ZzTnznV1kWism-WImB-VF-NKfzBUTbwoo',
      //       'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiN2I2NWU4OWE1ODFlNzYzMWJjNDZjNTZkNGVhNjgwY2U1NmEyNmI3ODIxMjk2NjhiZmRkYWMwMTIyMzFjZWY3MmYxYjBhZTNlOWE0MzBjNDYiLCJpYXQiOjE3MjM1ODYzNjAuMjc5NDEzLCJuYmYiOjE3MjM1ODYzNjAuMjc5NDE1LCJleHAiOjE3NTUxMjIzNjAuMjcyMywic3ViIjoiMyIsInNjb3BlcyI6W119.IxX1VrGWwmAS3xMtMhD8Ve3Sw6vD_JDM4dgX9BlcpPlVMPLEpdbH2pU3kocXNzhwlvqIbLvjjYBraaoKTaHM63v8I4RyjAfulX6EU1nPYmhc_VyEsUBe3YjC5Y7ZA6uEeVGsbVRCfKfj2n1w1yXOBEnI-gaDmtnQVls7_4r83GXEBiEZzFhanBv3lT7A8ZhDPFk_fvK36O8wxFegYGk_hunoevpvdWzPZNCS1CfKcmVxGNadDWoyTIcgc2rtN_4BWFIpgmaLBY1wxrqatVJRFTSiuYyPSgenc6PuAv1lCIZXgG0K-a5c7hRixiFANBsR1zeXLGNrsv-m2u6RKM4RkZ7hm2du5mbUF3FEP8AoqQKCMwnbsrEOGNCC-tLWjDRex3OumEIewoUo-H3Mw0P9G4fufbo7vvbCbO5_ROq17x86F920Wxg4FIJNqFQXZLo09VKXPU2GZ4PJQWDTlm37dldP6F2bUqTTi9JEQLxPbcWRyeHDVbRYioBozBuZHu-3aQo5ugfY3Hls31nQcHjjfwG2e4hBeWdObT9C5OlI8pOQXCwC0j4TOP-WBJI0nEeBmzaQAejUjuCasCjkeyaI1IOJs-DD4ARbjC3qxGabSMMCrXVdv_3MO-hAG0EarYWfLERwZx1PzaT3B1IMjY2yBuWPv_yCHGhOLC4-P8C4SP0'
      // ,
      //       'Accept':"application/json",
      //       'Content-Type':"application/json",
      //     },
        //  baseUrl: "https://reqres.in/api/",
        //  connectTimeout: Duration(seconds: 30),
        // 10 minutes in milliseconds
        //  extra: {"withCredentials":true},
          validateStatus: (status){
            return true;
            //  return status!=null && status>=200 && status<300;
          }
      ),

    );

  }


//TODO POSTREQUEST METHOD
  Future<dio.Response> postRequest(
      String method,
      Map<String, dynamic> queryParams,
      dynamic body,
      {String? cookies, String? token,}) async {
    try {
      print(5);

      // Optionally set headers, including cookies and tokens
      // if (cookies != null || token != null) {
      //   // _dio.options = dio.BaseOptions(
      //   //   headers: {
      //   //     'Cookie': cookies ?? '',
      //   //     'Authorization': token != null ? 'Bearer $token' : '',
      //   //     'Accept': "application/json",
      //   //     'Content-Type': "application/json",
      //   //   },
      //   // );
      // }

      print(6);
      dio.Response response = await _dio.post(
        method,
        queryParameters: queryParams,
        data: body,
        options:dio.Options(
            headers: {
              'Authorization' : token==null?null:'Bearer $token',
             // 'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDQwMjhiOTY4ODczYzFiZTFlZGM5ZjRkZjc3M2VmMmIwOTQ0YTJiNDRiNjM4MDczYjg3OGQwYzA0N2I3MjRkYmVhN2RhN2ZmYjJjN2E1NjciLCJpYXQiOjE3MjI3ODc4MzEuNjgxNDY1LCJuYmYiOjE3MjI3ODc4MzEuNjgxNDczLCJleHAiOjE3NTQzMjM4MzEuNjYwMjI2LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.A3kFfvUSwWaz7KHAXmgOAqkKmlCDHMORqwcLU2lgDf2g83H2K_765TOofy7ehRTqFkeoFbvD_J9lNGxLxbRuOXbj0Y-2h7au766JpBrVOVXZ_m09cSsP0lOI1k_UkzCMtFCzXb9H-FcsXTtuYc5okjRCnCr6W1O3e4mCMQ8Txm2wN1TTg82BkE7KqYgqzaeRgc-5eDpu9v_fqQahoSejXjlD8pxtp9ZjdS4WyD3iN8naYmUEd5ZKYauSIDuJzXki-9ts6H_hbfCT_bwfnyaCoETDNPZdovGcjOXdkFJ4A3KuB7Q3h6GtAi0wTD1URRLVeV8bFuldUPk50IVcbSrasd_smLqfrSO8IzZvVQxMrUuqxVORipMmBFpSj6Hr95IxaRJR4mca2dtY4g04qrsSIvzDBV5dueIuQxdGoTygw7YQ_GBS1NLvJQ0WL_IM73l2WV42RHiW7UN_B2vMeBYgIgozLA4lz3aWCRAUvUaLzIiAivmUaNc0ylPNxz22Y13_DmAUE_rGS1HLI9i-FIbHyr4XycBLieFuu196xW85W6q3tqI2Qru9mtO-C-7iy4SWs7uCunUgzSkj9Yc8Erd1y1c25ajTjhChyAPvdYHLAwNKFcyihB-hBcjb7ZR17F6-NbY2r6WHz0XX21n01vzgx025SahmBwNYlcAWocF0Bz4'
               // 'Cookie': cookies==null?null:cookies,

            }),
      );
      print(7);
      print(response);
      print(response.statusCode);


      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Unknown error: ${response.statusCode}');
      }
    } catch (e) {
      print("Error in postRequest: $e");
      rethrow;
    }
  }

 /* Future<dio.Response> postRequest(
      String method,
      Map<String, dynamic> queryParams,
      dynamic body, {
        String? cookies,
        String? token,
        Map<String, String>? headers,
      }) async {
    try {
      print(5);

      // Optionally set headers, including cookies and tokens
      _dio.options = dio.BaseOptions(
        headers: {
          if (cookies != null) 'Cookie': cookies,
          if (token != null) 'Authorization': 'Bearer $token',
          'Accept': "application/json",
          'Content-Type': "application/json",
          ...?headers, // Merge additional headers
        },
      );

      print(6);
      dio.Response response = await _dio.post(
        method,
        queryParameters: queryParams,
        data: body,
      );
      print(7);
      print(response);
      print(response.statusCode);

      // Handle successful responses
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Unknown error: ${response.statusCode}');
      }
    } catch (e) {
      print("Error in postRequest: $e");
      rethrow;
    }
  }*/


/*
  Future<dio.Response> getRequest(String method, Map<String, dynamic>? queryParams,
      {required Map<String, String> headers}) async {
    print(5);
    try {
      dio.Response response = await _dio.get(
        method,
        queryParameters: queryParams,
        options: dio.Options(
          headers: headers,
        ),
      );
      print(7);
     print('Response:${response.statusCode}${response.data}');
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('server error');
      } else {
        throw Exception('unknown error');
      }
    } on dio.DioError catch (e) {
      print('Dio Error: $e');
      // Handle Dio specific errors
      throw Exception('Dio Error: ${e.message}');
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }*/

  Future<dio.Response> getRequest(
      String method,
      Map<String, dynamic>? queryParams,
      {required Map<String, String> headers, dio.ResponseType responseType = dio.ResponseType.json}
      ) async {
    print(5);
    try {
      dio.Response response = await _dio.get(
        method,
        queryParameters: queryParams,
        options: dio.Options(
          headers: headers,
          responseType: responseType, // Set the response type
        ),
      );
      print(7);
      print('Response:${response.statusCode}${response.data}');
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('server error');
      } else {
        throw Exception('unknown error');
      }
    } on dio.DioError catch (e) {
      print('Dio Error: $e');
      // Handle Dio specific errors
      throw Exception('Dio Error: ${e.message}');
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }


  Future<dio.Response> putRequest(
      String method,
      Map<String, dynamic> queryParams,
      dynamic body, {
        Map<String, String>? headers,
      }
      // {
      // //  required Map<String, String> headers,
      // }
      ) async
  {
    try {
      return await _dio.put(
        method,
        queryParameters: queryParams,
        data: body,
       options: dio.Options(headers: headers),
      );
    } on dio.DioException catch (e) {
      if (e.response != null) {
        print('Dio error: ${e.response!.statusCode} - ${e.response!.data}');
        throw Exception('Server error: ${e.response!.statusCode}');
      } else {
        print('Dio error: ${e.message}');
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      print('General error: $e');
      throw Exception('Error: $e');
    }
  }


  /* Future<dio.Response> putRequest(
      String method, Map<String,dynamic> queryParams)async{
    dio.Response response=await _dio.put(method,queryParameters: queryParams);
    if(response.statusCode==200){
      return response;
    }else if(response.statusCode==400){
      throw Exception(response.data['error']);
    }else if(response.statusCode==500){
      throw Exception('server error');
    }else{
      throw Exception('unkown error');
    }
  }*/


  Future<dio.Response> deleteRequest(String url, {Map<String, String> headers = const {}}) async {
    try {
      final response = await _dio.delete(
        url,
        options: dio.Options(
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 400) {
        throw Exception(response.data['error']);
      } else if (response.statusCode == 500) {
        throw Exception('server error');
      } else {
        throw Exception('unknown error');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }


}













//TODO GET REQUEST
/*
  Future<dio.Response> getRequest(String method, Map<String,dynamic> queryParams)async{
    dio.Response response=await _dio.get(method,queryParameters: queryParams);
    if(response.statusCode==200){
      return response;
    }else if(response.statusCode==400){
      throw Exception(response.data['error']);
    }else if(response.statusCode==500){
      throw Exception('server error');
    }else{
      throw Exception('unkown error');
    }
  }
*/