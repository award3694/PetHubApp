import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';
import 'package:pet_hub/widgets/bottom_bar.dart';

class PetRegForm extends StatefulWidget {
  const PetRegForm({super.key});

  @override
  State<PetRegForm> createState() => _PetRegFormState();
}

class _PetRegFormState extends State<PetRegForm> {
  final TextEditingController _weightController = TextEditingController();
  String _selectedUnit = 'kg'; // Default weight unit

// Track password visibility
  String? _activity;
  String? _dietary;
  String? _selectSpecie;
  String? _sex;
  String? _vaccine;

  final TextEditingController _dobController = TextEditingController();

  Future<void> _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dobController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  void _changeUnit(String unit) {
    setState(() {
      _selectedUnit = unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 2.2,
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
                          'Register A New Pet',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.black87,
                            fontFamily:
                                GoogleFonts.inter(fontWeight: FontWeight.w700)
                                    .fontFamily,
                          ),
                        ),
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
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Pet Name',
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
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
                                  'Species',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                    ).fontFamily,
                                  ),
                                ),
                              ),
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
                                        value: 'Dog',
                                        groupValue: _selectSpecie,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectSpecie = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Dog',
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
                                        value: 'Cat',
                                        groupValue: _selectSpecie,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectSpecie = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Cat',
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
                                        value: 'Bird',
                                        groupValue: _selectSpecie,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _selectSpecie = value;
                                            },
                                          );
                                        },
                                      ),
                                      Text(
                                        'Bird',
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
                                        value: 'Other',
                                        groupValue: _selectSpecie,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _selectSpecie = value;
                                            },
                                          );
                                        },
                                      ),
                                      Text(
                                        'Other',
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
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Breed',
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              TextField(
                                controller: _dobController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  labelText: 'Date of Birth',
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.calendar_month_outlined,
                                      color: Colors.black26,
                                    ),
                                    onPressed: _pickDate,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onTap: _pickDate,
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Health and Medical Information',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                    ).fontFamily,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: _weightController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelText: 'Weight',
                                  labelStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      _buildUnitButton("kg"),
                                      const SizedBox(width: 4),
                                      _buildUnitButton("lb"),
                                      const SizedBox(width: 4),
                                    ],
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Sex',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                    ).fontFamily,
                                  ),
                                ),
                              ),
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
                                        value: 'Male',
                                        groupValue: _sex,
                                        onChanged: (value) {
                                          setState(() {
                                            _sex = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Male',
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
                                        value: 'Female',
                                        groupValue: _sex,
                                        onChanged: (value) {
                                          setState(() {
                                            _sex = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Female',
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
                                        value: 'Neutered/Spayed',
                                        groupValue: _sex,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _sex = value;
                                            },
                                          );
                                        },
                                      ),
                                      Text(
                                        'Neutered/Spayed',
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
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Vaccination Status',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                    ).fontFamily,
                                  ),
                                ),
                              ),
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
                                        value: 'up-to-date',
                                        groupValue: _vaccine,
                                        onChanged: (value) {
                                          setState(() {
                                            _vaccine = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'up-to-date',
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
                                        value: 'Due',
                                        groupValue: _vaccine,
                                        onChanged: (value) {
                                          setState(() {
                                            _vaccine = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Due',
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
                                        value: 'Overdue',
                                        groupValue: _vaccine,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _vaccine = value;
                                            },
                                          );
                                        },
                                      ),
                                      Text(
                                        'Overdue',
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
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Known Allergies Conditions',
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Primary Veterinarian',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                    ).fontFamily,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Clinic Name',
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Contact Information',
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Optional Information',
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
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Microchip Number',
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: 'Insurance Provider',
                                  labelStyle: TextStyle(
                                    fontFamily: GoogleFonts.inter().fontFamily,
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
                                  'Activity Level',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                    ).fontFamily,
                                  ),
                                ),
                              ),
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
                                        value: 'Low',
                                        groupValue: _activity,
                                        onChanged: (value) {
                                          setState(() {
                                            _activity = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Low',
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
                                        value: 'Medium',
                                        groupValue: _activity,
                                        onChanged: (value) {
                                          setState(() {
                                            _activity = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Medium',
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
                                        value: 'High',
                                        groupValue: _activity,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _activity = value;
                                            },
                                          );
                                        },
                                      ),
                                      Text(
                                        'High',
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
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Dietary Preferences',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                    ).fontFamily,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Radio<String>(
                                        activeColor: orange,
                                        value: 'Grain-Free',
                                        groupValue: _dietary,
                                        onChanged: (value) {
                                          setState(() {
                                            _dietary = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Grain-Free',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 80,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize
                                        .min, // Keeps row as compact as possible
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Radio<String>(
                                        activeColor: orange,
                                        value: 'Raw',
                                        groupValue: _dietary,
                                        onChanged: (value) {
                                          setState(() {
                                            _dietary = value;
                                          });
                                        },
                                      ),
                                      Text(
                                        'Raw',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize
                                        .min, // Keeps row as compact as possible
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Radio<String>(
                                        activeColor: orange,
                                        value: 'Standard',
                                        groupValue: _dietary,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _dietary = value;
                                            },
                                          );
                                        },
                                      ),
                                      Text(
                                        'Standard',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize
                                        .min, // Keeps row as compact as possible
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Radio<String>(
                                        activeColor: orange,
                                        value: 'Other',
                                        groupValue: _dietary,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _dietary = value;
                                            },
                                          );
                                        },
                                      ),
                                      Text(
                                        'Other',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: GoogleFonts.montserrat()
                                              .fontFamily,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 40,
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
                                  onPressed: () {
                                    Get.offAll(() => const HomeBottomNavBar());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: orange,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Register',
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
    );
  }

  Widget _buildUnitButton(String unit) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: _selectedUnit == unit ? Colors.orange : Colors.white,
        foregroundColor: _selectedUnit == unit ? Colors.white : Colors.black54,
        side: BorderSide(
          color: _selectedUnit == unit ? Colors.orange : Colors.black26,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
      ),
      onPressed: () => _changeUnit(unit),
      child: Text(unit.toUpperCase()),
    );
  }
}
