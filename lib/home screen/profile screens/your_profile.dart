// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/colors.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  File? _profileImage;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  // Mock data for user details
  @override
  void initState() {
    super.initState();
    _emailController.text = "example@domain.com"; // Pre-filled email
    _phoneController.text = "+1234567890"; // Pre-filled phone number
    _addressController.text =
        "123 Pet Street, City, Country"; // Pre-filled address
  }

  // Pick an image from the gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _profileImage = File(pickedImage.path);
      });
    }
  }

  // Save profile data
  void _saveProfile() {
    final String email = _emailController.text;
    final String phone = _phoneController.text;
    final String address = _addressController.text;

    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 1,
              child: Stack(
                children: [
                  Container(
                    height: 500,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          white,
                          Color(0xffF5E6DC),
                          Color(0xffF1C8AF),
                          orange,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/logo_stylish.png',
                          height: 130,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Edit Your\nProfile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                            ).fontFamily,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: aquaGreen,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage: _profileImage != null
                                          ? FileImage(
                                              _profileImage!) // Show selected image
                                          : const AssetImage(
                                                  'assets/icons/tom.png')
                                              as ImageProvider, // Default image
                                      backgroundColor: Colors.grey.shade300,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: _pickImage,
                                      child: Container(
                                        height: 35,
                                        width: 35,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: orange,
                                        ),
                                        child: const Icon(Icons.edit,
                                            color: white, size: 18),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              // Email Field
                              TextField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon:
                                      const Icon(Icons.email, color: orange),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 20),
                              // Phone Field
                              TextField(
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon:
                                      const Icon(Icons.phone, color: orange),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(height: 20),
                              // Address Field
                              TextField(
                                controller: _addressController,
                                decoration: InputDecoration(
                                  labelText: "Address",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: const Icon(Icons.location_on,
                                      color: orange),
                                ),
                                keyboardType: TextInputType.streetAddress,
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: _saveProfile,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  child: Text(
                                    'Save Profile',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Sign Up Section
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    // right: 0,
                    left: 0,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Image
            Image.asset(
              "assets/icons/hand.png",
            ),
          ],
        ),
      ),
    );
  }
}
