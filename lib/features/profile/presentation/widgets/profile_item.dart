import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class ProfileItem extends StatefulWidget {
  final String heading;
  final IconData icon;
  final  VoidCallback onTap;
  final Color ? textColor;
  final Color ? iconColor;
  const ProfileItem({
    super.key,
    required this.heading,
    required this.icon,
    required this.onTap,
    this.textColor,
    this.iconColor
  });

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(
                widget.icon, // use widget.icon
                color: widget.iconColor ?? AppColors.btnColors,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Text(
                widget.heading, // use widget.heading
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: widget.textColor ?? Colors.black
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
