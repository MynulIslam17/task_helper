import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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

  static Future<NetworkResponse> postRequest({
    required String url,

    Map<String, dynamic>? body,

    bool cameFromSignIn = false,
  }) async {
    try {
      ///header

      Map<String, String> header = {
        "Content-Type": "application/json",

        //"token" : AuthController.Token ?? " " // not need for login/register
      };

      _logRequest(url, body, header);

      final uri = Uri.parse(url);

      final response = await http.post(
        uri,

        body: jsonEncode(body),

        headers: header,
      );

      _logResponse(url, response);

      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(
          response.body,
        ); // convert jsonString to Map

        return NetworkResponse(
          statusCode: response.statusCode,
          success: true,
          body: decodedJson,
        );
      } else {
        final decodedJson = jsonDecode(response.body);

        return NetworkResponse(
          statusCode: response.statusCode,
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



  static void _logResponse(String url, http.Response response) {

    debugPrint(

      "========== Response=====================\n"

          "Url : $url\n"

          "statusCode: ${response.statusCode}\n"

          "body: ${response.body}",

    );

  }




static void _logRequest(

      String url,

      Map<String, dynamic>? body,

      Map<String, String> header,

      ) {

    debugPrint(

      "========= Request ====================\n"

          "url : $url\n"

          "body : $body\n"

          "header : $header\n"

          "===========================================",

    );

  }


}
