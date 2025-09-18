import 'package:flutter/material.dart';
import 'package:task_helper/app/images_path.dart';
import 'package:task_helper/features/profile/presentation/screens/edit_profile.dart';

import '../../../../app/app_colors.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});
  static const String name = "my_profile";

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: AppColors.primary,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(
                0xffF0F9FF,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new, color: AppColors.btnColors),

              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        leadingWidth: 70,
        title: Text(
          'My Profile',
          style: TextTheme.of(
            context,
          ).titleMedium?.copyWith(fontSize: 17, color: AppColors.btnColors),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xffF0F9FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: IconButton(
                icon: Icon(Icons.edit_outlined, color: AppColors.btnColors),

                onPressed: () {

                  Navigator.pushNamed(context, EditProfileScreen.name);

                },
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Profile Picture
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
              const SizedBox(height: 16),
              // User Name
              const Text(
                'Mojahid',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff111827),
                ),
              ),
              const SizedBox(height: 30),

              // Profile Information Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    _buildInfoCard(
                      icon: Icons.person_outline,
                      label: 'Mojahid Islam',
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard(
                      icon: Icons.email_outlined,
                      label: 'samualtman@gmail.com',
                    ),
                    const SizedBox(height: 16),
                    _buildInfoCard(
                      icon: Icons.location_on_outlined,
                      label: '1234 Elm Street, Springfield, IL',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  /// custom widger for user information

  Widget _buildInfoCard({required IconData icon, required String label}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(
                  0xff22C55E,
                ).withOpacity(0.1), // Light green background
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(icon, color: const Color(0xff22C55E), size: 20),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff111827),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
