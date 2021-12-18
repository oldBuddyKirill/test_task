import 'package:auto_route/auto_route.dart';
import 'package:test_task/features/main/categories/view/categories_page.dart';
import 'package:test_task/features/main/products/view/producst_page.dart';
import 'package:test_task/features/main/view/cart_page.dart';
import 'package:test_task/features/main/view/favorites_page.dart';
import 'package:test_task/features/main/view/home_page.dart';
import 'package:test_task/features/main/view/main_page.dart';
import 'package:test_task/features/main/view/profile_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(
    page: MainPage,
    initial: true,
    children: [
      AutoRoute(page: HomePage),
      AutoRoute(page: FavoritesPage),
      AutoRoute(page: CartPage),
      AutoRoute(page: ProfilePage),
      AutoRoute(
        page: EmptyRouterPage,
        name: 'CategoriesRouter',
        children: [
          AutoRoute(page: CategoriesPage, initial: true), // todo add children and empty router page
          AutoRoute(page: ProductsPage),
        ],
      ),
    ],
  ),
])
class $AppRouter {}
