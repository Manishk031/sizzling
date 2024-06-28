import 'dart:js_interop';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:sizzling/module/cart_item.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier{
  // list of food menu

  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Classic Burger",
      description: "A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "lib/images/burgers/burger.jpg", // Assuming the image is a .jpg file
      price: 0.45,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.45),
        Addon(name: "Bacon", price: 0.55),
        Addon(name: "Avocado", price: 0.45),
      ],
    ),
    Food(
      name: "Pink Burger",
      description: "A unique blend of flavors with a pink twist, "
          "including a juicy beef patty, melted cheddar, lettuce, tomato, and a hint of onion and pickle.",
      imagePath: "lib/images/burgers/pink_burger.jpeg",
      price: 0.45,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.45),
        Addon(name: "Bacon", price: 0.55),
        Addon(name: "Avocado", price: 0.45),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description: "A delicious and hearty veggie patty with fresh lettuce, tomato, onion, and a hint of pickle, perfect for a vegetarian delight.",
      imagePath: "lib/images/burgers/veggie_burger.jpg",
      price: 0.40,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.45),
        Addon(name: "Avocado", price: 0.45),
        Addon(name: "Grilled mushrooms", price: 0.50),
      ],
    ),
    Food(
      name: "Veggie Cheese Burger",
      description: "A savory veggie patty topped with melted cheddar cheese, fresh lettuce, tomato, onion, and a hint of pickle, offering a cheesy vegetarian treat.",
      imagePath: "lib/images/burgers/veggie_chesse_burger.jpg",
      price: 0.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.45),
        Addon(name: "Avocado", price: 0.45),
        Addon(name: "Grilled mushrooms", price: 0.50),
      ],
    ),

    //salads
    Food(
      name: "Bean Salad",
      description: "A refreshing mix of beans, tomatoes, onions, and bell peppers, tossed in a tangy vinaigrette. Perfect for a healthy and satisfying meal.",
      imagePath: "lib/images/salads/bean_salad.jpeg",
      price: 0.35,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra beans", price: 0.20),
        Addon(name: "Avocado", price: 0.45),
        Addon(name: "Feta cheese", price: 0.50),
      ],
    ),
    Food(
      name: "Fruit Salad",
      description: "A vibrant assortment of fresh seasonal fruits, including berries, melons, and citrus, lightly drizzled with honey and a splash of lime.",
      imagePath: "lib/images/salads/fruit_salad.jpeg",
      price: 0.45,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra berries", price: 0.50),
        Addon(name: "Yogurt", price: 0.30),
        Addon(name: "Nuts", price: 0.40),
      ],
    ),
    Food(
      name: "Green Salad",
      description: "A classic blend of fresh greens, cucumbers, tomatoes, and carrots, served with your choice of dressing. A perfect light and healthy option.",
      imagePath: "lib/images/salads/green_salad.jpeg",
      price: 0.30,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra greens", price: 0.20),
        Addon(name: "Grilled chicken", price: 0.70),
        Addon(name: "Croutons", price: 0.25),
      ],
    ),
    Food(
      name: "Loaded Broccoli Salad",
      description: "A hearty salad featuring broccoli florets, bacon bits, red onions, and shredded cheese, tossed in a creamy dressing for a satisfying crunch.",
      imagePath: "lib/images/salads/loaded_brocccoli_salad.jpeg",
      price: 0.55,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra bacon", price: 0.60),
        Addon(name: "Sunflower seeds", price: 0.30),
        Addon(name: "Raisins", price: 0.25),
      ],
    ),

    // sides
    Food(
      name: "French Fries",
      description: "Crispy and golden French fries, lightly salted and perfect as a snack or a side.",
      imagePath: "lib/images/sides/freanch_fries.jpeg",
      price: 0.25,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese sauce", price: 0.30),
        Addon(name: "Bacon bits", price: 0.50),
        Addon(name: "Garlic seasoning", price: 0.20),
      ],
    ),
    Food(
      name: "Garlic Bread",
      description: "Warm and crusty bread slices topped with a savory garlic butter spread, perfect for accompanying any meal.",
      imagePath: "lib/images/sides/garlic_bread.jpeg",
      price: 0.35,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra garlic butter", price: 0.20),
        Addon(name: "Cheese", price: 0.45),
        Addon(name: "Herbs", price: 0.15),
      ],
    ),
    Food(
      name: "Loaded Garlic Bread",
      description: "Delicious garlic bread loaded with melted cheese, bacon bits, and a sprinkle of herbs, creating a perfect savory treat.",
      imagePath: "lib/images/sides/loaded_garlic_bread.jpeg",
      price: 0.55,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.45),
        Addon(name: "Jalapeños", price: 0.35),
        Addon(name: "Tomato slices", price: 0.25),
      ],
    ),
    Food(
      name: "Mac and Cheese",
      description: "Creamy and cheesy macaroni, baked to perfection with a golden crust, a classic comfort food favorite.",
      imagePath: "lib/images/sides/mac_cheese.jpeg",
      price: 0.50,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.45),
        Addon(name: "Bacon bits", price: 0.50),
        Addon(name: "Bread crumbs", price: 0.25),
      ],
    ),

    //deserts
    Food(
      name: "Brownies",
      description: "Rich and fudge chocolate brownies, a perfect treat for chocolate lovers.",
      imagePath: "lib/images/desserts/bronies.jpeg",
      price: 0.60,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Walnuts", price: 0.30),
        Addon(name: "Extra chocolate chips", price: 0.25),
        Addon(name: "Caramel drizzle", price: 0.20),
      ],
    ),
    Food(
      name: "Cookies",
      description: "Soft and chewy cookies with a delightful crunch, available in various flavors.",
      imagePath: "lib/images/desserts/cookies.jpeg",
      price: 0.40,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra chocolate chips", price: 0.25),
        Addon(name: "Nuts", price: 0.30),
        Addon(name: "Sprinkles", price: 0.15),
      ],
    ),
    Food(
      name: "Donut",
      description: "A classic donut, fluffy and glazed to perfection, available in a variety of flavors.",
      imagePath: "lib/images/desserts/donut.jpeg",
      price: 0.45,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Chocolate glaze", price: 0.20),
        Addon(name: "Sprinkles", price: 0.15),
        Addon(name: "Cream filling", price: 0.30),
      ],
    ),
    Food(
      name: "Muffin",
      description: "A soft and moist muffin, perfect for breakfast or a snack, available in multiple flavors.",
      imagePath: "lib/images/desserts/muffin.jpeg",
      price: 0.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Blueberries", price: 0.30),
        Addon(name: "Chocolate chips", price: 0.25),
        Addon(name: "Nuts", price: 0.30),
      ],
    ),


    //drinks
    Food(
      name: "Coca Cola",
      description: "A refreshing and classic carbonated soft drink, perfect for any meal.",
      imagePath: "lib/images/drinks/coca_cola.jpeg",
      price: 0.20,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Lemon slice", price: 0.10),
        Addon(name: "Ice cubes", price: 0.05),
      ],
    ),
    Food(
      name: "Cold Coffee",
      description: "A chilled coffee drink, smooth and refreshing, perfect for a hot day.",
      imagePath: "lib/images/drinks/cold_coffie.jpeg",
      price: 0.30,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Whipped cream", price: 0.20),
        Addon(name: "Chocolate syrup", price: 0.15),
      ],
    ),
    Food(
      name: "Hot Coffee",
      description: "A rich and aromatic hot coffee, brewed to perfection, ideal for a warm start to your day.",
      imagePath: "lib/images/drinks/hot_coffie.jpeg",
      price: 0.25,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra shot of espresso", price: 0.30),
        Addon(name: "Whipped cream", price: 0.20),
      ],
    ),
    Food(
      name: "Lemon Drink",
      description: "A zesty and refreshing lemon drink, perfect for quenching your thirst on a sunny day.",
      imagePath: "lib/images/drinks/lemon_drink.jpeg",
      price: 0.25,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Mint leaves", price: 0.10),
        Addon(name: "Ice cubes", price: 0.05),
      ],
    ),

  ];
  /*

  G E T T E R S

   */

     List<Food> get menu => _menu;
     List<CartItem> get cart => _cart;
     /*

     O P E R A T I O N S
      */

