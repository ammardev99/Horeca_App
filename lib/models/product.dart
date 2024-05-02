class Product {
  final int id;
  final String image;
  final String title;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });
}

List<Product> productList = [
  Product(
      id: 1,
      image: 'assets/png/products/product1.png',
      title: "Product title 1",
      description: 'Product description est Neque est qui ipsum new ',
      price: 123.5),
  Product(
      id: 2,
      image: 'assets/png/products/product2.png',
      title: "Product title 2",
      description: 'Product description est Neque est qui ipsum new',
      price: 250),
  Product(
      id: 3,
      image: 'assets/png/products/product3.png',
      title: "Product title 3",
      description: 'Product description est Neque est qui ipsum new',
      price: 10.5),
  Product(
      id: 4,
      image: 'assets/png/products/product4.png',
      title: "Product title 4",
      description: 'Product description est Neque est qui ipsum new',
      price: 0.10),
  Product(
      id: 5,
      image: 'assets/png/products/product5.png',
      title: "Product title 5",
      description: 'Product description est Neque est qui ipsum new',
      price: 500),
  Product(
      id: 6,
      image: 'assets/png/products/product6.png',
      title: "Product title 6",
      description: 'Product description est Neque est qui ipsum new',
      price: 850.10),
  Product(
      id: 7,
      image: 'assets/png/products/product7.png',
      title: "Product title 7",
      description: 'Product description est Neque est qui ipsum new',
      price: 130.50),
  Product(
      id: 8,
      image: 'assets/png/products/product1.png',
      title: "Product title 8",
      description: 'Product description est Neque est qui ipsum new ',
      price: 123.5),
  Product(
      id: 9,
      image: 'assets/png/products/product2.png',
      title: "Product title 9",
      description: 'Product description est Neque est qui ipsum new',
      price: 250),
  Product(
      id: 10,
      image: 'assets/png/products/product3.png',
      title: "Product title 10",
      description: 'Product description est Neque est qui ipsum new',
      price: 10.5),
  Product(
      id: 11,
      image: 'assets/png/products/product4.png',
      title: "Product title 11",
      description: 'Product description est Neque est qui ipsum new',
      price: 0.10),
  Product(
      id: 12,
      image: 'assets/png/products/product5.png',
      title: "Product title 12",
      description: 'Product description est Neque est qui ipsum new',
      price: 500),
  Product(
      id: 13,
      image: 'assets/png/products/product6.png',
      title: "Product title 13",
      description: 'Product description est Neque est qui ipsum new',
      price: 850.10),
  Product(
      id: 14,
      image: 'assets/png/products/product7.png',
      title: "Product title 14",
      description: 'Product description est Neque est qui ipsum new',
      price: 130.50),
  Product(
      id: 15,
      image: 'assets/png/products/product1.png',
      title: "Product title 15",
      description: 'Product description est Neque est qui ipsum new',
      price: 50),
];





List<Product>cart = [

];

addItemToCart(int index){
  cart.add(productList[index]);
}

removeItemToCart(int index){
  cart.removeAt(index);
}