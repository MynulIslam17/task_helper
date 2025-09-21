import 'package:flutter/material.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/features/task/presentation/screens/edit_task_screen.dart';

class TaskDetailsScreen extends StatelessWidget {

  final String title;
  final String description;
  const TaskDetailsScreen({super.key, required this.title, required this.description});



  static const String name = "task_details_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(

        ),
        centerTitle: true,
        title: Text(
          'Task Details',
          style: TextTheme.of(context).titleMedium?.copyWith(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// custom widget for title part
                        _buildDetailItem(
                          icon: Icons.assignment_outlined,
                          title: 'Task Title',
                          content:title,
                        ),
                        const SizedBox(height: 24),

                        /// custom widgget for description part
                        _buildDetailItem(
                          icon: Icons.notes,
                          title: 'Task Description',
                          content:description
                        ),

                        const SizedBox(height: 24),

                        /// button for edit and delete
                        Row(
                          children: [
                            /// edit btn
                            Expanded(child: _customButton(

                              icon: Icons.delete_outline,
                              color: Colors.redAccent,
                              onTap: () {

                              },
                              text: 'Delete Task',
                              textColor: Colors.redAccent,
                              backgroundColor: Colors.redAccent.withOpacity(0.1),



                            )),
                            const SizedBox(width: 16),

                            /// delete btn
                            Expanded(
                              child: _customButton(

                                icon: Icons.edit_outlined,
                                color: const Color(0xff22C55E),
                                onTap: () {
                                 
                                  Navigator.pushNamed(context, EditTaskScreen.name);
                                },
                                text: 'Edit Task',
                                textColor: const Color(0xff22C55E),
                                backgroundColor: const Color(0xff22C55E).withOpacity(0.1),

                              ),
                            )

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customButton(
  {
      required IconData icon,
      required Color color,
      required VoidCallback onTap,
      required String text,
      required Color textColor,
      required Color backgroundColor,
}
      ) {

    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: color),
      label: Text(text, style: TextStyle(color: textColor)),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 5),
      ),
    );
  }

  /// widget for build task header,icon and context
  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffD0F0C0), // Light green background
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(icon, color: const Color(0xff22C55E), size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff111827),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: const TextStyle(fontSize: 14, color: Color(0xff6B7280)),
        ),
      ],
    );
  }
}
