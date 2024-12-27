import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                        "Reset Password",
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
          const SizedBox(
            height: 20,
          ),
          buildPasswordField("Old Password", oldPasswordController),
          const SizedBox(height: 20),
          buildPasswordField("New Password", newPasswordController),
          const SizedBox(height: 20),
          buildPasswordField("Confirm New Password", confirmPasswordController),
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: orange,
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              ),
              onPressed: () {
                // Handle the save logic
                // String oldPassword = oldPasswordController.text;
                String newPassword = newPasswordController.text;
                String confirmPassword = confirmPasswordController.text;

                if (newPassword != confirmPassword) {
                  Get.snackbar(
                    "Error",
                    "New passwords do not match.",
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.redAccent,
                    colorText: white,
                  );
                } else {
                  // Implement your password reset logic here
                  Get.snackbar(
                    "Success",
                    "Password reset successfully.",
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.green,
                    colorText: white,
                  );
                  Get.back();
                }
              },
              child: Text(
                "Save",
                style: GoogleFonts.montserrat(
                  color: white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPasswordField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.montserrat(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: darkBrwon),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
