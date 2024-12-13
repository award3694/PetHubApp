import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/home%20screen/blank_screen.dart';
import 'package:pet_hub/home%20screen/expense_screen.dart';
import 'package:pet_hub/home%20screen/profile%20screens/ai_assistant.dart';
import 'package:pet_hub/utils/colors.dart';

import 'profile screens/emergrncy_prep.dart';
import 'profile screens/health_tracker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<_ProfileOption> profileOptions = [
      const _ProfileOption(
        imgpath: "assets/icons/person.png",
        title: 'Your Profile',
        destination: BlankScreen(),
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
        imgpath: "assets/icons/AI assistant.png",
        title: 'AI Pet Assistant',
        destination: AiAssistant(),
      ),
      const _ProfileOption(
        imgpath: "assets/icons/emergency.png",
        title: 'Emergency Preparedness',
        destination: EmergrncyPrep(),
      ),
      const _ProfileOption(
        imgpath: "assets/icons/faq.png",
        title: 'Faq',
        destination: BlankScreen(),
      ),
      const _ProfileOption(
        imgpath: "assets/icons/setting.png",
        title: 'Settings',
        destination: BlankScreen(),
      ),
      const _ProfileOption(
        imgpath: "assets/icons/logout.png",
        title: 'Logout',
        destination: BlankScreen(),
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
          Stack(
            alignment: Alignment.bottomRight,
            children: [
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
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
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
        height: 22,
        width: 22,
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => destination!,
          ),
        );
      },
    );
  }
}
