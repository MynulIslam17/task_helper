import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_helper/app/bindings/app_bindings.dart';
import 'package:task_helper/features/auth/presentation/screens/login_screen.dart';
import 'package:task_helper/features/auth/presentation/screens/otp_screen.dart';
import 'package:task_helper/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:task_helper/features/auth/presentation/screens/verify_email.dart';
import 'package:task_helper/features/profile/presentation/screens/change_password_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/edit_profile.dart';
import 'package:task_helper/features/profile/presentation/screens/help_and_support_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/my_profile.dart';
import 'package:task_helper/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/settings_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/terms_and_conditions_screen.dart';
import 'package:task_helper/features/shared/presentation/screens/bottom_nav_holder_screen.dart';
import 'package:task_helper/features/task/presentation/screens/edit_task_screen.dart';
import 'package:task_helper/features/task/presentation/screens/task_details_screen.dart';

import '../features/auth/presentation/screens/reset_password_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/task/presentation/screens/add_task_screen.dart';
import 'app_colors.dart';
import 'app_routes.dart';

class TaskHelper extends StatelessWidget {
  const TaskHelper({super.key});

  @override
  Widget build(BuildContext context) {


    return GetMaterialApp(
      initialRoute:  SplashScreen.name,

      initialBinding: AppBinding(),

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        /// text custom design
        textTheme: TextTheme(
          titleSmall: TextStyle(
            fontSize: 13,
            color: Color(0xff6B7280),
            fontWeight: FontWeight.w400,
          ),

          titleMedium: TextStyle(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),

          titleLarge: TextStyle(
            fontSize: 28,
            color: Color(0xff111827),
            fontWeight: FontWeight.w600,
          ),
        ),

        /// textfield custom design
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Colors.black45),
          filled: true,
          fillColor: Color(0xffF7FFEF),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 7,
          ),
        ),

        /// button custom design
        elevatedButtonTheme: ElevatedButtonThemeData(

          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            backgroundColor: AppColors.btnColors,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            fixedSize: Size(double.maxFinite, 44),
            elevation: 0,
          ),
        ),
      ),

        onGenerateRoute: AppRoutes.generateRoute
    );
  }
}
