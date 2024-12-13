import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class ReminderScreen extends StatelessWidget {
  final List<Reminder> reminders = [
    Reminder(
        title: "Flea Medication",
        date: "12/09/2024",
        image: "assets/images/dog_health 1.png"),
    Reminder(
        title: "Vet Check-up",
        date: "1/08/2025",
        image: "assets/images/dog_health 3.png"),
    Reminder(
        title: "Heartworm",
        date: "10/13/2025",
        image: "assets/images/dog_health 2.png"),
    Reminder(
        title: "Rabbies shot",
        date: "12/09/2025",
        image: "assets/images/dog_health 1.png"),
    Reminder(
        title: "Feeding Schedule",
        date: "12/10/2024",
        image: "assets/images/dog_health 2.png"),
  ];

  ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: white,
        title: const Text("Reminder"),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: aquaGreen,
              ),
              color: aquaGreen,
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              foregroundColor: Colors.black,
              radius: 40,
              backgroundColor: aquaGreen,
              backgroundImage: AssetImage(
                "assets/icons/tom.png",
              ),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Badge(
              padding: EdgeInsets.all(0),
              smallSize: 8,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.notifications,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: reminders.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemBuilder: (context, index) {
          final reminder = reminders[index];
          return ReminderCard(reminder: reminder);
        },
      ),
    );
  }
}

class Reminder {
  final String title;
  final String date;
  final String image;

  Reminder({required this.title, required this.date, required this.image});
}

class ReminderCard extends StatelessWidget {
  final Reminder reminder;

  const ReminderCard({super.key, required this.reminder});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: lighgreen,
          border: Border.all(color: aquaGreen),
          borderRadius: BorderRadius.circular(18)),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            reminder.image,
          ),
        ),
        title: Text(
          reminder.title,
          style: TextStyle(
            fontSize: 16,
            fontFamily: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
            ).fontFamily,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              'Pet ID: 37878',
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Image.asset(
                  "assets/icons/calander.png",
                  height: 16,
                  width: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  reminder.date,
                  style: TextStyle(
                    fontFamily: GoogleFonts.montserrat().fontFamily,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Reminder',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              "assets/icons/notification 1.png",
              height: 18,
              width: 18,
            ),
          ],
        ),
      ),
    );
  }
}
