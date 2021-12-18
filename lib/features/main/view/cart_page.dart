import 'package:flutter/material.dart';
import 'package:test_task/resources/app_colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Экран "Корзина"',
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
