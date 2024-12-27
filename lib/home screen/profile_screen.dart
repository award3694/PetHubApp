import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/auth/login_screen.dart';
import 'package:pet_hub/home%20screen/expense_screen.dart';
import 'package:pet_hub/home%20screen/profile%20screens/all_pet.dart';
import 'package:pet_hub/home%20screen/profile%20screens/faqs.dart';
import 'package:pet_hub/utils/colors.dart';

import 'profile screens/emergrncy_prep.dart';
import 'profile screens/vet_records.dart';
import 'profile screens/health_tracker.dart';
import 'profile screens/setting_screen.dart';
import 'profile screens/your_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<_ProfileOption> profileOptions = [
      const _ProfileOption(
        imgpath: "assets/icons/person.png",
        title: 'Your Profile',
        destination: YourProfile(),
      ),
      const _ProfileOption(
        imgpath: "assets/icons/tracker.png",
        title: 'Health Tracker',
        destination: HealthTrackerPage(),
      ),
      const _ProfileOption(
        imgpath: "assets/icons/expense manager.png",
        title: 'Expense Manager',
        destination: ExpenseScreen(),
      ),
      _ProfileOption(
        imgpath: "assets/icons/dog.png",
        title: 'All Pet',
        destination: AllPet(),
      ),
      const _ProfileOption(
        imgpath: "assets/icons/emergency.png",
        title: 'Emergency Preparedness',
        destination: EmergrncyPrep(),
      ),
      const _ProfileOption(
        imgpath: "assets/icons/faq.png",
        title: 'Faq',
        destination: Faqs(),
      ),
      _ProfileOption(
        imgpath: "assets/icons/vet_records.png", // Replace with your vet records icon path
        title: 'Vet Records',
        destination: VetRecordsScreen(),
      ),
      const _ProfileOption(
        imgpath: "assets/icons/setting.png",
        title: 'Settings',
        destination: SettingScreen(),
      ),
      const _ProfileOption(
        imgpath: "assets/icons/logout.png",
        title: 'Logout',
        destination: LoginScreen(),
      ),
    ];

    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  // offset: Offset(5, 5),
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: 110,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "My Profile",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                    ).fontFamily,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Profile Image with Edit Icon
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: aquaGreen,
              ),
              color: aquaGreen,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                'assets/icons/tom.png', // Replace with your asset
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Profile Name
          Text(
            "Tom's Pet Foods",
            style: TextStyle(
              fontSize: 20,
              fontFamily: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
              ).fontFamily,
            ),
          ),

          const SizedBox(height: 30),

          // Profile Options List with Dividers
          Expanded(
            child: ListView.separated(
              itemCount: profileOptions.length,
              itemBuilder: (context, index) => profileOptions[index],
              separatorBuilder: (context, index) => const Divider(
                color: Colors.black12,
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

// Profile Option Widget
class _ProfileOption extends StatelessWidget {
  final String imgpath;
  final String title;
  final Widget? destination;

  const _ProfileOption({
    required this.imgpath,
    required this.title,
    this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        imgpath,
        height: 23,
        width: 23,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontFamily: GoogleFonts.montserrat().fontFamily,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.black87,
      ),
      onTap: () {
        if (title == 'Logout') {
          // Clear all routes and navigate to the login screen
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (route) => false, // This removes all the previous routes
          );
        } else {
          // Navigate normally to the destination
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => destination!,
            ),
          );
        }
      },
    );
  }
}
