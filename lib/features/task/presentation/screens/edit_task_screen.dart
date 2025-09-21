import 'package:flutter/material.dart';

import '../../../auth/presentation/screens/widgets/text_field_with_shadow.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  static const String name="edit_task_screen";

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {

  final TextEditingController _titleEditController = TextEditingController();
  final TextEditingController _descriptionEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(),
        centerTitle: true,
        title: Text(
          'Edit Task',
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
                controller: _titleEditController,
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
                controller:_descriptionEditController,
              ),
              const SizedBox(height: 24),

              ElevatedButton(onPressed:_ediTask,

                  child: Text("Update Task")
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
    _titleEditController.dispose();
    _descriptionEditController.dispose();
    super.dispose();
  }



  Future<void> _ediTask() async{




  }




}
