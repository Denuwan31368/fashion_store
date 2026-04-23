import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fashion_store/models/product_model.dart';
import 'package:fashion_store/models/wishlist_model.dart';
import 'package:fashion_store/screens/product_details_screen.dart';
import 'package:fashion_store/screens/wishlist_screen.dart';
import 'package:fashion_store/screens/cart_screen.dart';
import 'package:fashion_store/screens/profile_screen.dart';

class KidsScreen extends StatelessWidget {
  KidsScreen({super.key});

  final List<Product> products = [
    Product(
      id: "k1",
      name: 'Boys Comfy Short',
      price: 'Rs. 890.00',
      image: 'assets/images/kid_list/kl1.jpg',
      code: 'K101',
      sizes: ["S", "M"],
    ),
    Product(
      id: "k2",
      name: 'TienNeck Printed Halter Top',
      price: 'Rs. 990.00',
      image: 'assets/images/kid_list/kl2.jpg',
      code: 'K102',
      sizes: ["S", "M"],
    ),
    Product(
      id: "k3",
      name: 'Winx Club Printed T Shirt Dress',
      price: 'Rs. 990.00',
      image: 'assets/images/kid_list/kl3.jpg',
      code: 'K103',
      sizes: ["S"],
    ),
    Product(
      id: "k4",
      name: 'Smock & Cuddle 2pcs Set',
      price: 'Rs. 1,290.00',
      image: 'assets/images/kid_list/kle4.jpg',
      code: 'K104',
      sizes: ["S"],
    ),
    Product(
      id: "k5",
      name: 'T Tots Girls Mini Skirt',
      price: 'Rs. 495.00',
      image: 'assets/images/kid_list/kl5.jpg',
      code: 'K104',
      sizes: ["S"],
    ),
    Product(
      id: "k6",
      name: 'Boys Comfy Short',
      price: 'Rs. 890.00',
      image: 'assets/images/kid_list/kl6.jpg',
      code: 'K104',
      sizes: ["S"],
    ),
    Product(
      id: "k7",
      name: 'Bloomer Romper 2pcs Set',
      price: 'Rs. 1,190.00',
      image: 'assets/images/kid_list/kl7.jpg',
      code: 'K104',
      sizes: ["S"],
    ),
    Product(
      id: "k8",
      name: 'Stitch Girl T Shirt',
      price: 'Rs. 760.00',
      image: 'assets/images/kid_list/kl8.jpg',
      code: 'K104',
      sizes: ["S"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildCustomAppBar(context, "KIDS"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                ),
                itemBuilder: (context, index) =>
                    _buildProductCard(context, products[index]),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return Consumer<WishlistModel>(
      builder: (context, wishlist, child) {
        bool isFav = wishlist.isFavorite(product);

        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductDetailsScreen(product: product),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(product.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () =>
                            wishlist.toggleWishlist(product),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isFav
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFav
                                ? Colors.red
                                : Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 4),

              Text(
                product.price,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildCustomAppBar(
    BuildContext context,
    String title,
  ) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 22,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          letterSpacing: 5,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black54,
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            (route) => false,
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const WishlistScreen(),
            ),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const ProfileScreen(),
            ),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const CartScreen(),
            ),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Wishlist",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "Profile",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: "Cart",
        ),
      ],
    );
  }
}