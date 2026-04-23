import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cart_model.dart';
import 'models/wishlist_model.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/wishlist_screen.dart';
import 'package:fashion_store/screens/product_listing/womens_screen.dart';
import 'package:fashion_store/screens/product_listing/mens_screen.dart';
import 'package:fashion_store/screens/product_listing/kids_screen.dart';
import 'screens/checkout/checkout_screen.dart';
import 'screens/checkout/payment_success_screen.dart';
import 'screens/checkout/card_details_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CartModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistModel(),
        ),
      ],
      child: const UrbanVibeApp(),
    ),
  );
}

class UrbanVibeApp extends StatelessWidget {
  const UrbanVibeApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color backgroundGray = Color(0xFFF8F9FA);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UrbanVibe Fashion',

      theme: ThemeData(
        scaffoldBackgroundColor: backgroundGray,
        primaryColor: Colors.white,
        fontFamily: 'sans-serif',

        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundGray,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            letterSpacing: 5,
            fontSize: 20,
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/wishlist': (context) => WishlistScreen(),
        '/cart': (context) => CartScreen(),

        '/womens': (context) => WomensScreen(),
        '/mens': (context) => MensScreen(),
        '/kids': (context) => KidsScreen(),

        '/checkout': (context) => const CheckoutScreen(),
        '/addCard': (context) => const CardDetailsScreen(),
        '/paymentSuccess': (context) => const PaymentSuccessScreen(),
      },
    );
  }
}