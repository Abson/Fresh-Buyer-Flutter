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
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 185,
                mainAxisSpacing: 24,
                crossAxisSpacing: 16,
                mainAxisExtent: 285,
              ),
              delegate: SliverChildBuilderDelegate(((context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFFeeeeee),
                      ),
                      child: Stack(
                        children: [
                          Image.asset('assets/icons/product_lamp.png', width: 182, height: 182),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: GestureDetector(
                              child: Image.asset(
                                'assets/icons/not_collected@2x.png',
                                width: 28,
                                height: 28,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Glass Lamp',
                      style: TextStyle(
                        color: Color(0xFF212121),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildSoldPoint(4.5, 6937),
                    const SizedBox(height: 10),
                    const Text(
                      '\$40.00',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF212121)),
                    )
                  ],
                );
              }), childCount: 20),
            ),
            const SliverAppBar(flexibleSpace: SizedBox(height: 24))
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
        SizedBox(height: 24)
      ],
    );
  }

  Widget _buildSoldPoint(double star, int sold) {
    return Row(
      children: [
        Image.asset('assets/icons/start@2x.png', width: 20, height: 20),
        const SizedBox(width: 8),
        Text(
          '$star',
          style: const TextStyle(
            color: Color(0xFF616161),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 8),
        const Text(
          '|',
          style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF616161), fontSize: 14),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: const Color(0xFF101010).withOpacity(0.08),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            '$sold sold',
            style: const TextStyle(
              color: Color(0xFF35383F),
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
