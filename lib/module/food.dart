class Food {

  final String name;   // veg burger
  final String description;  // a burger of full of veg
  final String imagePath;  // image of burger
  final double price;     // price of burger is 4.99
  final FoodCategory category;    // burger
  List<Addon> availableAddons;     //[ chess, sauce]


  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// food categories

enum FoodCategory{
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

//food addons

class Addon{
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
});
}