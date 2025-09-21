import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/features/home/presentation/screens/home_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/change_password_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/edit_profile.dart';
import 'package:task_helper/features/profile/presentation/screens/help_and_support_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/my_profile.dart';
import 'package:task_helper/features/profile/presentation/screens/privacy_policy_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/profile_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/settings_screen.dart';
import 'package:task_helper/features/profile/presentation/screens/terms_and_conditions_screen.dart';
import 'package:task_helper/features/task/presentation/screens/add_task_screen.dart';
import 'package:task_helper/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:task_helper/features/task/presentation/screens/edit_task_screen.dart';
import 'package:task_helper/features/task/presentation/screens/task_details_screen.dart';

import '../../../home/controller/all_task_controller.dart';

class BottomNavHolderScreen extends StatefulWidget {
  const BottomNavHolderScreen({super.key});
  static const String name = "nav_holder_screen";

  @override
  State<BottomNavHolderScreen> createState() => _BottomNavHolderScreenState();
}

class _BottomNavHolderScreenState extends State<BottomNavHolderScreen> {
  int _currentIndex = 0;

  final GlobalKey<NavigatorState> _homeNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _profileNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Home tab navigator
          Navigator(
            key: _homeNavigatorKey,
            onGenerateRoute: (settings) {
              if (settings.name == TaskDetailsScreen.name) {

                final arg=settings.arguments as Map<String,dynamic>;
                return MaterialPageRoute(
                  builder: (_) =>  TaskDetailsScreen(
                      id : arg["id"],
                    title: arg["title"],
                    description: arg["description"],

                      onTaskDeleted: (message) async {
                        // Show success message on home tab
                        ScaffoldMessenger.of(_homeNavigatorKey.currentContext!)
                            .showSnackBar(
                          SnackBar(content: Text(message)),
                        );

                        // Refresh tasks
                        final allTaskController = Get.find<AllTaskController>();
                        await allTaskController.retrieveTask();

                        // Pop back to home screen
                        _homeNavigatorKey.currentState?.popUntil((route) => route.isFirst);


                      }

                  ),
                );
              } else if (settings.name == EditTaskScreen.name) {
                return MaterialPageRoute(
                  builder: (_) => const EditTaskScreen(),
                );
              }
              return MaterialPageRoute(builder: (_) => const HomeScreen());
            },
          ),

          // Add Task tab
          // 🔹 Add Task tab navigator (new!)
          Navigator(
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                builder: (_) => AddTaskScreen(
                  onTaskAdded: (message) async {

                    // Show SnackBar on home screen
                    ScaffoldMessenger.of(_homeNavigatorKey.currentContext!).showSnackBar(
                      SnackBar(content: Text(message)),
                    );

                    setState(() {
                      _currentIndex = 0; // switch to Home tab
                    });


                // Trigger task reload
                    final allTaskController = Get.find<AllTaskController>();
                    await allTaskController.retrieveTask();
                    _homeNavigatorKey.currentState?.popUntil((route) => route.isFirst);
                  },
                ),
              );
            },
          ),


          // Profile tab
        //  const ProfileScreen(),

          Navigator(
            key: _profileNavigatorKey,
            onGenerateRoute: ( settings){

              if(settings.name==MyProfileScreen.name){
                return MaterialPageRoute(builder: (context)=>MyProfileScreen());
              }else if(settings.name==EditProfileScreen.name){
                return MaterialPageRoute(builder: (context)=>EditProfileScreen());
              } else if(settings.name==SettingsScreen.name){
                return MaterialPageRoute(builder: (context)=>SettingsScreen());
              } else if(settings.name==ChangePasswordScreen.name){
                return MaterialPageRoute(builder: (context)=>ChangePasswordScreen());
              }else if(settings.name==PrivacyPolicyScreen.name){
                return MaterialPageRoute(builder: (context)=>PrivacyPolicyScreen());
              }else if(settings.name==HelpAndSupportScreen.name){
                return MaterialPageRoute(builder: (context)=>HelpAndSupportScreen());
              }else if(settings.name==TermsAndConditionScreen.name){
                return MaterialPageRoute(builder: (context)=>TermsAndConditionScreen());
              }

              return MaterialPageRoute(builder: (_) => ProfileScreen());

            },



          )


        ],
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: FloatingActionButton(
          tooltip: 'Add',
          shape: const CircleBorder(),
          onPressed: () {
            setState(() => _currentIndex = 1);
          },
          backgroundColor: _currentIndex == 1
              ? AppColors.btnColors
              : Colors.black45,
          child: Icon(
            _currentIndex == 1 ? Icons.add_circle : Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        height: 65,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: _currentIndex == 0
                    ? AppColors.btnColors
                    : Colors.black45,
              ),
              onPressed: () {
                setState(() => _currentIndex = 0);
                // Pop all subpages (TaskDetails, EditTask) and go to HomeScreen
                _homeNavigatorKey.currentState?.popUntil(
                  (route) => route.isFirst,
                );
              },
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: Icon(
                Icons.person,
                color: _currentIndex == 2
                    ? AppColors.btnColors
                    : Colors.black45,
              ),
              onPressed: () {
                setState(() => _currentIndex = 2);

                _profileNavigatorKey.currentState?.popUntil(
                      (route) => route.isFirst,
                );

              },
            ),
          ],
        ),
      ),
    );
  }
}
