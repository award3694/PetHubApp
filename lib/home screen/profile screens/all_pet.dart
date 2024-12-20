import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class AllPet extends StatelessWidget {
  // Mock data for pets (replace with actual data from a database or APIs)
  final List<Map<String, dynamic>> pets = [
    {
      "name": "Buddy",
      "species": "Dog",
      "breed": "Golden Retriever",
      "weight": "30 kg",
      "sex": "Male",
      "vaccinationStatus": "Up-to-date",
      "allergies": "None",
      "vetName": "Dr. Smith",
      "vetClinic": "City Vet Clinic",
      "vetContact": "123-456-7890",
      "microchip": "ABC123456",
      "activityLevel": "High",
      "diet": "Grain-Free",
      "img": "assets/images/dog_health 1.png",
    },
    {
      "name": "Dummy",
      "species": "Dog",
      "breed": "Siamese",
      "weight": "5 kg",
      "sex": "Female",
      "vaccinationStatus": "Due",
      "allergies": "Dust",
      "vetName": "Dr. Wilson",
      "vetClinic": "Animal Care Center",
      "vetContact": "987-654-3210",
      "microchip": "XYZ987654",
      "activityLevel": "Medium",
      "diet": "Standard",
      "img": "assets/images/dog_health 2.png",
    },
    {
      "name": "Tommy",
      "species": "Dog",
      "breed": "Golden Retriever",
      "weight": "30 kg",
      "sex": "Male",
      "vaccinationStatus": "Up-to-date",
      "allergies": "None",
      "vetName": "Dr. Smith",
      "vetClinic": "City Vet Clinic",
      "vetContact": "123-456-7890",
      "microchip": "ABC123456",
      "activityLevel": "High",
      "diet": "Grain-Free",
      "img": "assets/images/dog_health 3.png",
    },
    {
      "name": "Mittens",
      "species": "Dog",
      "breed": "Siamese",
      "weight": "5 kg",
      "sex": "Female",
      "vaccinationStatus": "Due",
      "allergies": "Dust",
      "vetName": "Dr. Wilson",
      "vetClinic": "Animal Care Center",
      "vetContact": "987-654-3210",
      "microchip": "XYZ987654",
      "activityLevel": "Medium",
      "diet": "Standard",
      "img": "assets/images/dog_health 1.png",
    },
  ];

  AllPet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                        "All Pets",
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
          // Grid View for Pet Cards
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio:
                      0.9, // Adjust the aspect ratio for the card size
                ),
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  final pet = pets[index];
                  return Card(
                    elevation: 2,
                    color: lighgreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => PetDetailScreen(pet: pet));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Pet Initial in Circle Avatar
                          Center(
                            child: Image.asset(
                              pet["img"],
                              height: 100,
                              width: 200,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            pet["name"],
                            style: GoogleFonts.montserrat(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: aquaGreen,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              "${pet["species"]} - ${pet["breed"]}",
                              style: GoogleFonts.montserrat(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PetDetailScreen extends StatelessWidget {
  final Map<String, dynamic> pet;

  const PetDetailScreen({required this.pet, super.key});

  @override
  Widget build(BuildContext context) {
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
                        "Pet Detail",
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: ListView(
                children: [
                  buildPetImg(pet["img"]),
                  buildDetailRow("Name", pet["name"]),
                  buildDetailRow("Species", pet["species"]),
                  buildDetailRow("Breed", pet["breed"]),
                  buildDetailRow("Weight", pet["weight"]),
                  buildDetailRow("Sex", pet["sex"]),
                  buildDetailRow(
                      "Vaccination Status", pet["vaccinationStatus"]),
                  buildDetailRow("Known Allergies", pet["allergies"]),
                  buildDetailRow("Veterinarian Name", pet["vetName"]),
                  buildDetailRow("Clinic Name", pet["vetClinic"]),
                  buildDetailRow("Vet Contact", pet["vetContact"]),
                  buildDetailRow("Microchip Number", pet["microchip"]),
                  buildDetailRow("Activity Level", pet["activityLevel"]),
                  buildDetailRow("Dietary Preferences", pet["diet"]),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPetImg(dynamic path) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Image.asset(
          path,
          height: 170,
          width: 170,
        ),
      ),
    );
  }

  Widget buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lighgreen,
        ),
        height: 45,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title: ",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: aquaGreen,
                  ),
                ),
                Expanded(
                  child: Text(
                    value,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
