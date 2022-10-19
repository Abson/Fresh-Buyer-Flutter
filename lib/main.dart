import 'package:flutter/material.dart';
import 'package:freshbuyer/routes.dart';
import 'package:freshbuyer/screens/tabbar/tabbar.dart';
import 'package:freshbuyer/theme.dart';

void main() {
  runApp(const FreshBuyerApp());
}

class FreshBuyerApp extends StatelessWidget {
  const FreshBuyerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh-Buyer',
      theme: appTheme(),
      routes: routes,
      home: const FRTabbarScreen(),
    );
  }
}
