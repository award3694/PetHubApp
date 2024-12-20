// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';

// // import '../utils/colors.dart';

// // class ReminderScreen extends StatelessWidget {
// //   final List<Reminder> reminders = [
// //     Reminder(
// //         title: "Flea Medication",
// //         date: "12/09/2024",
// //         image: "assets/images/dog_health 1.png"),
// //     Reminder(
// //         title: "Vet Check-up",
// //         date: "1/08/2025",
// //         image: "assets/images/dog_health 3.png"),
// //     Reminder(
// //         title: "Heartworm",
// //         date: "10/13/2025",
// //         image: "assets/images/dog_health 2.png"),
// //     Reminder(
// //         title: "Rabbies shot",
// //         date: "12/09/2025",
// //         image: "assets/images/dog_health 1.png"),
// //     Reminder(
// //         title: "Feeding Schedule",
// //         date: "12/10/2024",
// //         image: "assets/images/dog_health 2.png"),
// //   ];

// //   ReminderScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         elevation: 0,
// //         scrolledUnderElevation: 0,
// //         backgroundColor: white,
// //         title: const Text("Reminder"),
// //         centerTitle: true,
// //         leading: Padding(
// //           padding: const EdgeInsets.only(left: 8.0),
// //           child: Container(
// //             decoration: BoxDecoration(
// //               border: Border.all(
// //                 color: aquaGreen,
// //               ),
// //               color: aquaGreen,
// //               shape: BoxShape.circle,
// //             ),
// //             child: const CircleAvatar(
// //               foregroundColor: Colors.black,
// //               radius: 40,
// //               backgroundColor: aquaGreen,
// //               backgroundImage: AssetImage(
// //                 "assets/icons/tom.png",
// //               ),
// //             ),
// //           ),
// //         ),
// //         actions: const [
// //           Padding(
// //             padding: EdgeInsets.symmetric(horizontal: 12.0),
// //             child: Badge(
// //               padding: EdgeInsets.all(0),
// //               smallSize: 8,
// //               backgroundColor: Colors.red,
// //               child: Icon(
// //                 Icons.notifications,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //       backgroundColor: Colors.white,
// //       body: ListView.builder(
// //         itemCount: reminders.length,
// //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //         itemBuilder: (context, index) {
// //           final reminder = reminders[index];
// //           return ReminderCard(reminder: reminder);
// //         },
// //       ),
// //     );
// //   }
// // }

// // class Reminder {
// //   final String title;
// //   final String date;
// //   final String image;

// //   Reminder({required this.title, required this.date, required this.image});
// // }

// // class ReminderCard extends StatelessWidget {
// //   final Reminder reminder;

// //   const ReminderCard({super.key, required this.reminder});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       decoration: BoxDecoration(
// //           color: lighgreen,
// //           border: Border.all(color: aquaGreen),
// //           borderRadius: BorderRadius.circular(18)),
// //       margin: const EdgeInsets.only(bottom: 16),
// //       child: ListTile(
// //         contentPadding: const EdgeInsets.all(12),
// //         leading: ClipRRect(
// //           borderRadius: BorderRadius.circular(10),
// //           child: Image.asset(
// //             reminder.image,
// //           ),
// //         ),
// //         title: Text(
// //           reminder.title,
// //           style: TextStyle(
// //             fontSize: 16,
// //             fontFamily: GoogleFonts.montserrat(
// //               fontWeight: FontWeight.w600,
// //             ).fontFamily,
// //           ),
// //         ),
// //         subtitle: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const SizedBox(height: 4),
// //             Text(
// //               'Pet ID: 37878',
// //               style: TextStyle(
// //                 fontFamily: GoogleFonts.montserrat().fontFamily,
// //                 color: Colors.black54,
// //               ),
// //             ),
// //             const SizedBox(height: 4),
// //             Row(
// //               children: [
// //                 Image.asset(
// //                   "assets/icons/calander.png",
// //                   height: 16,
// //                   width: 16,
// //                 ),
// //                 const SizedBox(width: 5),
// //                 Text(
// //                   reminder.date,
// //                   style: TextStyle(
// //                     fontFamily: GoogleFonts.montserrat().fontFamily,
// //                     color: Colors.black54,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //         trailing: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             Text(
// //               'Reminder',
// //               style: TextStyle(
// //                 color: Colors.black54,
// //                 fontFamily: GoogleFonts.montserrat().fontFamily,
// //               ),
// //             ),
// //             const SizedBox(
// //               width: 5,
// //             ),
// //             Image.asset(
// //               "assets/icons/notification 1.png",
// //               height: 18,
// //               width: 18,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../utils/colors.dart';

