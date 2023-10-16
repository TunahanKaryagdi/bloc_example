class Product {
  final int id;
  final String title;
  final String description;

  Product(this.id, this.title, this.description);
}

List<Product> getProducts() {
  return [
    Product(1, "Phone", "Phone description"),
    Product(2, "Charger", "Charger description"),
    Product(3, "Table", "Table description"),
    Product(4, "Chair", "Chair description")
  ];
}
