import 'package:flutter/material.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/app/images_path.dart';
import 'package:task_helper/features/profile/presentation/screens/help_and_support_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/my_profile.dart';
import 'package:task_helper/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/settings_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/terms_and_conditions_screen.dart';

import '../widgets/dialog.dart';
import '../widgets/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String name = "profile_screen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,

        body: SingleChildScrollView(
          child: Column(
            children: [
              /// user profile header
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.primary),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.asset(ImagesPath.topWave, fit: BoxFit.cover),
                    ),
                    Positioned(
                      top: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 4),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            ImagesPath.demoProfileImg,
                          ), // Replace with your image
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ProfileItem(
                      heading: "My profile",
                      icon: Icons.person,
                      onTap: (){
                        Navigator.pushNamed(context, MyProfileScreen.name);
                      },
                    ),
                    ProfileItem(
                      heading: "Account Setting",
                      icon: Icons.settings,
                      onTap: (){

                        Navigator.pushNamed(context, SettingsScreen.name);
                      },
                    ),
                    const SizedBox(height: 9,),

                    Text("More",style: TextTheme.of(context).titleMedium?.copyWith(fontSize: 18),),

                    const SizedBox(height: 9,),
                    ProfileItem(
                      heading: "Terms & Condition",
                      icon: Icons.book,
                      onTap: (){
                        Navigator.pushNamed(context, TermsAndConditionScreen.name);
                      },
                    ),
                    ProfileItem(
                      heading: "Privacy policy",
                      icon: Icons.privacy_tip,
                      onTap: (){
                        Navigator.pushNamed(context, PrivacyPolicyScreen.name);
                      },
                    ),  ProfileItem(
                      heading: "Help/Support",
                      icon: Icons.help,
                      onTap: (){
                        Navigator.pushNamed(context, HelpAndSupportScreen.name);
                      },
                    ),  ProfileItem(
                      heading: "Log Out",
                      icon: Icons.logout,
                      onTap: (){

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return LogoutDialog(
                              text: "Are you sure you want to logOut?",
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 20,)

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


