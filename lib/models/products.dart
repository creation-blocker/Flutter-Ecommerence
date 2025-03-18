class Product {
  final String name;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  const Product({
    required this.name,
    required this.category,
    required this.price,
    required this.oldPrice,
    required this.imageUrl,
    this.isFavorite = false,
    required this.description,
  });
}

final List<Product> products = [
  const Product(
    name: 'Nike',
    category: 'Footware',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe3.png',
    description:
        'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.',
  ),
  const Product(
    name: 'Adidas',
    category: 'Footware',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe1.png',
    description:
        'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.',
  ),
  const Product(
    name: 'Puma',
    category: 'Footware',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe3.png',
    description:
        'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.',
  ),
  const Product(
    name: 'Jajaco',
    category: 'Footware',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe4.png',
    description:
        'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.',
  ),
  const Product(
    name: 'Jordan Shoe',
    category: 'Footware',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe5.jpg',
    isFavorite: true,
    description:
        'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.',
  ),
  const Product(
    name: 'Nike',
    category: 'Footware',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe6.png',
    description:
        'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.',
  ),
  const Product(
    name: 'Adidas',
    category: 'Footware',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe4.png',
    isFavorite: true,
    description:
        'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.',
  ),
  const Product(
    name: 'Puma Chinese Jordan Shoe',
    category: 'Footware',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe1.png',
    isFavorite: true,
    description:
        'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty spaces in a layout that does not yet have content.',
  ),
];
