import 'package:flutter/material.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/text_field_with_shadow.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/top_header_text.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  static const name = "verify_email";

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final TextEditingController _verifyEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  /// reusable custom header section
                  TopHeaderText(
                    title: "Verify Your Email",
                    body: "We'll send a verification code to this email to confirm your account.",
                  ),

                  const SizedBox(height: 20),

                  /// custom textfield
                  TextFieldWithShadow(
                    controller: _verifyEmailController,
                    hint: "michelle.rivera@example.com",
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(onPressed: () {}, child: Text("Send")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _verifyEmailController.dispose();
    super.dispose();
  }
}


