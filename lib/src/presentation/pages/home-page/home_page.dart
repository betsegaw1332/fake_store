import 'package:fake_store/src/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Center(child: HomeTabBody()),
    Center(child: WishlistTabBody()),
    Center(child: CartTabBody()),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      context.read<CartBloc>().add(GetCartItemsEvent());
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),

      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 0,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey[400],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home_copy),
              activeIcon: Icon(Iconsax.home_copy),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart_copy),
              activeIcon: Icon(Iconsax.heart_copy),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_bag_copy),
              activeIcon: Icon(Iconsax.shopping_bag_copy),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
