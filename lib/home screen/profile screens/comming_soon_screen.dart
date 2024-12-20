import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Text(
          "Comming Soon",
          style: TextStyle(
            fontSize: 24,
            fontFamily: GoogleFonts.montserrat(
              fontWeight: FontWeight.w900,
            ).fontFamily,
          ),
        ),
      ),
    );
  }
}
