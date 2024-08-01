import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../service.dart';
class APIProvider extends GetxService{
  ////
  //static String url = "http://192.168.1.110:8000/api/";
  static String? token;
//  static String url = "http://127.0.0.1:8000/api/";
  static String url = "http://192.168.1.4:8000/api/";



  late dio.Dio _dio;
  static List<String>? cookies;



  // Getter for the token
//Dio getc()=>Dio()..httpClientAdapter=BrowserHttpClientAdapter(withCredentials: true);
  APIProvider(){
    _dio=dio.Dio(
      dio.BaseOptions(
          headers: {
            'Cookie': cookies??cookies,
            //'Authorization' : token?? 'Bearer ${token}',
            'Authorization' : 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjNlMGU3ZDA4NDY2MzcxNDE1NDc5OTVlZDVlZjJiYjMwMTRlMGI4OWFmNThhZTA3NTRkMmFiYzEzYzQwMjgzZDcxMDRkODVlN2YxYTM2ZjUiLCJpYXQiOjE3MjI0NDc3ODUuMjcyMTU4LCJuYmYiOjE3MjI0NDc3ODUuMjcyMTY1LCJleHAiOjE3NTM5ODM3ODQuODMyMjIxLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.JORNyQUX_C9RxZClziMVTTBpbliJDLKh_bIsPwLQqdAnz0NxmFay4eWdnQkhoO-Dm0oJHmGJ350K_uGrD8kb5FQq7Iwsf9XNs1oPiuhUzciicuTW6WoDU-h55mD6zIxn1u-kQKsUWckTH_PzOVyZy70LiZnkG4b8flQpeHInWrrB-E0QPK_8LRSlY_Q-r-O7tNfcPVBmmk-GgItlSzsFEi42vSfnfWmfgrI_2pCXllQmqJmGb6jWzV5jCbG4s9Wu4733IuGbrfLW3pT5TEQoUgjaPKa0NgY1XfTDSgimm5c-6VVNr06HuYDsKC0j-fUG_IU89uN4SjY-63WRwPXkEzzugXVph4-XLjLAlKMuNvg9gLDAgVqvMvJEVMeayYT7SLPk9sozQnbbWP4yE9ykoguIurvJZb9hXM-qgxHN1EapgU9MnGacSDzl3vIY5FZsEaC0bhL_adiuqS6T3WpvOOFZ2dABXIkJphxBDwBKVV9TLpK502I_NfUdluJhSSvgOXTpVrg3h9LfEXaHl5WGPaPXG4OpvkB6EvLTlnIm_W2_3svmeTXdB6Fsn0y9vI5gO3G7KUoiCDZelmXWo0du_BQU2brT5__MwOh1OjCUGtoyIkLyRr126Fzm4wSbvOXh0BW8R18j-4ZzTnznV1kWism-WImB-VF-NKfzBUTbwoo',

      'Accept':"application/json",
            'Content-Type':"application/json",
          },
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

  Future<dio.Response> postRequest(

      String method, Map<String,dynamic> queryParams,dynamic body,{String? cookies,String?token})async{
    // print(1);
    // DioForBrowser dioForBrowser = DioForBrowser(_dio.options);
    // print(2);
    // var adapter= BrowserHttpClientAdapter();
    // print(3);
    // adapter.withCredentials=true;
    // print(4);
    // _dio.httpClientAdapter=adapter;

    print(5);
    // if (cookies!=null|| token!=null ){
    //   _dio.options = dio.BaseOptions(
    //       headers: {
    //         'Cookie': cookies??cookies,
    //         'Authorization' : token?? 'Bearer ${token}',
    //         'Accept':"application/json",
    //         'Content-Type':"application/json",
    //       }
    //   );
    // }
    print(6);
    dio.Response response=await _dio.post(method,queryParameters: queryParams,data: body);
    print(7);
    print(response);
    print(response.statusCode);
    if(response.statusCode==200){
      // getc();
      return response;
    }else if(response.statusCode==400){
      throw Exception(response.data['error']);
    }else if(response.statusCode==500){
      throw Exception('server error');
    }else{
      throw Exception('unkown error');
    }

  }





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
  }



  Future<dio.Response> putRequest(
      String method,
      Map<String, dynamic> queryParams,
      dynamic body, {
        required Map<String, String> headers,
      }) async {
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