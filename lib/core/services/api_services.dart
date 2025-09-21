
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'auth_controller.dart';

class NetworkResponse {
  final int statusCode;
  final bool success;
  final String? errorMsg;
  final Map<String, dynamic>? body;

  NetworkResponse({
    required this.statusCode,
    required this.success,
    this.errorMsg,
    this.body,
  });
}

class NetworkCaller {
  static const String errorMessage = "Something went wrong";
  static const unAuthorizedError = "Unauthorized user please login again";


  static Future<NetworkResponse> multipartRequest({
    required String url,
    required Map<String, String> fields,
    File? file,
    String fileKey = "file",
  }) async {
    try {
      Map<String, String> header = {
        "token": AuthController.Token ?? "",
      };

      final uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(header);
      request.fields.addAll(fields);

      if (file != null) {
        String extension = file.path.split('.').last.toLowerCase();
        String mimeType = extension == "png" ? "png" : "jpeg";

        request.files.add(
          await http.MultipartFile.fromPath(
            fileKey,
            file.path,
            contentType: MediaType("image", mimeType),
          ),
        );
      }

      _logRequest(url, fields, header);

      var response = await request.send();
      var responseData = await http.Response.fromStream(response);

      _logResponse(url, responseData);

      if (responseData.statusCode == 200) {
        final decodedJson = jsonDecode(responseData.body);
        return NetworkResponse(
            statusCode: responseData.statusCode,
            success: true,
            body: decodedJson);
      } else if (responseData.statusCode == 401) {
       // _isUnAuthorized();
        return NetworkResponse(
          statusCode: responseData.statusCode,
          success: false,
          errorMsg: unAuthorizedError,
        );
      } else {
        final decodedJson = jsonDecode(responseData.body);
        return NetworkResponse(
          statusCode: responseData.statusCode,
          success: false,
          errorMsg: decodedJson["message"] ?? errorMessage,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        success: false,
        errorMsg: e.toString(),
      );
    }
  }


  /// get request

  static Future<NetworkResponse> getRequest(String url ) async{


    try{

      Map<String, String> headers = {
        "Authorization": "Bearer ${AuthController.Token ?? ""}",
        "Content-Type": "application/json",
      };
      _logRequest(url, null,headers);

      final uri=Uri.parse(url);
      final response = await http.get(uri,headers: headers);
      _logResponse(url, response);


      if(response.statusCode==200){
        final decodedJson=jsonDecode(response.body);
        return  NetworkResponse(statusCode: response.statusCode, success: true,body:decodedJson);

      }else{
        final decodedJson=jsonDecode(response.body);
        String data=decodedJson["message"] ?? errorMessage;

        return NetworkResponse(statusCode: response.statusCode, success: false,errorMsg: data);
      }

    }
    catch (e){
      return NetworkResponse(statusCode: -1, success: false,errorMsg: e.toString());
    }






  }



/// only post request
  static Future<NetworkResponse> postRequest({required String url , Map<String,dynamic>?body, bool cameFromSignIn=false}  )async{


    try{

      Map<String, String> headers = {
        "Authorization": "Bearer ${AuthController.Token ?? ""}",
        "Content-Type": "application/json",
      };

      _logRequest(url, body,headers);

      final uri =Uri.parse(url);


      final response=await http.post(
          uri,
          headers: headers,
          body: jsonEncode(body)

      );

      _logResponse(url, response);

      if(response.statusCode==200){

        final decodedJson=jsonDecode(response.body);

        return NetworkResponse(statusCode: response.statusCode, success: true, body: decodedJson);

      }
      else{

        final decodedJson=jsonDecode(response.body);

        return NetworkResponse(statusCode: response.statusCode, success: false,errorMsg: decodedJson["message"]?? errorMessage);


      }

    }catch(e){
      return NetworkResponse(statusCode: -1, success: false,errorMsg: e.toString());
    }


  }






  static void _logRequest(
      String url, Map<String, dynamic>? body, Map<String, String> header) {
    debugPrint("========= Request ====================\n"
        "url : $url\n"
        "body : $body\n"
        "header : $header\n"
        "===========================================");
  }

  static void _logResponse(String url, http.Response response) {
    debugPrint("========== Response=====================\n"
        "Url : $url\n"
        "statusCode: ${response.statusCode}\n"
        "body: ${response.body}");
  }

  // static Future<void> _isUnAuthorized() async {
  //   await AuthController.clearData();
  //   Navigator.pushNamedAndRemoveUntil(
  //     TaskManger.navigator.currentContext!,
  //     SignInScreen.name,
  //         (predicate) => false,
  //   );
  // }


}
