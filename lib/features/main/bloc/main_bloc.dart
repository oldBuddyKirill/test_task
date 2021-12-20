import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:test_task/router/app_router.gr.dart';
import 'package:test_task/services/logger.dart';

import '../main1.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required this.router}) : super(MainInitial()) {
    on<LoadCategories>(_loadCategories);
    on<OnCartTap>(_addProductInCart);
    on<OnFavoriteTap>(_addProductInFavorites);
  }

  List<CategoriesModel> categoriesList = [];
  List<int> cart = [];
  List<int> favorites = [];
  final StackRouter router;

  _addProductInFavorites(OnFavoriteTap event, emit) async {
    !favorites.contains(event.productId) ? favorites.add(event.productId) : favorites.remove(event.productId);
    emit(ShowScreen());
  }

  _addProductInCart(OnCartTap event, emit) async {
    !cart.contains(event.productId) ? cart.add(event.productId) : cart.remove(event.productId);
    emit(ShowScreen());
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
