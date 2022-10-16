import 'package:flutter/material.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({super.key});

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
      ],
    );
  }
}
