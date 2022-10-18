import 'package:flutter/material.dart';
import 'package:freshbuyer/screens/home/hearder.dart';
import 'package:freshbuyer/screens/home/most_popular.dart';
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
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              flexibleSpace: HomeHeader(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                ((context, index) => _buildBody()),
                childCount: 1,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 60,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('List Item $index'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: const [
        SizedBox(height: 24),
        SearchField(),
        SizedBox(height: 24),
        SpecialOffers(),
        SizedBox(height: 24),
        MostPupularCategory(),
      ],
    );
  }
}
