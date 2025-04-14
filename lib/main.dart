import 'package:flutter/material.dart';
import 'package:foodpanda_ui_project/Provider/cart_provider.dart';
import 'package:foodpanda_ui_project/Screen/cart_screen.dart';
import 'package:foodpanda_ui_project/Screen/details_screen.dart';
import 'package:foodpanda_ui_project/Screen/home_screen.dart';
import 'package:foodpanda_ui_project/Screen/splash_screen.dart';
import 'package:foodpanda_ui_project/Widgets/category_product.dart';
import 'package:foodpanda_ui_project/Widgets/custom_ratingbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => CartProvider(),
    child: MyApp(),
  )

  );CartScreen();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: SplashScreen()
    );
  }
}



