import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizzling/module/restaurant.dart';

class MyReceipt extends StatelessWidget{
  const MyReceipt ({super.key});

  get padding => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Thank you for your order!."),
          const SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
              border:
                Border.all(color: Theme.of(context).colorScheme.secondary),
              borderRadius: BorderRadius.circular(8),
            ),
              padding: const EdgeInsets.all(25),
              child: Consumer<Restaurant>(
                builder: (context, restaurant, child) => 
                Text(restaurant.displayCartReceipt()),

              ),

          ),
          const SizedBox(height: 25),
          const Text("Estimated delivery time is: 4:10 PM"),
        ],
      ),
    ),
    );
  }
}