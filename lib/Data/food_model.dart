
class category{
  final categoryname;
  final List<foodModel> items;
  category({required this.categoryname, required this.items});
}
class foodModel{
  final int id;
  final String name;
  final String imagePath;
  final String image;
  final String category;
  final String Description;
  final double price;
  final bool isFavorit;
  final double oldPrice;
    int quantity=0;
    int count=0;

  foodModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.image,
    required this.category,
    required this.Description,
    required this.price,
    required this.isFavorit,
    required this.oldPrice,
    required this.quantity,
    required this.count
});
}