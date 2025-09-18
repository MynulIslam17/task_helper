
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/top_header_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  static const String name="otp_screen";

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final TextEditingController _otpTEController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 70),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                TopHeaderText(title: "6-digit code", body: "Please enter the code we've sent to michelle.rivera@example.com"),
                const SizedBox(height: 20,),
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
                      inactiveColor:Colors.red,
                    fieldOuterPadding: EdgeInsets.symmetric(horizontal: 3)

                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  controller: _otpTEController,


                  appContext: context,
                ),

              const   SizedBox(height: 30,),


                ElevatedButton(onPressed: (){},
                    child: Text("Confirm")
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
    _otpTEController.dispose();
    super.dispose();
  }


}
