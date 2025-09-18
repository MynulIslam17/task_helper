import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/password_field.dart';
import 'package:task_helper/features/profile/presentation/widgets/custome_app_bar.dart';

import '../../../../app/app_colors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  static const String name = "change_pass_screen";

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _typePasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newConfirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: CustomAppBar(title: "Change Password"),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              passwordFiledSection(
                title: "Typed Password",
                controller: _typePasswordController,
                hint: "******"
              ),

              const SizedBox(height: 10,),

              passwordFiledSection(
                title: "New password",
                controller: _newPasswordController,
                  hint: "******"

              ),
              const SizedBox(height: 10,),

              passwordFiledSection(
                title: "Confirm Password",
                controller: _newConfirmPasswordController,
                  hint: "******"

                
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordFiledSection({
    required String title,
    required String hint,
    required TextEditingController controller
}

      ) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),

                const SizedBox(height: 5,),

                Card(
                  child: PasswordTextField(controller: controller,
                  hintText: hint,),
                ),
              ],
            );
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _typePasswordController.dispose();
    _newConfirmPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

}
