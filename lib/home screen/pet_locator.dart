import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class PetLocator extends StatelessWidget {
  const PetLocator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
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
                alignment: Alignment.center,
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
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Pet Locator",
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      top: 10,
                    ),
                    hintText: "Nearby Pets",
                    hintStyle: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                    border: InputBorder.none,
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/icons/filter.png",
                        height: 16,
                        width: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Image.asset(
              "assets/images/pet locator.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
