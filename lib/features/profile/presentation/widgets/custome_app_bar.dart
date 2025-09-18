import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {

  final String title;

  const CustomAppBar({super.key,
  required this .title
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  /// Required when implementing PreferredSizeWidget
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: AppColors.primary,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffF0F9FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_new, color: AppColors.btnColors),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      leadingWidth: 70,
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 17,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
    );
  }


}