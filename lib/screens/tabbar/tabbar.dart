import 'package:flutter/material.dart';
import 'package:freshbuyer/image_loader.dart';
import 'package:freshbuyer/screens/home/home.dart';
import 'package:freshbuyer/size_config.dart';

class TabbarItem {
  final String lightIcon;
  final String boldIcon;
  final String label;

  TabbarItem({required this.lightIcon, required this.boldIcon, required this.label});

  BottomNavigationBarItem item(bool isbold) {
    return BottomNavigationBarItem(
      icon: ImageLoader.imageAsset(isbold ? boldIcon : lightIcon),
      label: label,
    );
  }

  BottomNavigationBarItem get light => item(false);
  BottomNavigationBarItem get bold => item(true);
}

class FRTabbarScreen extends StatefulWidget {
  const FRTabbarScreen({super.key});

  @override
  State<FRTabbarScreen> createState() => _FRTabbarScreenState();
}

class _FRTabbarScreenState extends State<FRTabbarScreen> {
  int _select = 0;

  final screens = [
    const HomeScreen(
      title: '首页0',
    ),
    const HomeScreen(
      title: '首页1',
    ),
    const HomeScreen(
      title: '首页2',
    ),
    const HomeScreen(
      title: '首页3',
    ),
    const HomeScreen(
      title: '首页4',
    ),
  ];

  static Image generateIcon(String path) {
    return Image.asset(
      '${ImageLoader.rootPaht}/tabbar/$path',
      width: 24,
      height: 24,
    );
  }

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: generateIcon('light/Home@2x.png'),
      activeIcon: generateIcon('bold/Home@2x.png'),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: generateIcon('light/Bag@2x.png'),
      activeIcon: generateIcon('bold/Bag@2x.png'),
      label: 'Cart',
    ),
    BottomNavigationBarItem(
      icon: generateIcon('light/Buy@2x.png'),
      activeIcon: generateIcon('bold/Buy@2x.png'),
      label: 'Orders',
    ),
    BottomNavigationBarItem(
      icon: generateIcon('light/Wallet@2x.png'),
      activeIcon: generateIcon('bold/Wallet@2x.png'),
      label: 'Wallet',
    ),
    BottomNavigationBarItem(
      icon: generateIcon('light/Profile@2x.png'),
      activeIcon: generateIcon('bold/Profile@2x.png'),
      label: 'Profile',
    ),
  ];

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: screens[_select],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: ((value) => setState(() => _select = value)),
        currentIndex: _select,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 10,
        ),
        selectedItemColor: const Color(0xFF212121),
        unselectedItemColor: const Color(0xFF9E9E9E),
      ),
    );
  }
}
