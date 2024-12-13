import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

import 'profile screens/health_tracker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<_ProfileOption> profileOptions = [
      _ProfileOption(
        imgpath: "assets/icons/person.png",
        title: 'Your Profile',
      ),
      _ProfileOption(
        imgpath: "assets/icons/tracker.png",
        title: 'Health Tracker',
        destination: HealthTrackerPage(),
      ),
      _ProfileOption(
          imgpath: "assets/icons/expense manager.png",
          title: 'Expense Manager'),
      _ProfileOption(
          imgpath: "assets/icons/AI assistant.png", title: 'AI Pet Assistant'),
      _ProfileOption(
          imgpath: "assets/icons/emergency.png",
          title: 'Emergency Preparedness'),
      _ProfileOption(imgpath: "assets/icons/faq.png", title: 'Faq'),
      _ProfileOption(imgpath: "assets/icons/setting.png", title: 'Settings'),
      _ProfileOption(imgpath: "assets/icons/logout.png", title: 'Logout'),
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
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: aquaGreen,
                    width: 1,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/icons/tom.png', // Replace with your asset
                    fit: BoxFit.cover,
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
          const Text(
            "Tom's Pet Foods",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
