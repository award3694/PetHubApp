import 'package:flutter/material.dart';
import 'package:pet_hub/home%20screen/pet_reg_form.dart';
import 'package:pet_hub/utils/colors.dart';

import '../home screen/expense_screen.dart';
import '../home screen/forum_screen.dart';
import '../home screen/home_screen.dart';
import '../home screen/profile_screen.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _selectedIndex = 0;

  // List of icons for normal and filled states
  final List<Map<String, String>> _iconPaths = [
    {
      'normal': 'assets/icons/home.png',
      'filled': 'assets/icons/Home (filled).png',
      'label': 'Home',
    },
    {
      'normal': 'assets/icons/expense.png',
      'filled': 'assets/icons/expense.png',
      'label': 'Expense',
    },
    {
      'normal': 'assets/icons/forum.png',
      'filled': 'assets/icons/forum(filled).png',
      'label': 'Forum',
    },
    {
      'normal': 'assets/icons/profile.png',
      'filled': 'assets/icons/profile.png',
      'label': 'Profile',
    },
  ];

  // List of screens to display for each tab
  final List<Widget> _screens = [
    HomeScreen(),
    const ExpenseScreen(),
    ForumScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: _screens[_selectedIndex], // Display the current screen
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PetRegForm()),
          );
        },
        backgroundColor: orange,
        child: const Icon(
          Icons.add,
          color: white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
          color: orange,
          notchMargin: 8.0,
          height: 85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int index = 0; index < _iconPaths.length; index++)
                if (index == 2) ...[
                  const SizedBox(
                      width: 48), // Space for the floating action button
                  _buildNavItem(index),
                ] else
                  _buildNavItem(index),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each navigation item
  Widget _buildNavItem(int index) {
    final isSelected = _selectedIndex == index;

    return IconButton(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isSelected
                ? _iconPaths[index]['filled']!
                : _iconPaths[index]['normal']!,
            color: white,
            width: 24,
          ),
          Text(
            _iconPaths[index]['label']!,
            style: const TextStyle(
              color: white,
              fontSize: 12,
            ),
          ),
        ],
      ),
      onPressed: () => _onItemTapped(index),
    );
  }
}
