import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/home%20screen/ai_assistant.dart';
import 'package:pet_hub/home%20screen/pet_reg_form.dart';
import 'package:pet_hub/home%20screen/profile%20screens/health_tracker.dart';
import 'package:pet_hub/home%20screen/reminders.dart';
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
      'normal': 'assets/icons/AI assistant.png',
      'filled': 'assets/icons/AI assistant.png',
      'label': 'AI Vet',
    },
    {
      'normal': 'assets/icons/forum.png',
      'filled': 'assets/icons/forum(filled).png',
      'label': 'Forum',
    },
    {
      'normal': 'assets/icons/menu.png',
      'filled': 'assets/icons/menu.png',
      'label': 'Menu',
    },
  ];

  // List of screens to display for each tab
  final List<Widget> _screens = [
    HomeScreen(),
    AiAssistant(),
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
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await _showExitConfirmationDialog(context);
        return shouldExit ?? false; // Return false to prevent default action
      },
      child: Scaffold(
        backgroundColor: white,
        resizeToAvoidBottomInset: false,
        body: _screens[_selectedIndex], // Display the current screen
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => _showCenterButtonOptions(context),
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
            width: 23,
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

  // Function to display bottom sheet with options
  void _showCenterButtonOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.pets, color: orange),
                title: const Text('Register Pet'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PetRegForm(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.account_balance_wallet,
                  color: orange,
                ),
                title: const Text('Add Expense'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExpenseScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.alarm, color: orange),
                title: const Text('Add Reminder'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReminderScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.health_and_safety, color: orange),
                title: const Text('Add Health Data'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HealthTrackerPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool?> _showExitConfirmationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Exit App',
            style: TextStyle(
                fontFamily: GoogleFonts.montserrat(
              fontWeight: FontWeight.w800,
            ).fontFamily),
          ),
          content: Text(
            'Are you sure you want to exit the app?',
            style: TextStyle(
                fontFamily: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
            ).fontFamily),
          ),
          actions: [
            TextButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  orange,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false); // Do not exit
              },
              child: Text(
                'No',
                style: TextStyle(
                  fontFamily: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                  ).fontFamily,
                  color: white,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Exit app
              },
              child: Text(
                'Yes',
                style: TextStyle(
                  fontFamily: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                  ).fontFamily,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
