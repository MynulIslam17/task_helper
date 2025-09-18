import 'package:flutter/material.dart';
import 'package:task_helper/app/images_path.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/text_field_with_shadow.dart';
import 'package:task_helper/features/profile/presentation/widgets/custome_app_bar.dart';
import '../../../../app/app_colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static const String name = "edit_profile";

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: 'Mojahid Islam');
    _emailController = TextEditingController(text: 'samualtman@gmail.com');
    _addressController = TextEditingController(text: '1234 Elm Street, Springfield, IL');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(title: "Edit Profile"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              /// Profile Picture Section
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 4),
                    ),
                    child:  CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(ImagesPath.demoProfileImg),
                    ),
                  ),
                  /// proile picture add section
                  InkWell(
                    onTap: (){

                    },
                    child: Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xff22C55E),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                      ),
                    ),
                  ),
                ],
              ),

              /// User information
              const SizedBox(height: 30),
              _buildInputField(
                controller: _nameController,
                label: 'Name',
                hintText: 'Enter your name',
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _emailController,
                label: 'Email Address',
                hintText: 'Enter your email address',
              ),
              const SizedBox(height: 16),
              _buildInputField(
                controller: _addressController,
                label: 'Address',
                hintText: 'Enter your address',
              ),
              const SizedBox(height: 30),

              /// Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Name: ${_nameController.text}');
                    debugPrint('Email: ${_emailController.text}');
                    debugPrint('Address: ${_addressController.text}');
                  },

                  child: const Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff111827),
          ),
        ),
        const SizedBox(height: 8),
        TextFieldWithShadow(
          controller: controller,
          hint: hintText,
        ),
      ],
    );
  }
}
