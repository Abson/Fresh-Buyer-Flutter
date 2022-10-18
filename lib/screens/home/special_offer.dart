import 'package:flutter/material.dart';
import 'package:freshbuyer/model/special_offers.dart';
import 'package:freshbuyer/size_config.dart';

class SpecialOffers extends StatefulWidget {
  const SpecialOffers({super.key});

  @override
  State<SpecialOffers> createState() => _SpecialOffersState();
}

class _SpecialOffersState extends State<SpecialOffers> {
  late final List<SpecialOffer> datas = specialOfferDatas;

  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Special Offers',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF212121)),
            ),
            Text(
              'See All',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF212121)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Stack(children: [
          Container(
            height: 181,
            decoration: const BoxDecoration(
              color: Color(0xFFE7E7E7),
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
            child: PageView.builder(
              itemBuilder: _buildPageItem,
              itemCount: 4,
              allowImplicitScrolling: true,
              onPageChanged: (value) {
                setState(() => selectIndex = value);
              },
            ),
          ),
          _buildPageIndicator()
        ]),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          itemCount: datas.length,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 100,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            maxCrossAxisExtent: 77,
          ),
          itemBuilder: ((context, index) {
            final data = datas[index];
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0x10101014),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(data.icon, width: 28, height: 28),
                  ),
                ),
                const SizedBox(height: 12),
                FittedBox(
                  child: Text(
                    data.title,
                    style: const TextStyle(
                        color: Color(0xff424242), fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            );
          }),
        )
      ],
    );
  }

  Widget _buildPageItem(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('25%', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                SizedBox(height: 12),
                Text('Today’s Special!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(height: 12),
                Text('Get discount for every order, only valid for today',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
              ],
            ),
          ),
        ),
        Image.asset('assets/icons/product_sofa.png')
      ],
    );
  }

  Widget _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(i == selectIndex ? _indicator(true) : _indicator(false));
    }
    return Container(
      height: 181,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return SizedBox(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        height: 4.0,
        width: isActive ? 16 : 4.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2)),
          // boxShadow: [
          //   isActive
          //       ? BoxShadow(
          //           color: const Color(0XFF101010).withOpacity(0.72),
          //           blurRadius: 4.0,
          //           spreadRadius: 1.0,
          //           offset: const Offset(0.0, 0.0),
          //         )
          //       : const BoxShadow(color: Colors.transparent)
          // ],
          // shape: BoxShape.circle,
          color: isActive ? const Color(0XFF101010) : const Color(0xFFBDBDBD),
        ),
      ),
    );
  }
}
