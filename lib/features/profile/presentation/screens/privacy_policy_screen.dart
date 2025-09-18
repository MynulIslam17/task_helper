import 'package:flutter/material.dart';
import 'package:task_helper/features/profile/presentation/widgets/custome_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const String name="privacy_policy_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: CustomAppBar(title: "Privacy & Policy"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Policy - Task Manager App',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff111827),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your privacy is important to us. This Privacy Policy outlines how the Task Manager App handles your information and protects your data.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff6B7280),
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: '1. Information Collection',
              content:
              'The Task Manager App may collect limited information such as your name, email address, and preferences—strictly for the purpose of enhancing your task management experience. We do not collect sensitive personal information unnecessarily.',
            ),
            _buildSection(
              title: '2. Local Storage',
              content:
              'Your tasks, subtasks, and user preferences are securely stored in your system or locally on your device (depending on platform settings). This data is used solely to support the app\'s features like scheduling, notifications, and user customization.',
            ),
            _buildSection(
              title: '3. No Tracking',
              content:
              'We do not use third-party trackers or intrusive analytics tools to monitor your behavior. Any performance monitoring is strictly anonymized and used internally to improve the app experience.',
            ),
            _buildSection(
              title: '4. Static Data Display',
              content:
              'If the app integrates with external tools (e.g., calendar, cloud storage), those services are governed by their own privacy policies. We do not control or assume responsibility for their data handling practices.',
            ),
            _buildSection(
              title: '5. Third-Party Services',
              content:
              'We implement industry-standard measures to ensure your information is protected from unauthorized access, alteration, or misuse. This includes encryption, secure servers, and routine maintenance.',
            ),
            _buildSection(
              title: '6. Data Security',
              content:
              'You retain full control over your account data. You can delete or export your tasks and personal information at any time through your profile settings (if applicable).',
            ),
            _buildSection(
              title: '7. Policy Updates',
              content:
              'This Privacy Policy may be updated periodically. Any changes will be clearly communicated within the app, and continued use constitutes your acceptance of the new terms.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff111827),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xff6B7280),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}