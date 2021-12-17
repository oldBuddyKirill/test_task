import 'package:auto_route/auto_route.dart';
import 'package:test_task/features/main/categories/view/categories_page.dart';
import 'package:test_task/features/main/products/view/producst_page.dart';
import 'package:test_task/features/main/view/empty_page.dart';
import 'package:test_task/features/main/view/main_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(
    page: MainPage,
    initial: true,
    children: [
      AutoRoute(page: EmptyPage),
      AutoRoute(
        page: CategoriesPage,
        children: [
          AutoRoute(page: ProductsPage),
        ],
      ),

      // AutoRoute(
      //   page: EmptyRouterPage,
      //   children: [
      //     AutoRoute(page: CategoriesPage), // todo add children and empty router page
      //     AutoRoute(page: ProductsPage),
      //   ],
      // ),
    ],
  ),
])
class $AppRouter {}
