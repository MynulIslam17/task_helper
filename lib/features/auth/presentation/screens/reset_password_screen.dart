import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/password_field.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/top_header_text.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static const String name="reset_screen";

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  final TextEditingController _newPasswordController=TextEditingController();
  final TextEditingController _confirmPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.primary,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 70),
          
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                TopHeaderText(title: "Set Your New Password", body: "Create a secure password to protect your account and get started seamlessly!"),
          
          
                const SizedBox(height: 20,),
          
                Text("New Password",style: TextTheme.of(context).titleMedium,),
                const SizedBox(height: 7,),
          
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // background color of TextField
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // shadow color
                        spreadRadius: 2, // how much the shadow spreads
                        blurRadius: 8, // blur effect
                        offset: const Offset(0, 4), // x and y offset
                      ),
                    ],),
                  child: PasswordTextField(
                    controller: _newPasswordController,
                    hintText: '********',
                  ),
                ),
                const SizedBox(height: 15,),
          
                Text("Confirm Password",style: TextTheme.of(context).titleMedium,),
                const SizedBox(height: 7,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // background color of TextField
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3), // shadow color
                        spreadRadius: 2, // how much the shadow spreads
                        blurRadius: 8, // blur effect
                        offset: const Offset(0, 4), // x and y offset
                      ),
                    ],),
                  child: PasswordTextField(
                    controller: _confirmPasswordController,
                    hintText: '********',
                  ),
                ),
                
               const SizedBox(height: 30,),
                
                
                ElevatedButton(onPressed: (){},
                    child: Text("Continue")
          
                )
                
                
                
          
          
          
          
              ],
            ),
          ),
        ),
      ),


    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _newPasswordController.dispose();
   _confirmPasswordController.dispose();
    super.dispose();
  }

}
