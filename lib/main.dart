import 'package:flutter/material.dart';
import 'package:route_task/core/config/app_theme_manager.dart';
import 'package:route_task/features/products_screen/pages/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Route Task',
      debugShowCheckedModeBanner: false,
      theme: AppThemeManager.appTheme,
      // using "home" because it's only one screen
      home: const ProductsScreen(),
    );
  }
}
