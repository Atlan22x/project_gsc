enum Category {
  all,
  hukum,
  home,
}

class Product {
  const Product({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.desc,
    required this.imageName,
  });

  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final String desc;
  final String imageName;

  String get assetName => 'assets/$imageName.png';

  @override
  String toString() => "$name (id=$id)";
}