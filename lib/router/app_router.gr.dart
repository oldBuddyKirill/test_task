// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../features/main/categories/view/categories_page.dart' as _i3;
import '../features/main/products/view/producst_page.dart' as _i4;
import '../features/main/view/empty_page.dart' as _i2;
import '../features/main/view/main_page.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    EmptyRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyPage());
    },
    CategoriesRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.CategoriesPage());
    },
    ProductsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ProductsPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(MainRoute.name, path: '/', children: [
          _i5.RouteConfig(EmptyRoute.name,
              path: 'empty-page', parent: MainRoute.name),
          _i5.RouteConfig(CategoriesRoute.name,
              path: 'categories-page',
              parent: MainRoute.name,
              children: [
                _i5.RouteConfig(ProductsRoute.name,
                    path: 'products-page', parent: CategoriesRoute.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.EmptyPage]
class EmptyRoute extends _i5.PageRouteInfo<void> {
  const EmptyRoute() : super(EmptyRoute.name, path: 'empty-page');

  static const String name = 'EmptyRoute';
}

/// generated route for
/// [_i3.CategoriesPage]
class CategoriesRoute extends _i5.PageRouteInfo<void> {
  const CategoriesRoute({List<_i5.PageRouteInfo>? children})
      : super(CategoriesRoute.name,
            path: 'categories-page', initialChildren: children);

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i4.ProductsPage]
class ProductsRoute extends _i5.PageRouteInfo<void> {
  const ProductsRoute() : super(ProductsRoute.name, path: 'products-page');

  static const String name = 'ProductsRoute';
}
