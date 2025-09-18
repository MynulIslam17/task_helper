// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
//
// class AuthController {
//   static String? Token; // Stored in memory
//   static late SharedPreferences _sharedPreferences;
//
//   // Initialize SharedPreferences
//   static Future<void> initialize() async {
//     _sharedPreferences = await SharedPreferences.getInstance();
//     Token = _sharedPreferences.getString('user-token');
//   }
//
//   // Save the user token to SharedPreferences and memory
//   static Future<bool> saveToken(String userToken) async {
//     _sharedPreferences.setString('user-token', userToken);
//     Token = userToken;
//     return true;
//   }
//
//   // Clear all authentication data (token)
//   static Future<void> clearData() async {
//     await _sharedPreferences.clear();
//     Token = null;
//   }
//
//   // Check if the user is currently logged in
//   static bool isLoggedIn() {
//     return Token != null;
//   }
// }