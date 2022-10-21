import 'package:flutter/material.dart';
import 'package:freshbuyer/screens/profile/header.dart';

typedef ProfileOptionTap = void Function();

class ProfileOption {
  String title;
  String icon;
  ProfileOptionTap? onClick;

  ProfileOption({required this.title, required this.icon, this.onClick});
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static String route() => '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static _profileIcon(String last) => 'assets/icons/profile/$last';

  final datas = <ProfileOption>[
    ProfileOption(title: 'Edit Profile', icon: _profileIcon('user@2x.png')),
    ProfileOption(title: 'Adress', icon: _profileIcon('location@2x.png')),
    ProfileOption(title: 'Notification', icon: _profileIcon('notification@2x.png')),
    ProfileOption(title: 'Payment', icon: _profileIcon('wallet@2x.png')),
    ProfileOption(title: 'Security', icon: _profileIcon('shield_done@2x.png')),
    ProfileOption(title: 'Language', icon: _profileIcon('more_circle@2x.png')),
    ProfileOption(title: 'Dark Mode', icon: _profileIcon('show@2x.png')),
    ProfileOption(title: 'Help Center', icon: _profileIcon('info_square@2x.png')),
    ProfileOption(title: 'Invite Friends', icon: _profileIcon('user@2x.png')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverList(
            delegate: SliverChildListDelegate.fixed([
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ProfileHeader(),
              ),
            ]),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final data = datas[index];
                  return _buildOption(context, index, data);
                },
                childCount: datas.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(BuildContext context, int index, ProfileOption data) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          children: [
            Image.asset(data.icon, scale: 2),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                data.title,
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Image.asset('assets/icons/profile/arrow_right@2x.png', scale: 2)
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
