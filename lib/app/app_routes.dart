import 'package:flutter/material.dart';

// Auth
import 'package:task_helper/features/auth/presentation/screens/login_screen.dart';
import 'package:task_helper/features/auth/presentation/screens/otp_screen.dart';
import 'package:task_helper/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:task_helper/features/auth/presentation/screens/verify_email.dart';
import 'package:task_helper/features/auth/presentation/screens/reset_password_screen.dart';

// Profile
import 'package:task_helper/features/profile/presentation/screens/profile_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/my_profile.dart';
import 'package:task_helper/features/profile/presentation/screens/edit_profile.dart';
import 'package:task_helper/features/profile/presentation/screens/settings_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/change_password_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/terms_and_conditions_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/help_and_support_screen.dart';

// Task
import 'package:task_helper/features/task/presentation/screens/add_task_screen.dart';
import 'package:task_helper/features/task/presentation/screens/edit_task_screen.dart';
import 'package:task_helper/features/task/presentation/screens/task_details_screen.dart';

// Shared
import 'package:task_helper/features/shared/presentation/screens/bottom_nav_holder_screen.dart';

// Splash
import 'package:task_helper/features/splash/presentation/screens/splash_screen.dart';

import '../features/home/presentation/screens/home_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.name:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case LoginScreen.name:
         final String ? message=settings.arguments as String?;
        return MaterialPageRoute(builder: (_) => LoginScreen(
         message: message,
        ));

      case SignUpScreen.name:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case VerifyEmail.name:
        final arg = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) =>
              VerifyEmail(email: arg["email"],
                  message: arg["message"]),
        );

      case OtpScreen.name:

        final String email=settings.arguments as String;
        return MaterialPageRoute(builder: (_) =>  OtpScreen(
          email: email,
        ));

      case ResetPasswordScreen.name:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());

      case BottomNavHolderScreen.name:
        return MaterialPageRoute(builder: (_) => const BottomNavHolderScreen());

      case AddTaskScreen.name:
        return MaterialPageRoute(builder: (_) => const AddTaskScreen());

      case EditTaskScreen.name:
        return MaterialPageRoute(builder: (_) => const EditTaskScreen());

      case TaskDetailsScreen.name:
        return MaterialPageRoute(builder: (_) => const TaskDetailsScreen());

      case ProfileScreen.name:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case MyProfileScreen.name:
        return MaterialPageRoute(builder: (_) => const MyProfileScreen());

      case EditProfileScreen.name:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case HomeScreen.name:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case SettingsScreen.name:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());

      case ChangePasswordScreen.name:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());

      case PrivacyPolicyScreen.name:
        return MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen());

      case TermsAndConditionScreen.name:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditionScreen(),
        );

      case HelpAndSupportScreen.name:
        return MaterialPageRoute(builder: (_) => const HelpAndSupportScreen());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
