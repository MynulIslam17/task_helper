
    import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_helper/features/profile/presentation/screens/change_password_screen.dart';
import 'package:task_helper/features/profile/presentation/widgets/dialog.dart';
import 'package:task_helper/features/profile/presentation/widgets/profile_item.dart';

import '../../../../app/app_colors.dart';
import '../widgets/custome_app_bar.dart';

class SettingsScreen extends StatefulWidget {
      const SettingsScreen({super.key});

      static const String name="settings";

      @override
      State<SettingsScreen> createState() => _SettingsScreenState();
    }

    class _SettingsScreenState extends State<SettingsScreen> {
      @override
      Widget build(BuildContext context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.primary,
            appBar: CustomAppBar(
              title: "Account Setting",
            ),
          
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
              child: Column(
                children: [
          
                  ProfileItem(heading: "Change Password",
                      icon: Icons.lock,
                      onTap: (){

                      Navigator.pushNamed(context, ChangePasswordScreen.name);
          
                      }),
                   const SizedBox(height: 10,),

                   ProfileItem(heading: "Delete Account",
                      icon: Icons.delete,
                      iconColor: Colors.redAccent,
                      textColor: Colors.red,

                      onTap: (){

                       showDialog(context: (context),
                           builder: (context){
                         return LogoutDialog(text: "Do you wanna delete this account ?");
                           });

                      }),
          
          
                ],
              ),
            ),
          
          
          ),
        );
      }
    }


