import 'package:flutter/material.dart';
import 'package:sizzling/components/my_drawer.dart';
import 'package:sizzling/components/my_silver_app_bar.dart';  // Ensure this import path is correct

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                ),
                 // current location

                // description box
              ],
            ),
            title: Text("title"),
          ),
        ],
        body: Container(color: Colors.blue),
      ),
    );
  }
}
