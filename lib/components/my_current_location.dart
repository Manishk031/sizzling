import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) =>AlertDialog(
          title: const Text("Your Location"),
          content: const TextField(
            decoration: InputDecoration(hintText: "Search address.."),
          ),
          actions: [

            // cancel button
            MaterialButton(onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
            ),

            //save Button
            MaterialButton(onPressed: () => Navigator.pop(context),
            child: const Text('Save'),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery now",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
            
                //Address
                Text("6901 Hollywood Biy",
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  ),
                ),
            
                //Drop down menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}