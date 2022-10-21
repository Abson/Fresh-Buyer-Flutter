import 'package:flutter/material.dart';
import 'package:freshbuyer/screens/profile/header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static String route() => '/profile';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: Padding(
              padding: EdgeInsets.only(top: 30),
              child: ProfileHeader(),
            ),
            expandedHeight: 300,
          )
        ],
      ),
    );
  }
}
