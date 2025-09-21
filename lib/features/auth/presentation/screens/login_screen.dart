import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/core/services/api_services.dart';
import 'package:task_helper/core/services/auth_controller.dart';
import 'package:task_helper/core/utils/urls/api_urls.dart';
import 'package:task_helper/features/auth/models/user_model.dart';
import 'package:task_helper/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/text_field_with_shadow.dart';
import 'package:task_helper/features/shared/presentation/screens/bottom_nav_holder_screen.dart';

import '../../../../app/images_path.dart';
import '../../../shared/widgets/spiner.dart';
import 'widgets/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.message});

  /// string that used for named navigation
  static const  String name="/logIn";
  final String ? message ;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();

    // show snackbar if message is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.message != null && widget.message!.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(widget.message!)),
        );
      }
    });
  }

  bool _isLoading = false;

 ///  pragress spin indicator
  void _showLoader() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black45,
      builder: (_) => Center(
        child: SpinningLoader(assetPath: ImagesPath.spiner_img),
      ),
    );
  }

  void _hideLoader() {
    Navigator.of(context).pop(); // closes dialog
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor:AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                'Welcome Back!',
                style: textTheme.titleLarge?.copyWith(fontSize: 32),
              ),
              const SizedBox(height: 8),
              Text(
                'Stay productive and take control of your tasks.',
                style: textTheme.titleSmall,
              ),
              const SizedBox(height: 40),
              Text(
                'Email Address',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),

              /// email textField
                TextFieldWithShadow(controller: _emailController, hint: "michelle.rivera@example.com"),
              const SizedBox(height: 24),
              Text(
                'Password',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              // Use the new widget here (password textfield)
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
                  controller: _passwordController,
                  hintText: '********',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: _rememberMe,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _rememberMe = newValue ?? false;
                        });
                      },
                      activeColor: Colors.black,
                      checkColor: Colors.white,
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        Set<WidgetState> states,
                      ) {
                        if (states.contains(WidgetState.selected)) {
                          return Colors.black;
                        }
                        return Colors.grey[300]!;
                      }),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Remember me',
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: 14,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(color: Colors.black26, thickness: 1),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'OR',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(color: Colors.black26, thickness: 1),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {

                        Navigator.pushNamed(context,SignUpScreen.name);

                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
               onPressed: _validateAndLogin,
                child: const Text(
                  'Log In',
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

/// input validation
  void _validateAndLogin()async {

    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (email.isEmpty) {
      _showError("Please enter your email");
      return;
    }

    if (!EmailValidator.validate(email)) {
      _showError("Please enter a valid email");
      return;
    }

    if (password.isEmpty) {
      _showError("Please enter your password");
      return;
    }

    if (password.length < 6) {
      _showError("Password must be at least 6 characters");
      return;
    }

    // All validations passed
    print("Email: $email, Password: $password");


    // Call your login API here
    /// show loader
    _showLoader();

    Map<String,dynamic> body={
      "email" : _emailController.text,
      "password" : _passwordController.text
    };

    // simulate API call
    NetworkResponse response=await NetworkCaller.postRequest(url: ApiUrls.loginUrl,body: body);

    //  hide loader
    _hideLoader();

     if(!mounted){
       return;
     }

    final data=response.body;

    if(response.success){


       final data=response.body!["data"];
       final token=data["token"];
       final user=data["user"];

     /// pass the userInfo map to the model
       UserModel model =UserModel.fromJson(user);

      await AuthController.saveDataAndToken(token, model);



       if(!mounted){

         return;
       }

      Navigator.pushNamedAndRemoveUntil(context, BottomNavHolderScreen.name, (predicate)=>false);




    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.errorMsg!)));
    }






  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }



  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

}
