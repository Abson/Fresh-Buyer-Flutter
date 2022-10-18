import 'package:flutter/material.dart';
import 'package:freshbuyer/screens/home/hearder.dart';
import 'package:freshbuyer/screens/home/search_field.dart';
import 'package:freshbuyer/screens/home/special_offer.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  static String route() => '/home';

  const HomeScreen({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const HomeHeader(),
            const SizedBox(height: 24),
            const SearchField(),
            const SizedBox(height: 24),
            SpecialOffers()
          ],
        ),
      ),
    );
  }
}
