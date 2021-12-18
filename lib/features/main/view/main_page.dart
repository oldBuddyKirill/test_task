import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task/resources/app_colors.dart';
import 'package:test_task/router/app_router.gr.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        CategoriesRouter(),
        FavoritesRoute(),
        CartRoute(),
        ProfileRoute(),
      ],
      // animationDuration: const Duration(milliseconds: 2000),
      // animationCurve: Curves.easeInCirc,
      backgroundColor: AppColors.white,
      appBarBuilder: (context, tabsRouter) => AppBar(
        title:  Text(indexToTitle(context.tabsRouter), style: TextStyle(color: AppColors.grey)),
        shadowColor: const Color.fromRGBO(138, 136, 132, 0.24),
        centerTitle: true,
        elevation: 1,
        backgroundColor: AppColors.white,
        leading: const AutoBackButton(color: AppColors.grey),
      ),
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        items: _bottomItems,
        currentIndex: tabsRouter.activeIndex,
        onTap: (index) => tabsRouter.setActiveIndex(index),
        elevation: 0,
        unselectedItemColor: AppColors.grey,
        selectedItemColor: AppColors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 10,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 10,
        ),
        backgroundColor: AppColors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  String indexToTitle (TabsRouter? tabsRouter) {
    switch (tabsRouter?.activeIndex) {
      case 0:
        return 'Главная';
      case 1:
        return 'Каталог';
      case 2:
        return 'Избранное';
      case 3:
        return 'Корзина';
      case 4:
        return 'Профиль';
      default:
        return 'В разработке';
    }
  }

  Container _containerIcon({required String assetName}) => Container(
      height: 36,
      width: 36,
      alignment: Alignment.center,
      child: Image(
        image: AssetImage(assetName),
        height: 24,
        width: 24,
      ),
      margin: const EdgeInsets.symmetric(vertical: 5));

  List<BottomNavigationBarItem> get _bottomItems => <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: _containerIcon(assetName: 'assets/tab_bar/union_act.png'),
          icon: _containerIcon(assetName: 'assets/tab_bar/union.png'),
          label: 'Главная',
        ),
        BottomNavigationBarItem(
          activeIcon: _containerIcon(assetName: 'assets/tab_bar/catalogue_act.png'),
          icon: _containerIcon(assetName: 'assets/tab_bar/catalogue.png'),
          label: 'Каталог',
        ),
        BottomNavigationBarItem(
          activeIcon: _containerIcon(assetName: 'assets/tab_bar/heart_act.png'),
          icon: _containerIcon(assetName: 'assets/tab_bar/heart.png'),
          label: 'Избранное',
        ),
        BottomNavigationBarItem(
          activeIcon: _containerIcon(assetName: 'assets/tab_bar/cart_act.png'),
          icon: _containerIcon(assetName: 'assets/tab_bar/cart.png'),
          label: 'Корзина',
        ),
        BottomNavigationBarItem(
          activeIcon: _containerIcon(assetName: 'assets/tab_bar/profile_act.png'),
          icon: _containerIcon(assetName: 'assets/tab_bar/profile.png'),
          label: 'Профиль',
        ),
      ];
}
