import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/features/auth/presentation/screens/otp_screen.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/text_field_with_shadow.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/top_header_text.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key, required this.message, required this.email});

  static const name = "verify_email";
  final String message;
  final String email;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    // Delay SnackBar until the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(widget.message)));
    });
  }

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
                    title: "ReEnter Your Email",
                    body:
                        "We'll send a verification code to this email to confirm your account.",
                  ),

                  const SizedBox(height: 20),

                  /// custom textfield
                  TextFieldWithShadow(
                    controller: _verifyEmailController,
                    hint: "michelle.rivera@example.com",
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(onPressed: _verifyEmail, child: Text("Enter")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _verifyEmail() async {
    String email = _verifyEmailController.text;

    if (email.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Filed can't be empty")));
      return;
    }

    if (!EmailValidator.validate(email)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Not a valid email")));
      return;
    }

    if (widget.email.toLowerCase() != email.toLowerCase()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Email does not match")));
      return;
    }


    Navigator.pushNamed(context,OtpScreen.name,arguments: _verifyEmailController.text);


  }

  @override
  void dispose() {
    // TODO: implement dispose
    _verifyEmailController.dispose();
    super.dispose();
  }
}
