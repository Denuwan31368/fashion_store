import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import '../models/product_model.dart';
import '../models/wishlist_model.dart'; 
import 'product_details_screen.dart';
import 'wishlist_screen.dart';
import 'cart_screen.dart'; 
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Product> products = [
    Product(
      id: "1", 
      name: 'Detailed High Waist Pant', 
      price: 'Rs. 1,690.00', 
      image: 'assets/images/home_screen/wp1.jpg', 
      code: '12343', 
      sizes: ["20", "32", "42", "52"]),

    Product(
      id: "2", 
      name: 'Sleeveless Embroidered Top', 
      price: 'Rs. 1,295.00', 
      image: 'assets/images/home_screen/wp2.jpg', 
      code: '12344', 
      sizes: ["S", "M", "L", "XL"]),

    Product(
      id: "3", 
      name: 'Noir Lace Knit Top', 
      price: 'Rs. 2,395.00', 
      image: 'assets/images/home_screen/wpe3.jpg', 
      code: '12345', 
      sizes: ["S", "M", "L"]),

    Product(
      id: "4", 
      name: 'Nova Dark Denim Jacket', 
      price: 'Rs. 2,490.00', 
      image: 'assets/images/home_screen/wp4.jpg', 
      code: '12346', 
      sizes: ["S", "M", "L", "XL"]),

    Product(
      id: "5", 
      name: 'Crew Neck T Shirt', 
      price: 'Rs. 1,995.00', 
      image: 'assets/images/home_screen/wm5.jpg', 
      code: '12347', 
      sizes: ["M", "L", "XL"]),

    Product(
      id: "6", 
      name: 'Sleeve Printed Shirt', 
      price: 'Rs. 3,795.00', 
      image: 'assets/images/home_screen/wm6.jpg', 
      code: '12348', 
      sizes: ["S", "M", "L"]),

    Product(
      id: "7", 
      name: 'Printed Polo T Shirt', 
      price: 'Rs. 2,395.00', 
      image: 'assets/images/home_screen/wm7.jpg', 
      code: '12349', 
      sizes: ["S", "M", "L", "XL"]),

    Product(
      id: "8", 
      name: 'Textured Polo T Shirt', 
      price: 'Rs. 2,695.00', 
      image: 'assets/images/home_screen/wm8.jpg', 
      code: '12350', 
      sizes: ["S", "M", "L"]),

    Product(
      id: "9", 
      name: 'Teen Chelsa Collar Top', 
      price: 'Rs. 1,490.00', 
      image: 'assets/images/home_screen/wp9.jpg', 
      code: '12351', 
      sizes: ["S", "M", "L"]),

    Product(
      id: "10", 
      name: 'Noir Lace Knit Top', 
      price: 'Rs. 1,570.00', 
      image: 'assets/images/home_screen/wp10.jpg', 
      code: '12351', 
      sizes: ["S", "M", "L"]),

    Product(
      id: "11", 
      name: 'Neck Long Sleeve T Shirt', 
      price: 'Rs.1,595.00', 
      image: 'assets/images/home_screen/wm11.jpg', 
      code: '12351', 
      sizes: ["S", "M", "L"]),

    Product(
      id: "12", 
      name: 'Printed Short Sleeve Shirt',
      price: 'Rs. 2,295.00', 
      image: 'assets/images/home_screen/wm12.jpg', 
      code: '12351', 
      sizes: ["S", "M", "L"]),
  ];

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFFF8F9FA);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.notes_rounded,
              color: Colors.black, size: 28),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: const Text(
          "URBANVIBE",
          style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.w900, 
            letterSpacing: 5, 
            fontSize: 20
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded, 
            color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildMenuDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageBanner(),
            
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 25, 20, 15),
              child: Center(
                child: Text(
                  "Shop by Category",
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold, 
                    letterSpacing: 0.5),
                ),
              ),
            ),
            
            _buildCategoryList(context),

            const Padding(
              padding: EdgeInsets.fromLTRB(20, 35, 20, 15),
              child: Center(
                child: Text(
                  "New Arrivals", 
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold, 
                    letterSpacing: 0.5)
                ),
              ),
            ),

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
                itemBuilder: (context, index) => _buildProductCard(context, products[index]),
              ),
            ),
            
            const SizedBox(height: 30),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "View More Items →",
                  style: TextStyle(
                    color: Colors.black, 
                    fontWeight: FontWeight.w700, 
                    fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        currentIndex: 0, 
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) return;
          
          Widget target;
          if (index == 1) target = const WishlistScreen();
          else if (index == 2) target = const ProfileScreen();
          else target = const CartScreen();

          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (context, anim1, anim2) => target,
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
            (route) => false,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), 
            label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border), 
            label: "Wishlist"),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), 
            label: "Profile"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), 
            label: "Cart"),
        ],
      ),
    );
  }

  Widget _buildImageBanner() {
    return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/banner.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Style that defines you", 
                      style: TextStyle(
                        color: Colors.white70, 
                        fontSize: 13, 
                        fontStyle: FontStyle.italic,
                      )),
                  const Text("UrbanVibe", 
                      style: TextStyle(
                        fontSize: 26, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.white,
                      )),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    onPressed: () {},
                    child: const Text(
                      "Welcome deal 10% off", 
                      style: TextStyle(
                        fontSize: 12, 
                        fontWeight: FontWeight.bold)
                        ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    final List<Map<String, String>> catData = [
      {'name': 'Womens', 'img': 'assets/images/category_images/wc.png'},
      {'name': 'Mens', 'img': 'assets/images/category_images/mc.png'},
      {'name': 'Kids', 'img': 'assets/images/category_images/kc.png'},
      {'name': 'Teen', 'img': 'assets/images/category_images/bc.png'},
      {'name': 'Ladies Shoes', 'img': 'assets/images/category_images/sc.png'},
    ];

    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: catData.map((category) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  if (category['name'] == 'Womens') Navigator.pushNamed(context, '/womens');
                  else if (category['name'] == 'Mens') Navigator.pushNamed(context, '/mens');
                  else if (category['name'] == 'Kids') Navigator.pushNamed(context, '/kids');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(category['img']!),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category['name']!, 
                        style: const TextStyle(
                          fontSize: 11, 
                          fontWeight: FontWeight.w600, 
                          color: Colors.black)
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return Consumer<WishlistModel>(
      builder: (context, wishlist, child) {
        bool isFav = wishlist.isFavorite(product);
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product)),
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
                          fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () => wishlist.toggleWishlist(product),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.white, 
                            shape: BoxShape.circle),
                          child: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border, 
                            color: isFav ? Colors.red : Colors.black, 
                            size: 18
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(product.name, 
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 14), 
                  maxLines: 1, 
                  overflow: TextOverflow.ellipsis),

              const SizedBox(height: 4),
              Text(product.price, 
                  style: TextStyle(
                    color: Colors.grey[600], 
                    fontWeight: FontWeight.w600, 
                    fontSize: 13)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("URBANVIBE", 
                      style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.w900, 
                        letterSpacing: 5)
                        ),
                  SizedBox(height: 5),
                  Text("PREMIUM FASHION HUB", 
                  style: TextStyle(
                    fontSize: 10, 
                    color: Colors.grey)),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined), 
              title: const Text("Home"),
              onTap: () => Navigator.pop(context)),
          const Spacer(),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout_rounded, 
              color: Colors.redAccent),
            title: const Text(
              "Logout", 
              style: TextStyle(
                color: Colors.redAccent, 
                fontWeight: FontWeight.bold)),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}