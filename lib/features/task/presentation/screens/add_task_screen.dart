import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_helper/core/services/api_services.dart';
import 'package:task_helper/core/utils/urls/api_urls.dart';
import 'package:task_helper/features/auth/presentation/screens/widgets/text_field_with_shadow.dart';
import 'package:task_helper/features/home/controller/all_task_controller.dart';
import 'package:task_helper/features/profile/presentation/widgets/dialog.dart';
import 'package:task_helper/features/profile/presentation/widgets/success_dialog.dart';

import '../../../../app/images_path.dart';
import '../../../shared/widgets/spiner.dart';

class AddTaskScreen extends StatefulWidget {

  final void Function(String message)? onTaskAdded;
  const AddTaskScreen({super.key, this.onTaskAdded});

  static const String name = "add_task_screen";

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {

  final allTaskController=Get.find<AllTaskController>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();




  bool _isLoading = false;

  ///  pragress spin indicator
  void _showLoader() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black45,
      useRootNavigator: true,
      builder: (_) => Center(
        child: SpinningLoader(assetPath: ImagesPath.spiner_img),
      ),
    );
  }


  void _hideLoader() {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

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

              ElevatedButton(onPressed:_addTask,

                  child: Text("Save Task")
              ),


            ],
          ),
        ),
      ),
    );
  }


  /// add task

  void _addTask() async{


    if(_titleController.text.isEmpty || _descriptionController.text.isEmpty  ){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("field cant be empty")));
      return;
    }

/// show a dialog first
    showDialog(
        context: context,
        builder: (context){
          return LogoutDialog(text: "Are you sure you want to add this task?",
            onTap: () async{

            Navigator.pop(context);
            _showLoader();

            Map<String, dynamic> body = {
              "title": _titleController.text,
              "description": _descriptionController.text,
            };

            NetworkResponse response = await NetworkCaller.postRequest(
              url: ApiUrls.createTaskUrl,
              body: body,
            );

            _hideLoader(); // hide loading spinner

            if (!mounted) return;

            if (response.success) {
              // Call the callback to update home and show success
              if (widget.onTaskAdded != null) {
                widget.onTaskAdded!("Task added successfully!");
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(response.body!["error"])),
              );
            }
            


           


            },
          );
        }
    );



  }




  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