// use  cart

final List<CartItem> _cart = [];
     // add the cart

void  addToCart(Food food, List<Addon> selectedAddons){


  // see if there is a cart item already with the same food and selected addons

  CartItem? cartItem = _cart.firstWhereOrNull((item) {
    bool isSameFood = item.food == food;

    //check if the list of selected addons are the same

    bool isSameAddons =
        ListEquality().equals(item.selectedAddons, selectedAddons);
    return isSameFood && isSameAddons;
  });

  // if item already exists , increase it's quantity

  if(cartItem!= null){
    cartItem.quantity++;
  }

  // otherwise , add a new cart item to the cart

  else{
    _cart.add(
      CartItem(food: food, selectedAddons: selectedAddons),
    );
  }
  notifyListeners();
}

     // remove from cart
        void removeFromCart(CartItem cartItem){
         int cartIndex = _cart.indexOf(cartItem);

   if(cartIndex != -1){
     if(_cart[cartIndex].quantity > 1) {
       _cart[cartIndex].quantity--;
     }else {
       _cart.removeAt(cartIndex);
     }
     }
   notifyListeners();
        }



     //get total price of cart

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total; // Make sure to return the total
  }


//get total  number of item in cart

 int getTotalItemCount(){
  int totalItemCount =0;

  for (CartItem cartItem in _cart){
    totalItemCount += cartItem.quantity;
  }
  return totalItemCount;
 }
     //clear cart
void clearCart(){
  _cart.clear();
  notifyListeners();
}

    /*

       H E L P E R S

    */

     //general  a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.write("Here's your receipt.");
    receipt.writeln();


    //format the date to include up to  seconds only
    String formattedDate =
    DateFormat('yyyy-MM-dd HH-mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(
              cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("--------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }
     // format double value  into money
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }

//format list of addons into a string  summary
   String _formatAddons(List<Addon> addons){
     return addons
         .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
         .join(", ");
   }

}