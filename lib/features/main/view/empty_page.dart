import 'package:flutter/material.dart';
import 'package:test_task/resources/app_colors.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'В разработке',
        style: Theme.of(context).textTheme.headline4?.copyWith(color: AppColors.grey),
      ),
    );
  }
}
