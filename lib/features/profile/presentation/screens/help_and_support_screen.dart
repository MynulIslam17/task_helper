import 'package:flutter/material.dart';
import 'package:task_helper/features/profile/presentation/widgets/custome_app_bar.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  static const String name="help_and_support_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: CustomAppBar(title: "Help & Support"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FAQs Section
            const Text(
              'FAQs',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff111827),
              ),
            ),
            const SizedBox(height: 16),
            _buildFAQItem(
              question: 'How do I create a new task?',
              answer:
              'Tap the "Add Task" button on the navigation bar. Fill in the task title, due date, priority, and other details—then tap "Save".',
            ),
            _buildFAQItem(
              question: 'How can I view task details?',
              answer:
              'From the main task list, simply tap on any task to open its details page, where you can view or edit the information.',
            ),
            _buildFAQItem(
              question: 'How can I mark a task as favorite or important?',
              answer:
              'You can mark a task as important or a favorite by long-pressing on the task card from the home screen.',
            ),
            _buildFAQItem(
              question: 'How do I edit or delete a task?',
              answer:
              'On the task details page, tap the "Edit" button to modify the task, or the "Delete" button to remove it permanently.',
            ),
            _buildFAQItem(
              question: 'Is my data secure?',
              answer:
              'Yes, your data is stored locally on your device, and we use standard security measures to protect your information from unauthorized access.',
            ),
            const SizedBox(height: 30),

            // Need More Help Section
            const Text(
              'Need More Help?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff111827),
              ),
            ),
            const SizedBox(height: 16),
            _buildHelpCard(
              title: 'Email Us',
              subtitle: 'support@taskmanagerexample.com',
              icon: Icons.mail_outline,
            ),
            const SizedBox(height: 16),
            _buildHelpCard(
              title: 'Call Us',
              subtitle: 'Our help desk is available 24/7 to support your workflow.',
              icon: Icons.phone_outlined,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xff111827),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              answer,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff6B7280),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpCard({required String title, required String subtitle, required IconData icon}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xffF0F9FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff22C55E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(icon, color: const Color(0xff22C55E), size: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
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
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}