import 'package:scoped_model/scoped_model.dart';

class Product extends Model {
  final String name;
  final String description;
  final int price;
  final String image;
  int rating;

  Product(
    this.name,
    this.description,
    this.price,
    this.image,
    this.rating,
  );

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['name'],
      map['description'],
      map['price'],
      map['image'],
      map['rating'],
    );
  }

  get length => null;

  void updateRating(int myRating) {
    rating = myRating;
    notifyListeners();
  }

  static List<Product> getProducts() {
    List<Product> items = <Product>[];

    items.add(Product(
      "Pixel",
      "Pixel is the most feature-full phone ever",
      800,
      "pixel.jpg",
      0,
    ));
    items.add(Product(
      "Laptop",
      "Laptop is most productive development tool",
      2000,
      "laptop.jpg",
      0,
    ));
    items.add(Product(
      "Tablet",
      "Tablet is the most useful device ever for meeting",
      1500,
      "tablet.jpg",
      0,
    ));
    items.add(Product(
      "Pendrive",
      "Pendrive is useful storage medium",
      100,
      "pendrive.jpg",
      0,
    ));
    items.add(Product(
      "Floppy Drive",
      "Floppy drive is useful rescue storage medium",
      20,
      "floppydisk.jpg",
      0,
    ));
    return items;
  }
}
