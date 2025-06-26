import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.hasBackButton = false,
    this.actions = const [],
    this.height = kToolbarHeight,
  });
  final double height;
  final String title;
  final bool hasBackButton;
  final List<Widget> actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      leading: (hasBackButton)
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(Icons.close),
            )
          : null,
      actions: actions,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 50);
}
