part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class FetchPage extends ProductsEvent {
  final int categoryId;
  final int page;
  FetchPage ({required this.page, required this.categoryId});
}
