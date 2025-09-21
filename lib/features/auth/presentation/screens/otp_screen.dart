import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/core/services/api_services.dart';
import 'package:task_helper/features/auth/presentation/screens/login_screen.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/top_header_text.dart';

import '../../../../core/utils/urls/api_urls.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});

  static const String name = "otp_screen";
  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopHeaderText(
                  title: "6-digit code",
                  body:
                      "Please enter the code we've sent to michelle.rivera@example.com",
                ),
                const SizedBox(height: 20),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 45,
                    fieldWidth: 45,
                    activeFillColor: Colors.white,
                    selectedColor: Colors.green,
                    inactiveColor: Colors.red,
                    fieldOuterPadding: EdgeInsets.symmetric(horizontal: 3),
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  controller: _otpTEController,

                  appContext: context,
                ),

                const SizedBox(height: 30),

                ElevatedButton(onPressed: _confirmOtp, child: Text("Confirm")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// method or otp match

  void _confirmOtp() async {



    if(_otpTEController.text.isEmpty){
      return;
    }


    Map<String, dynamic> body = {
      "email": widget.email,
      "code": _otpTEController.text,
    };

    NetworkResponse response = await NetworkCaller.postRequest(
      url: ApiUrls.activateUserUrl,
      body: body,
    );

    final message = response.body!["message"];

    if (!mounted) {
      return;
    }

    if (response.success) {
      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.name,(predicate)=>false,arguments: message);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _otpTEController.dispose();
    super.dispose();
  }
}
