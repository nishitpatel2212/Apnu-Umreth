import 'package:apnu_umreth/components/color.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  // Corrected the constructor
  const CommonAppBar({
    Key? key,
    required this.title, // 'required' should be here
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryColor1,
              AppColors.primaryColor2,
            ],
          ),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(color: AppColors.whiteColor),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.whiteColor, // Set back icon color to white
      ),
      actions: actions?.map((action) {
        // Apply white color to each action icon
        return IconTheme(
          data: const IconThemeData(color: AppColors.whiteColor),
          child: action,
        );
      }).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
