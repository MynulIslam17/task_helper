import 'package:flutter/material.dart';
import 'package:task_helper/app/images_path.dart';


class TaskCard extends StatelessWidget {

  final String title;

  final String description;
  final  VoidCallback onTap;


  const TaskCard({

    super.key,

    required this.title,

    required this.description,
    required this.onTap,

  });


  @override

  Widget build(BuildContext context) {

    return InkWell(

      onTap: onTap,
      child: Container(

          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius: BorderRadius.circular(16.0),

          ),

          child: Stack(

            children: [


              Positioned(
                  right: -30,
                  top: -40,

                  child: Image.asset(ImagesPath.overlayImg2)),


              Positioned(
                  left: -6,
                  bottom: -10,

                  child: Image.asset(ImagesPath.overlayImg2)),

              Positioned(
                  left: -35,
                  bottom:40,

                  child: Image.asset(ImagesPath.overlayImg2)),


              Padding(

                padding: const EdgeInsets.all(16.0),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Image.asset(

                      ImagesPath.taskIcon,

                      width:35,


                    ),

                    const SizedBox(height: 10),

                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(

                            title,

                            style: TextTheme.of(context).titleMedium?.copyWith(

                              fontSize: 14,


                            )

                        ),

                        const SizedBox(height: 8.0),

                        Text(

                          description,

                          style:TextTheme.of(context).titleSmall?.copyWith(

                              fontSize: 12,

                              fontWeight: FontWeight.w400,

                              color: Color(0xff6B7280)

                          ),

                          overflow: TextOverflow.ellipsis,

                          maxLines: 2,

                        ),

                      ],

                    ),

                  ],

                ),

              ),



            ],

          )

      ),
    );

  }

}