// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i9;

import '../features/main/categories/view/categories_page.dart' as _i7;
import '../features/main/products/models/product_model.dart' as _i10;
import '../features/main/products/view/producst_page.dart' as _i8;
import '../features/main/view/cart_page.dart' as _i4;
import '../features/main/view/favorites_page.dart' as _i3;
import '../features/main/view/home_page.dart' as _i2;
import '../features/main/view/main_page.dart' as _i1;
import '../features/main/view/profile_page.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.MainPage());
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    FavoritesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.FavoritesPage());
    },
    CartRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.CartPage());
    },
    ProfileRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfilePage());
    },
    CategoriesRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    CategoriesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.CategoriesPage());
    },
    ProductsRoute.name: (routeData) {
      final args = routeData.argsAs<ProductsRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i8.ProductsPage(key: args.key, productList: args.productList));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(MainRoute.name, path: '/', children: [
          _i6.RouteConfig(HomeRoute.name,
              path: 'home-page', parent: MainRoute.name),
          _i6.RouteConfig(FavoritesRoute.name,
              path: 'favorites-page', parent: MainRoute.name),
          _i6.RouteConfig(CartRoute.name,
              path: 'cart-page', parent: MainRoute.name),
          _i6.RouteConfig(ProfileRoute.name,
              path: 'profile-page', parent: MainRoute.name),
          _i6.RouteConfig(CategoriesRouter.name,
              path: 'empty-router-page',
              parent: MainRoute.name,
              children: [
                _i6.RouteConfig(CategoriesRoute.name,
                    path: '', parent: CategoriesRouter.name),
                _i6.RouteConfig(ProductsRoute.name,
                    path: 'products-page', parent: CategoriesRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.FavoritesPage]
class FavoritesRoute extends _i6.PageRouteInfo<void> {
  const FavoritesRoute() : super(FavoritesRoute.name, path: 'favorites-page');

  static const String name = 'FavoritesRoute';
}

/// generated route for
/// [_i4.CartPage]
class CartRoute extends _i6.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: 'cart-page');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile-page');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class CategoriesRouter extends _i6.PageRouteInfo<void> {
  const CategoriesRouter({List<_i6.PageRouteInfo>? children})
      : super(CategoriesRouter.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'CategoriesRouter';
}

/// generated route for
/// [_i7.CategoriesPage]
class CategoriesRoute extends _i6.PageRouteInfo<void> {
  const CategoriesRoute() : super(CategoriesRoute.name, path: '');

  static const String name = 'CategoriesRoute';
}

/// generated route for
/// [_i8.ProductsPage]
class ProductsRoute extends _i6.PageRouteInfo<ProductsRouteArgs> {
  ProductsRoute({_i9.Key? key, required List<_i10.ProductModel> productList})
      : super(ProductsRoute.name,
            path: 'products-page',
            args: ProductsRouteArgs(key: key, productList: productList));

  static const String name = 'ProductsRoute';
}

class ProductsRouteArgs {
  const ProductsRouteArgs({this.key, required this.productList});

  final _i9.Key? key;

  final List<_i10.ProductModel> productList;

  @override
  String toString() {
    return 'ProductsRouteArgs{key: $key, productList: $productList}';
  }
}
