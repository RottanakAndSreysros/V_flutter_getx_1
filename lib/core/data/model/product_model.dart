import 'package:get/get.dart';

class ProductModel extends GetxController {
  final int id;
  final String name;
  final double price;
  final int quantity;
  final double totalPrice;
  final double discount;
  final double rate;
  final String image;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.discount,
    required this.rate,
    required this.image,
    required this.description,
  });
}

List<ProductModel> listProduct = [
  ProductModel(
    id: 1,
    name: "Around the world, one plate at a time",
    price: 12,
    quantity: 0,
    totalPrice: 0.0,
    discount: 15,
    rate: 3.4,
    image: "asset/image/Around the world, one plate at a time.jpg",
    description: "Hello world! This is our product for sale and it is great!",
  ),
  ProductModel(
    id: 2,
    name: "Nasi lemak, Malaysia",
    price: 13,
    quantity: 0,
    totalPrice: 0.0,
    discount: 20,
    rate: 3.5,
    image: "asset/image/Nasi lemak, Malaysia.jpg",
    description: "Hello world! This is our product for sale and it is great!",
  ),
  ProductModel(
    id: 3,
    name: "Peri peri chicken, Mozambique",
    price: 11.5,
    quantity: 0,
    totalPrice: 0.0,
    discount: 50,
    rate: 4.0,
    image: "asset/image/Peri peri chicken, Mozambique.jpg",
    description: "Hello world! This is our product for sale and it is great!",
  ),
  ProductModel(
    id: 4,
    name: "Plov, Uzbekistan",
    price: 15,
    quantity: 0,
    totalPrice: 0.0,
    discount: 35,
    rate: 2.9,
    image: "asset/image/Plov, Uzbekistan.jpg",
    description: "Hello world! This is our product for sale and it is great!",
  ),
  ProductModel(
    id: 5,
    name: "Sauerbraten, Germany",
    price: 17,
    quantity: 0,
    totalPrice: 0.0,
    discount: 40,
    rate: 3.5,
    image: "asset/image/Sauerbraten, Germany.jpg",
    description: "Hello world! This is our product for sale and it is great!",
  ),
];
