import 'package:flutter/material.dart';
import 'package:freshbuyer/model/popular.dart';

class MostPupular extends StatefulWidget {
  const MostPupular({super.key});

  @override
  State<MostPupular> createState() => _MostPupularState();
}

class _MostPupularState extends State<MostPupular> {
  late final datas = homePopularCategories;

  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(),
        const SizedBox(height: 24),
        _buildBody(),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text('Special Offers',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xFF212121))),
        Text('See All',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF212121))),
      ],
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        itemCount: datas.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: _buildItem,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 12);
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final data = datas[index];
    final isActive = _selectIndex == index;
    return GestureDetector(
      onTap: (() => _onTapItem(index)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(19),
          ),
          border: Border.all(color: const Color(0xFF101010)),
          color: isActive ? const Color(0xFF101010) : const Color(0xFFFFFFFF),
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          child: Text(
            data.category,
            style: TextStyle(
              color: isActive ? const Color(0xFFFFFFFF) : const Color(0xFF101010),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  // user interact the item of special offers.
  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
