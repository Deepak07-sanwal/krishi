import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:krishi/features/cropSelling/screens/selling_page.dart';
import 'package:krishi/features/dashboard/screens/home.dart';
import 'package:krishi/features/dashboard/screens/settings.dart';
import 'package:krishi/features/disease_detection/screens/tflite_model.dart';
import 'package:krishi/features/shop/screens/buying.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _SelectedTab { home, favorite, add, search, person }

class Dashboard extends StatefulWidget {
  final String? uid;
  const Dashboard({super.key, this.uid});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Widget> screens = [];
  @override
  void initState() {
    super.initState();
    _saveUid();
    screens = [
      const Home(),
      const BuyingPage(),
      const Placeholder(),
      SellingPage(uid: widget.uid),
      const Settings(),
    ];
  }

  Future<void> _saveUid() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', widget.uid ?? "");
  }

  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    if (i == 2) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const SelectPhoto()));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TfliteModel()));
    } else {
      setState(() {
        _selectedTab = _SelectedTab.values[i];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_SelectedTab.values.indexOf(_selectedTab)],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          height: 10,
          indicatorColor: Colors.blue,
          unselectedItemColor: Colors.white70,
          backgroundColor: Colors.black.withOpacity(0.3),
          onTap: _handleIndexChanged,
          items: [
            /// Home
            CrystalNavigationBarItem(
              icon: Icons.home_filled,
              unselectedIcon: Icons.home,
              selectedColor: Theme.of(context).colorScheme.primary,
            ),

            /// Favourite
            CrystalNavigationBarItem(
              icon: Icons.shopify,
              unselectedIcon: Icons.shopify_sharp,
              selectedColor: Theme.of(context).colorScheme.primary,
            ),

            /// Add
            CrystalNavigationBarItem(
              icon: Icons.add_a_photo,
              unselectedIcon: Icons.add_a_photo_outlined,
              selectedColor: Colors.white,
            ),

            /// Search
            CrystalNavigationBarItem(
                icon: Icons.currency_exchange_outlined,
                unselectedIcon: Icons.currency_exchange,
                selectedColor: Theme.of(context).colorScheme.primary),

            /// Profile
            CrystalNavigationBarItem(
              icon: Icons.settings,
              unselectedIcon: Icons.settings_outlined,
              selectedColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
      extendBody: true,
    );
  }
}
