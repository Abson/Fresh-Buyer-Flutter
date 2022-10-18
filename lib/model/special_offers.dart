class SpecialOffer {
  const SpecialOffer(this.icon, this.title, this.id);

  final String icon;
  final String title;
  final String id;
}

final specialOfferDatas = <SpecialOffer>[
  const SpecialOffer('assets/icons/category_sofa@2x.png', 'Sofa', 'sofa'),
  const SpecialOffer('assets/icons/category_chair@2x.png', 'Chair', 'sofa'),
  const SpecialOffer('assets/icons/category_table@2x.png', 'Table', 'sofa'),
  const SpecialOffer('assets/icons/category_kitchen@2x.png', 'Kitchen', 'sofa'),
  const SpecialOffer('assets/icons/category_lamp@2x.png', 'Lamp', 'sofa'),
  const SpecialOffer('assets/icons/category_cupboard@2x.png', 'Cupboard', 'sofa'),
  const SpecialOffer('assets/icons/category_vase@2x.png', 'Vase', 'sofa'),
  const SpecialOffer('assets/icons/category_others@2x.png', 'Others', 'sofa'),
];
