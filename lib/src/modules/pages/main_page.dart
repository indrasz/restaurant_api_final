import 'package:flutter/material.dart';
import 'package:foodyar_final/src/modules/pages/home_page.dart';
import 'package:foodyar_final/src/modules/pages/favorite_page.dart';
import 'package:foodyar_final/src/modules/pages/setting_page.dart';
import 'package:foodyar_final/src/res/res.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: const [
          HomePage(),
          FavoritePage(),
          SettingPage(),
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home,
          color: kGreenColor,
        ),
        inactiveIcon: const Icon(
          Icons.home,
          color: kGreyColor,
        ),
        title: ("Home"),
        activeColorPrimary: kGreenColor,
        inactiveColorPrimary: kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.favorite,
          color: kGreenColor,
        ),
        inactiveIcon: const Icon(
          Icons.favorite,
          color: kGreyColor,
        ),
        title: ("Favorite"),
        activeColorPrimary: kGreenColor,
        inactiveColorPrimary: kGreyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.settings,
          color: kGreenColor,
        ),
        inactiveIcon: const Icon(
          Icons.settings,
          color: kGreyColor,
        ),
        title: ("Setting"),
        activeColorPrimary: kGreenColor,
        inactiveColorPrimary: kGreyColor,
      ),
    ];
  }
}
