import 'package:flutter/material.dart';
import 'package:test_task/resources/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Экран "Профиль"',
            style: Theme.of(context).textTheme.headline5?.copyWith(color: AppColors.grey),
          ),
          Text('в разработке',
            style: Theme.of(context).textTheme.headline5?.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
