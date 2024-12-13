import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class Challenges extends StatelessWidget {
  const Challenges({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "Challenges",
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
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildActivityPointsSection(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
            child: Text(
              'History of Activity Points',
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView(
                children: const [
                  ChallengeCard(
                    title: '10 Walks This Month',
                    petId: 'Pet ID: 37878',
                    status: 'Completed',
                    imagePath: 'assets/images/dog_health 3.png',
                    badgeEarned: true,
                    date: '12/09/2024',
                  ),
                  ChallengeCard(
                    title: 'Learn a New Trick',
                    petId: 'Pet ID: 37878',
                    status: 'Pending',
                    imagePath: 'assets/images/dog_health 2.png',
                    badgeEarned: false,
                    date: '12/09/2024',
                  ),
                  ChallengeCard(
                    title: 'Monthly Grooming',
                    petId: 'Pet ID: 37878',
                    status: 'Completed',
                    imagePath: 'assets/images/challenges img 1.png',
                    badgeEarned: true,
                    date: '12/09/2024',
                  ),
                  ChallengeCard(
                    title: 'Puzzle Master',
                    petId: 'Pet ID: 37878',
                    status: 'Pending',
                    imagePath: 'assets/images/smoth skin wash.png',
                    badgeEarned: false,
                    date: '12/09/2024',
                  ),
                  ChallengeCard(
                    title: '10 Walks This Month',
                    petId: 'Pet ID: 37878',
                    status: 'Completed',
                    imagePath: 'assets/images/dog_health 1.png',
                    badgeEarned: true,
                    date: '12/09/2024',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityPointsSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Your Activity Points',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '1490',
            style: GoogleFonts.montserrat(
                fontSize: 35, fontWeight: FontWeight.w700, color: aquaGreen),
          ),
          const SizedBox(height: 8),
          Text(
            'Badge Earned',
            style: GoogleFonts.montserrat(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final String title;
  final String petId;
  final String status;
  final String imagePath;
  final bool badgeEarned;
  final String date;

  const ChallengeCard({
    super.key,
    required this.title,
    required this.petId,
    required this.status,
    required this.imagePath,
    required this.badgeEarned,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: lighgreen,
          border: Border.all(
            color: aquaGreen,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  height: 90,
                  width: 65,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      petId,
                      style: GoogleFonts.montserrat(
                          fontSize: 12, color: Colors.black54),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/star-medal 1.png",
                          height: 18,
                          width: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          badgeEarned ? 'Badge Earned' : 'No Badge Earned',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/calander.png",
                          height: 16,
                          width: 16,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          date,
                          style: GoogleFonts.montserrat(
                              fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _buildStatusBadge(
                status,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    final isCompleted = status == 'Completed';
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isCompleted ? aquaGreen : orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          status,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
    );
  }
}