// class ReminderScreen extends StatefulWidget {
//   const ReminderScreen({super.key});

//   @override
//   State<ReminderScreen> createState() => _ReminderScreenState();
// }

// class _ReminderScreenState extends State<ReminderScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   // List of reminders
//   final List<Reminder> _pendingReminders = [
//     Reminder(
//         title: "Flea Medication",
//         date: "12/09/2024",
//         image: "assets/images/dog_health 1.png"),
//     Reminder(
//         title: "Vet Check-up",
//         date: "1/08/2025",
//         image: "assets/images/dog_health 3.png"),
//   ];

//   final List<Reminder> _completedReminders = [
//     Reminder(
//         title: "Heartworm",
//         date: "10/13/2025",
//         image: "assets/images/dog_health 2.png"),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   void _addNewReminder() {
//     // Example function to create a new reminder
//     setState(() {
//       _pendingReminders.add(
//         Reminder(
//           title: "New Reminder",
//           date: "12/20/2024",
//           image: "assets/images/dog_health 1.png",
//         ),
//       );
//     });
//   }

//   void _markAsCompleted(Reminder reminder) {
//     setState(() {
//       _pendingReminders.remove(reminder);
//       _completedReminders.add(reminder);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         backgroundColor: white,
//         title: Text(
//           "Reminders",
//           style: TextStyle(
//             fontFamily: GoogleFonts.montserrat(
//               fontWeight: FontWeight.w600,
//             ).fontFamily,
//           ),
//         ),
//         centerTitle: true,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Container(
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: aquaGreen,
//               ),
//               color: aquaGreen,
//               shape: BoxShape.circle,
//             ),
//             child: const CircleAvatar(
//               foregroundColor: Colors.black,
//               radius: 40,
//               backgroundColor: aquaGreen,
//               backgroundImage: AssetImage(
//                 "assets/icons/tom.png",
//               ),
//             ),
//           ),
//         ),
//         bottom: TabBar(
//           controller: _tabController,
//           labelColor: Colors.black,
//           indicatorColor: orange,
//           labelStyle: TextStyle(
//             // color: Colors.black54,
//             fontFamily: GoogleFonts.montserrat().fontFamily,
//           ),
//           tabs: const [
//             Tab(text: "Pending"),
//             Tab(text: "Completed"),
//           ],
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           // Pending Reminders Tab
//           ListView.builder(
//             itemCount: _pendingReminders.length,
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             itemBuilder: (context, index) {
//               final reminder = _pendingReminders[index];
//               return ReminderCard(
//                 reminder: reminder,
//                 onComplete: () => _markAsCompleted(reminder),
//               );
//             },
//           ),

//           // Completed Reminders Tab
//           ListView.builder(
//             itemCount: _completedReminders.length,
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             itemBuilder: (context, index) {
//               final reminder = _completedReminders[index];
//               return ReminderCard(reminder: reminder);
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: _tabController.index == 0
//           ? ElevatedButton(
//               style: const ButtonStyle(
//                 padding: WidgetStatePropertyAll(
//                   EdgeInsets.symmetric(horizontal: 3),
//                 ),
//                 backgroundColor: WidgetStatePropertyAll(white),
//                 elevation: WidgetStatePropertyAll(0),
//                 side: WidgetStatePropertyAll(
//                   BorderSide(
//                     color: orange,
//                   ),
//                 ),
//               ),
//               onPressed: () {
//                 _addNewReminder();
//               },
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 30,
//                     width: 30,
//                     decoration: const BoxDecoration(
//                       color: orange,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(
//                       Icons.add,
//                       color: white,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     "Add Reminder",
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.black54,
//                       fontFamily: GoogleFonts.montserrat().fontFamily,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                 ],
//               ),
//             )
//           : null,
//     );
//   }
// }

// class Reminder {
//   final String title;
//   final String date;
//   final String image;

//   Reminder({required this.title, required this.date, required this.image});
// }

// class ReminderCard extends StatelessWidget {
//   final Reminder reminder;
//   final VoidCallback? onComplete;

//   const ReminderCard({super.key, required this.reminder, this.onComplete});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: lighgreen,
//         border: Border.all(color: aquaGreen),
//         borderRadius: BorderRadius.circular(18),
//       ),
//       margin: const EdgeInsets.only(bottom: 16),
//       child: ListTile(
//         contentPadding: const EdgeInsets.all(12),
//         leading: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Image.asset(
//             reminder.image,
//           ),
//         ),
//         title: Text(
//           reminder.title,
//           style: TextStyle(
//             fontSize: 16,
//             fontFamily: GoogleFonts.montserrat(
//               fontWeight: FontWeight.w600,
//             ).fontFamily,
//           ),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 4),
//             Text(
//               'Pet ID: 37878',
//               style: TextStyle(
//                 fontFamily: GoogleFonts.montserrat().fontFamily,
//                 color: Colors.black54,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Row(
//               children: [
//                 Image.asset(
//                   "assets/icons/calander.png",
//                   height: 16,
//                   width: 16,
//                 ),
//                 const SizedBox(width: 5),
//                 Text(
//                   reminder.date,
//                   style: TextStyle(
//                     fontFamily: GoogleFonts.montserrat().fontFamily,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         trailing: onComplete != null
//             ? ElevatedButton(
//                 onPressed: onComplete,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: aquaGreen,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text(
//                   "Completed",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               )
//             : Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     'Completed',
//                     style: TextStyle(
//                       color: Colors.black54,
//                       fontFamily: GoogleFonts.montserrat().fontFamily,
//                     ),
//                   ),
//                   const SizedBox(width: 5),
//                   Image.asset(
//                     "assets/icons/notification 1.png",
//                     height: 18,
//                     width: 18,
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // List of reminders
  final List<Reminder> _pendingReminders = [
    Reminder(
        title: "Flea Medication",
        date: "12/09/2024",
        image: "assets/images/dog_health 1.png"),
    Reminder(
        title: "Vet Check-up",
        date: "1/08/2025",
        image: "assets/images/dog_health 3.png"),
  ];

  final List<Reminder> _completedReminders = [
    Reminder(
        title: "Heartworm",
        date: "10/13/2025",
        image: "assets/images/dog_health 2.png"),
  ];

  bool _showFab = true; // Controls FloatingActionButton visibility

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      // Show or hide FAB based on the selected tab index
      setState(() {
        _showFab = _tabController.index == 0;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addNewReminder() {
    // Example function to create a new reminder
    setState(() {
      _pendingReminders.add(
        Reminder(
          title: "New Reminder",
          date: "12/20/2024",
          image: "assets/images/dog_health 1.png",
        ),
      );
    });
  }

  void _markAsCompleted(Reminder reminder) {
    setState(() {
      _pendingReminders.remove(reminder);
      _completedReminders.add(reminder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: white,
        title: Text(
          "Reminders",
          style: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
          ),
        ),
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
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: orange,
          labelStyle: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
          ),
          tabs: const [
            Tab(text: "Pending"),
            Tab(text: "Completed"),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _tabController,
        children: [
          // Pending Reminders Tab
          ListView.builder(
            itemCount: _pendingReminders.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemBuilder: (context, index) {
              final reminder = _pendingReminders[index];
              return ReminderCard(
                reminder: reminder,
                onComplete: () => _markAsCompleted(reminder),
              );
            },
          ),

          // Completed Reminders Tab
          ListView.builder(
            itemCount: _completedReminders.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemBuilder: (context, index) {
              final reminder = _completedReminders[index];
              return ReminderCard(reminder: reminder);
            },
          ),
        ],
      ),
      floatingActionButton: _showFab
          ? ElevatedButton(
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 3),
                ),
                backgroundColor: WidgetStatePropertyAll(white),
                elevation: WidgetStatePropertyAll(0),
                side: WidgetStatePropertyAll(
                  BorderSide(
                    color: orange,
                  ),
                ),
              ),
              onPressed: _addNewReminder,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: orange,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Add Reminder",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            )
          : null,
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
  final VoidCallback? onComplete;

  const ReminderCard({super.key, required this.reminder, this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lighgreen,
        border: Border.all(color: aquaGreen),
        borderRadius: BorderRadius.circular(18),
      ),
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
        trailing: onComplete != null
            ? ElevatedButton(
                onPressed: onComplete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: aquaGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Completed",
                  style: TextStyle(color: Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Completed',
                    style: TextStyle(
                      color: Colors.black54,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                  const SizedBox(width: 5),
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
