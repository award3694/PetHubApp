import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pet_hub/auth/login_screen.dart';
import 'package:pet_hub/utils/colors.dart';
import 'package:pet_hub/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

import '../provider/reg_provider.dart';

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _selectedNotification = 'Email';
  bool _isPasswordVisible = false; // Track password visibility

  void _signUp(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final userProvider = Provider.of<RegProvider>(context, listen: false);

      final userData = {
        'fullName': _fullNameController.text.trim(),
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim(),
        'phone': _phoneController.text.trim(),
        'address': _addressController.text.trim(),
        'notificationPreference': _selectedNotification,
      };

      final isSuccess = await userProvider.registerUser(userData);

      if (isSuccess) {
        Get.offAll(() => const HomeBottomNavBar());
      } else {
        Get.snackbar(
          'Registration Failed',
          userProvider.message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<RegProvider>().isLoading;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 1.16,
                child: Stack(
                  children: [
                    Container(
                      height: 420,
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
                            'Sign Up',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black87,
                              fontFamily:
                                  GoogleFonts.inter(fontWeight: FontWeight.w700)
                                      .fontFamily,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                  fontFamily: GoogleFonts.inter().fontFamily,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.off(
                                    () => const LoginScreen(),
                                  );
                                },
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: black,
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: 350,
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
                                TextFormField(
                                  controller: _fullNameController,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Full Name is required'
                                          : null,
                                  decoration: InputDecoration(
                                    labelText: 'Full Name',
                                    labelStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _emailController,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Email Address is required'
                                          : null,
                                  decoration: InputDecoration(
                                    labelText: 'Email Address',
                                    labelStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  obscureText: !_isPasswordVisible,
                                  controller: _passwordController,
                                  validator: (value) => value == null ||
                                          value.length < 6
                                      ? 'Password must be at least 6 characters'
                                      : null,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black26,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
                                        });
                                      },
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                IntlPhoneField(
                                  validator: (value) => value == null ||
                                          value.completeNumber.isEmpty
                                      ? 'Phone Number is required'
                                      : null,
                                  controller: _phoneController,
                                  decoration: InputDecoration(
                                    counterText: "",
                                    labelText: 'Phone Number',
                                    labelStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(),
                                    ),
                                  ),
                                  initialCountryCode:
                                      'US', // Default country code
                                  onChanged: (phone) {},
                                  dropdownIcon: const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.black38,
                                  ),
                                  dropdownIconPosition: IconPosition.trailing,
                                  flagsButtonMargin: const EdgeInsets.all(8),
                                  dropdownDecoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.black38,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  flagsButtonPadding:
                                      const EdgeInsets.only(left: 5),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      'Upload Profile Image',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Upload',
                                        style: TextStyle(
                                          color: orange,
                                          decoration: TextDecoration.underline,
                                          decorationColor: orange,
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: _addressController,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Address is required'
                                          : null,
                                  decoration: InputDecoration(
                                    labelText: 'Address',
                                    labelStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Notification Preference',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                      ).fontFamily,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Radio<String>(
                                          activeColor: orange,
                                          value: 'Email',
                                          groupValue: _selectedNotification,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedNotification = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Email',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: GoogleFonts.montserrat()
                                                .fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize
                                          .min, // Keeps row as compact as possible
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Radio<String>(
                                          activeColor: orange,
                                          value: 'SMS',
                                          groupValue: _selectedNotification,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedNotification = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'SMS',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: GoogleFonts.montserrat()
                                                .fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize
                                          .min, // Keeps row as compact as possible
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Radio<String>(
                                          activeColor: orange,
                                          value: 'Push Notifications',
                                          groupValue: _selectedNotification,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                _selectedNotification = value!;
                                              },
                                            );
                                          },
                                        ),
                                        Text(
                                          'Push Notifications',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: GoogleFonts.montserrat()
                                                .fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),
                                // Sign up Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: isLoading
                                        ? null
                                        : () => _signUp(context),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: isLoading
                                        ? const CircularProgressIndicator(
                                            color: Colors.white)
                                        : Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: white,
                                              fontFamily: GoogleFonts.inter()
                                                  .fontFamily,
                                            ),
                                          ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
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
      ),
    );
  }
}
