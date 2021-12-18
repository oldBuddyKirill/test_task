import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:test_task/features/main/categories/models/categories_model.dart';
import 'package:test_task/features/main/categories/repository/categories_repository.dart';
import 'package:test_task/features/main/products/models/product_model.dart';
import 'package:test_task/features/main/products/repository/products_repository.dart';
import 'package:test_task/router/app_router.gr.dart';
import 'package:test_task/services/logger.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required this.router}) : super(MainInitial()) {
    on<LoadCategories>(_loadCategories);
    on<OnCategoryTap>(_loadProducts);
  }

  List<CategoriesModel> categoriesList = [];
  List<ProductModel> productList = [];
  final StackRouter router;

  FutureOr<void> _loadProducts(event, emit) async {
    try {
      Logger.log('MainBloc: start loading products; id:${event.id}');
      emit(Loading());
      productList = await ProductsRepository.getProducts(event.id);
      emit(ShowScreen());
      router.push(ProductsRoute(productList: productList));
    } catch (e) {
      Logger.log('MainBloc: error while loading products');
    }
  }

  FutureOr<void> _loadCategories(event, emit) async {
    try {
      Logger.log('MainBloc: start loading categories');
      emit(Loading());
      categoriesList = await CategoriesRepository.getCategories();
      emit(ShowScreen());
    } catch (e) {
      Logger.log('MainBloc: error while loading categories');
    }
  }
}
