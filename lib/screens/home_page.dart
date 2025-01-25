import 'package:flutter/material.dart';
import 'package:sneaker_store/screens/cart_page.dart';
import 'package:sneaker_store/screens/landing_page.dart';
import 'package:sneaker_store/screens/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Sneaker Store',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: Center(
                child: Image.asset('assets/images/nike.png', height: 100),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 0;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text(
                'About',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.white),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LandingPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Shop'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded), label: 'Cart'),
        ],
      ),
    );
  }
}
