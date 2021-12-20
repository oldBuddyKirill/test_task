import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_task/features/main/products/bloc/products_bloc.dart';
import 'package:test_task/features/main/products/models/product_model.dart';
import 'package:test_task/features/main/products/widgets/widgets.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key, required this.categoryId}) : super(key: key);

  final int categoryId;
  ProductsBloc? _productsBloc;
  late final PagingController<int, ProductModel> _pagingController = PagingController(firstPageKey: 1)
    ..addPageRequestListener((pageKey) {
      _productsBloc?.add(FetchPage(page: pageKey, categoryId: categoryId));
    });

  @override
  Widget build(BuildContext context) {
    _productsBloc ??= ProductsBloc(_pagingController);
    return SafeArea(
      child: Column(
        children: [
          MyAppBar(),
          const Divider(height: 1),
          Expanded(
            child: PagedGridView<int, ProductModel>(
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, item, index) => SingleTile(product: item),
              ),
              pagingController: _pagingController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // todo try 1
                childAspectRatio: 0.56,
                mainAxisSpacing: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
