import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_helper/app/images_path.dart';
import 'package:task_helper/core/services/api_services.dart';
import 'package:task_helper/core/utils/urls/api_urls.dart';
import 'package:task_helper/features/home/controller/all_task_controller.dart';
import 'package:task_helper/features/home/model/task_model.dart';
import 'package:task_helper/features/home/presentation/screens/widgets/task_card.dart';
import 'package:task_helper/features/task/presentation/screens/edit_task_screen.dart';
import 'package:task_helper/features/task/presentation/screens/task_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name="home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {




  final allTaskController=Get.find<AllTaskController>(); ///  GETX controller


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
/// call get all task
    _getAllTask();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(ImagesPath.demoProfileImg),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello Mojahid',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Welcome to Task Manager',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // My Tasks heading
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'My Tasks',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Task list
              GetBuilder<AllTaskController>(
                builder: (controller) {
                  if (controller.taskList.isEmpty) {
                    return const Center(child: Text("No tasks found."));
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.taskList.length,
                    itemBuilder: (context, index) {
                      final task = controller.taskList[index];

                      return TaskCard(
                        onTap: () {
                          Navigator.pushNamed(context, TaskDetailsScreen.name);
                        },
                        title: "Task $index: ${task.title}",
                        description: task.description,
                      );
                    },
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  void _getAllTask() async{


    bool success=await allTaskController.retrieveTask();
    if(!mounted){
      return;
    }

    if(!success){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(allTaskController.errorMessage!)));

    }





  }
}
