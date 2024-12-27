import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/auth/reg_screen.dart';
import 'package:pet_hub/utils/colors.dart';
import 'package:pet_hub/widgets/bottom_bar.dart';
import 'package:provider/provider.dart';

import '../provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false; // Track password visibility
  bool _isRememberMeChecked = false; // Track checkbox state

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      final success = await loginProvider.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (success) {
        Get.offAll(() => const HomeBottomNavBar());
      } else {
        Get.snackbar(
          'Login Failed',
          loginProvider.message,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<LoginProvider>().isLoading;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.9,
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
                            'Sign in to your\nAccount',
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
                          const SizedBox(height: 10),
                          Text(
                            'Enter your email and password to log in',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              fontFamily: GoogleFonts.inter().fontFamily,
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
                                TextFormField(
                                  controller: _emailController,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Email is required'
                                          : null,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  controller: _passwordController,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Password is required'
                                          : null,
                                  obscureText: !_isPasswordVisible,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
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
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _isRememberMeChecked,
                                          activeColor: orange,
                                          onChanged: (value) {
                                            setState(() {
                                              _isRememberMeChecked = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Remember me',
                                          style: TextStyle(
                                            fontFamily:
                                                GoogleFonts.inter().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Forgot password action
                                      },
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                          color: orange,
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                // Log In Button
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: isLoading
                                        ? null
                                        : () => _login(context),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: orange,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    child: isLoading
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                        : Text(
                                            'Log In',
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
                                // Sign Up Section
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don’t have an account?",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.inter().fontFamily,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.to(() => const RegScreen());
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: orange,
                                          fontFamily:
                                              GoogleFonts.inter().fontFamily,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
