import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';  // todo check
import 'package:test_task/features/main/categories/models/categories_model.dart';
import 'package:test_task/features/main/categories/repository/categories_repository.dart';
import 'package:test_task/router/app_router.gr.dart';
import 'package:test_task/services/logger.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required this.router}) : super(MainInitial()) {
    on<LoadCategories>(_loadCategories);
    on<OnCategoryTap>(_loadProducts);
  }

  List<CategoriesModel> models = [];
  final StackRouter router;

  FutureOr<void> _loadProducts (event, emit) async {
    print('id: ${event.id}');
    router.push(const ProductsRoute());
  }

  FutureOr <void> _loadCategories(event, emit) async {
    try{
      Logger.log('MainBloc: start loading categories');
      emit(Loading());
      models = await CategoriesRepository.getCategories();
      emit(ShowScreen());
    } catch (e) {
      Logger.log('MainBloc: error while loading categories'); // todo
    }
  }
}
