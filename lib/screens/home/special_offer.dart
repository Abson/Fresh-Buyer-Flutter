import 'package:flutter/material.dart';
import 'package:freshbuyer/constants.dart';
import 'package:freshbuyer/size_config.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

  final int datas = 10;

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
        Container(
          height: 181,
          decoration: const BoxDecoration(
            color: Color(0xFFE7E7E7),
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
        const SizedBox(height: 24),
        GridView.builder(
          shrinkWrap: true,
          itemCount: datas,
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            // mainAxisSpacing: getProportionateScreenWidth(20),
            mainAxisExtent: 100,
            mainAxisSpacing: 24,
          ),
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF10101014),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(
                      'assets/icons/category_sofa@2x.png',
                      width: 28,
                      height: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Sofa',
                    style: TextStyle(
                      color: Color(0xff424242),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
              ],
            );
          }),
        )
      ],
    );
  }
}
