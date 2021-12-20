import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:meta/meta.dart';
import 'package:test_task/features/main/main1.dart';
import 'package:test_task/services/logger.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(this.pagingController) : super(ProductsInitial()) {
    on<FetchPage>(_fetchPage);
  }

  final PagingController pagingController;

  FutureOr<void> _fetchPage(FetchPage event, Emitter<ProductsState> emit) async {
    try {
      final newItems = await ProductsRepository.getProducts(event.categoryId, event.page);
      final isLastPage = ProductsRepository.isLastPage;
      print('isLastPage = $isLastPage');
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = event.page + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (e) {
      Logger.log('MainBloc: error while loading products');
    }
  }
}
