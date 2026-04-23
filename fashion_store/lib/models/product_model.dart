class Product {
  final String id; 
  final String name;
  final String price;
  final String image;
  final String code;
  final List<String> sizes;

  Product({
    required this.id, 
    required this.name,
    required this.price,
    required this.image,
    required this.code,
    required this.sizes,
  });
}