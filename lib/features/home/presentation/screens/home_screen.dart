import 'package:flutter/material.dart';
import 'package:task_helper/app/images_path.dart';
import 'package:task_helper/features/home/presentation/screens/widgets/task_card.dart';
import 'package:task_helper/features/task/presentation/screens/edit_task_screen.dart';
import 'package:task_helper/features/task/presentation/screens/task_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return TaskCard(
                    onTap: (){

                      Navigator.pushNamed(context, TaskDetailsScreen.name);
                    },
                    title: "Task $index: Design Landing Page Header",
                    description:
                    "Create a clean, responsive header with logo, nav links, and a call-to-action button.",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
