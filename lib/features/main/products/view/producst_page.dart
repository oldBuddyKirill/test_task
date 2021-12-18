import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/features/main/bloc/main_bloc.dart';
import 'package:test_task/features/main/products/models/product_model.dart';
import 'package:test_task/features/main/products/widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key, required this.productList}) : super(key: key);

  final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MyAppBar(),
          const Divider(height: 1),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.56,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) => SingleTile(product: productList[index]),
            ),
          )
        ],
      ),
    );
  }
}
