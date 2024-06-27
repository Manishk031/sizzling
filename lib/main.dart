import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizzling/auth/login_or_register.dart';
import 'package:sizzling/module/restaurant.dart';
import 'package:sizzling/theme_page/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // Theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // Restaurant provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
