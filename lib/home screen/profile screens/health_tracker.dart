import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class HealthTrackerPage extends StatelessWidget {
  const HealthTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      // appBar: AppBar(
      //   backgroundColor: white,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   title: const Text(
      //     'Health Tracker',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   centerTitle: true,
      // ),
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
                  // offset: Offset(5, 5),
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
                      padding: const EdgeInsets.only(bottom: 20.0, right: 35),
                      child: Text(
                        "Health Tracker",
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
            height: 5,
          ),
          _buildHeaderBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16,
            ),
            child: Text(
              'Health-Related Tasks',
              style: TextStyle(
                fontSize: 20,
                fontFamily: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                ).fontFamily,
              ),
            ),
          ),
          Expanded(child: _buildTaskList()),
        ],
      ),
    );
  }

  Widget _buildHeaderBackground() {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: lighgreen,
      ),
      child: Image.asset(
        "assets/images/bg_Layer_1.png",
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildTaskList() {
    return ListView(
      children: [
        _buildTaskCard(
          imagePath: 'assets/images/dog_health 1.png',
          taskTitle: 'Vaccination',
          petId: '37878',
          date: '12/09/2024',
          status: 'Completed',
          statusColor: aquaGreen,
        ),
        _buildTaskCard(
          imagePath: 'assets/images/dog_health 2.png',
          taskTitle: 'Medication',
          petId: '37878',
          date: '12/09/2024',
          status: 'Pending',
          statusColor: orange,
        ),
        _buildTaskCard(
          imagePath: 'assets/images/dog_health 3.png',
          taskTitle: 'Vaccination',
          petId: '37878',
          date: '12/09/2024',
          status: 'Pending',
          statusColor: orange,
        ),
      ],
    );
  }

  Widget _buildTaskCard({
    required String imagePath,
    required String taskTitle,
    required String petId,
    required String date,
    required String status,
    required Color statusColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: lighgreen,
          border: Border.all(
            color: statusColor,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  width: 160,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                        ).fontFamily,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pet ID: $petId',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                        fontFamily: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                        ).fontFamily,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/calander.png",
                          height: 15,
                          width: 15,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black45,
                            fontFamily: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                            ).fontFamily,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          statusColor,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        status,
                        style: TextStyle(
                          color: white,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
