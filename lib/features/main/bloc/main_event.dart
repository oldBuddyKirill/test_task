part of 'main_bloc.dart';

abstract class MainEvent {}

class LoadCategories extends MainEvent {}

class OnCategoryTap extends MainEvent {
  final int id;
  OnCategoryTap(this.id);
}

class OnFilterTap extends MainEvent{
  bool? isSelected;
  OnFilterTap(this.isSelected);
}


