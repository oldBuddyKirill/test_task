part of 'main_bloc.dart';

abstract class MainEvent {}

class LoadCategories extends MainEvent {}

class OnCartTap extends MainEvent {
  final int productId;
  OnCartTap(this.productId);
}

class OnFavoriteTap extends MainEvent {
  final int productId;
  OnFavoriteTap(this.productId);
}


