import 'package:flutter/material.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/core/services/api_services.dart';
import 'package:task_helper/core/utils/urls/api_urls.dart';
import 'package:task_helper/features/auth/presentation/screens/verify_email.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/text_field_with_shadow.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  /// string that used for named navigation
  static const String name = "/signup";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _agreeToTerms = false;



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), // Adjusted height
              Text('Create Your Account', style: textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(
                'Join Task Manager today — organize better, work smarter, and stay in control of your day.',
                style: textTheme.titleSmall,
              ),
              const SizedBox(height: 32), // Spacing after description
              /// First Name Field
              Text(
                'First Name',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextFieldWithShadow(
                controller: _firstNameController,
                hint: "e.g. Kristin ",
              ),

              const SizedBox(height: 24),

              /// Last Name Field
              Text(
                'Last Name',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextFieldWithShadow(
                controller: _lastNameController,
                hint: "e.g. Cooper ",
              ),

              const SizedBox(height: 24),

              ///Email Address Field
              Text(
                'Email Address',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextFieldWithShadow(
                controller: _emailController,
                hint: "e.g. kristin.cooper@example.com ",
              ),

              const SizedBox(height: 24),

              /// Address Field
              Text(
                'Address',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextFieldWithShadow(
                controller: _addressController,
                hint: "e.g. 1234 Elm Street, Springfield, IL",
              ),

              const SizedBox(height: 24),

              /// Password Field (using the reusable widget)
              Text(
                'Password',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),

              TextFieldWithShadow(
                controller: _passwordController,
                hint: "•••••••• ",
              ),

              const SizedBox(height: 24),

              /// Confirm Password Field (using the reusable widget)
              Text(
                'Confirm Password',
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              TextFieldWithShadow(
                controller: _confirmPasswordController,
                hint: "•••••••• ",
              ),

              const SizedBox(height: 16),

              // Terms and Conditions
              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align checkbox to top
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: _agreeToTerms,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _agreeToTerms = newValue ?? false;
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
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'I agree to the ',
                        style: textTheme.titleSmall?.copyWith(
                          fontSize: 14,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              color: Colors.green[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' and ',
                            style: textTheme.titleSmall?.copyWith(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: TextStyle(
                              color: Colors.green[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // OR divider
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

              /// Already have an account? Log In text
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: textTheme.titleSmall?.copyWith(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Log In',
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

              // Continue Button
              ElevatedButton(
                onPressed: _registerUser,

                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _registerUser() async {

    // Basic validation
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        _addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You must agree to terms & privacy")),
      );
      return;
    }

    // Create a map with user input
    final Map<String, String> body = {
      "firstName": _firstNameController.text.trim(),
      "lastName": _lastNameController.text.trim(),
      "email": _emailController.text.trim(),
      "password": _passwordController.text.trim(),
      "address": _addressController.text.trim(),
    };


    NetworkResponse response=await NetworkCaller.postRequest(url: ApiUrls.registerUrl,body: body);

    if(response.success){
      ///
    }else{

    }






  }








  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }



}
