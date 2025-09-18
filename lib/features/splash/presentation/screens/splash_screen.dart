import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_helper/app/app_colors.dart';
import 'package:task_helper/app/images_path.dart';
import 'package:task_helper/features/auth/presentation/screens/login_screen.dart';
import 'package:task_helper/features/shared/presentation/screens/bottom_nav_holder_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const  String name="/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }


  Future<void> _moveToNextScreen() async{

   await Future.delayed(Duration(
      seconds: 3,
    ));

   if(!mounted){
     return;
   }

   Navigator.pushReplacementNamed(context,LoginScreen.name);


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child:Image.asset(ImagesPath.taskLogo,width: 200,height: 200,),
      ),

    );
  }
}

