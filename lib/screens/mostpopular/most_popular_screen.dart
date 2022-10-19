import 'package:flutter/material.dart';
import 'package:freshbuyer/components/product_card.dart';
import 'package:freshbuyer/model/popular.dart';
import 'package:freshbuyer/screens/home/most_popular.dart';

class MostPopularScreen extends StatefulWidget {
  const MostPopularScreen({super.key});

  static String route() => '/home';

  @override
  State<MostPopularScreen> createState() => _MostPopularScreenState();
}

class _MostPopularScreenState extends State<MostPopularScreen> {
  late final datas = homePopularProducts;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.fromLTRB(24, 24, 24, 0);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() => Navigator.pop(context)),
          icon: Image.asset(
            'assets/icons/back@2x.png',
            scale: 2.0,
          ),
        ),
        title: const Text(
          'Most Popular',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF212121),
          ),
        ),
        centerTitle: false,
        actions: [
          GestureDetector(
            child: Image.asset(
              'assets/icons/search@2x.png',
              scale: 2.0,
            ),
          )
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverPadding(
          padding: padding,
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              ((context, index) => const MostPupularCategory()),
              childCount: 1,
            ),
          ),
        ),
        SliverPadding(
          padding: padding,
          sliver: _buildPopulars(),
        ),
        const SliverAppBar(flexibleSpace: SizedBox(height: 24))
      ]),
    );
  }

  Widget _buildPopulars() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 185,
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        mainAxisExtent: 285,
      ),
      delegate: SliverChildBuilderDelegate(_buildPopularItem, childCount: 30),
    );
  }

  Widget _buildPopularItem(BuildContext context, int index) {
    final data = datas[index % datas.length];
    return ProductCard(
      data: data,
    );
  }
}
