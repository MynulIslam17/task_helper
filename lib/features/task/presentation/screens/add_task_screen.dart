import 'package:flutter/material.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/text_field_with_shadow.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  static const String name = "add_task_screen";

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Add Task',
          style: TextTheme.of(context).titleMedium?.copyWith(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Name Field
              Text(
                'Task title',
                style: TextTheme.of(context).titleMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),

              TextFieldWithShadow(
                hint: "Task title",
                controller: _titleController,
              ),
              const SizedBox(height: 24),

              // Description Field
              Text(
                'Description',
                style: TextTheme.of(context).titleMedium?.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),

              TextFieldWithShadow(
                hint: "Task description",
                maxLine: 4,
                controller: _descriptionController,
              ),
              const SizedBox(height: 24),

              ElevatedButton(onPressed: () {

              },

                  child: Text("Save Task")
              ),


            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _descriptionController.clear;
    super.dispose();
  }
}
