import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/auth/password_reset.dart';
import 'package:pet_hub/utils/colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          // Header Section
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width,
            height: 110,
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: 70,
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20.0,
                        right: 35,
                      ),
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                          ).fontFamily,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          // Settings Options
          Expanded(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              children: [
                buildSettingsOption(
                  context,
                  icon: Icons.lock_reset,
                  title: "Reset Password",
                  onTap: () {
                    Get.to(() => const ResetPasswordScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper Method to Create a Settings Option
  Widget buildSettingsOption(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Card(
      elevation: 0.3,
      color: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        leading: Icon(
          icon,
          color: orange,
          size: 28,
        ),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: orange,
        ),
        onTap: onTap,
      ),
    );
  }
}
