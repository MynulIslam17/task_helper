import 'package:flutter/material.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffF0F9FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xff22C55E)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        leadingWidth: 70,
        title: const Text(
          'Terms & Condition',
          style: TextStyle(
            color: Color(0xff22C55E),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Terms & Conditions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff111827),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome to the Task Manager App. By accessing or using this application, you agree to the following terms and conditions:',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff6B7280),
              ),
            ),
            const SizedBox(height: 20),
            _buildSection(
              title: '1. Use of the App',
              content:
                  'This app is designed to help users create, manage, and track personal or professional tasks efficiently. By using the app, you agree to use it responsibly and only for lawful purposes.',
            ),
            _buildSection(
              title: '2. Accuracy of Information',
              content:
                  'All tasks, notes, and other information entered by the user are stored securely. While we strive to maintain accurate task management functionality, the app is not responsible for missed deadlines, incorrect entries, or user-generated errors.',
            ),
            _buildSection(
              title: '3. User Responsibility',
              content:
                  'Users are solely responsible for managing their tasks, reminders, and any personal or professional outcomes related to the completion or non-completion of tasks created within the app.',
            ),
            _buildSection(
              title: '4. Data Collection',
              content:
                  'We respect your privacy. The Task Manager App may collect limited personal data (such as name, email, and usage patterns) solely for improving user experience. No data is shared with third parties without user consent.',
            ),
            _buildSection(
              title: '5. Limitation of Liability',
              content:
                  'We are not liable for any loss of productivity, missed deadlines, or damages resulting from your use of the app. The app is a productivity tool and should be used at your discretion.',
            ),
            _buildSection(
              title: '6. Third-Party Links',
              content:
                  'If the app connects to any third-party tools (e.g., calendar, email), we are not responsible for their data policies or service availability. Use of such services is subject to their respective terms.',
            ),
            _buildSection(
              title: '7. Changes to Terms',
              content:
                  'We reserve the right to update these Terms & Conditions at any time. Continued use of the app following any changes will constitute your acceptance of those revised terms.',
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