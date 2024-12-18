// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pet_hub/utils/colors.dart';

// class EmergrncyPrep extends StatelessWidget {
//   const EmergrncyPrep({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final petData = [
//       {
//         'image':
//             'assets/images/emergency_prep.png', // Replace with actual image URLs
//         'title': 'Lost Dog',
//         'petId': '37878',
//         'lastSeen': 'Example Any Place',
//         'phone': '62877388',
//       },
//       {
//         'image':
//             'assets/images/emergency_prep.png', // Replace with actual image URLs
//         'title': 'Lost Dog',
//         'petId': '37878',
//         'lastSeen': 'Example Any Place',
//         'phone': '62877388',
//       },
//       {
//         'image':
//             'assets/images/emergency_prep.png', // Replace with actual image URLs
//         'title': 'Lost Dog',
//         'petId': '37878',
//         'lastSeen': 'Example Any Place',
//         'phone': '62877388',
//       },
//       {
//         'image':
//             'assets/images/emergency_prep.png', // Replace with actual image URLs
//         'title': 'Lost Dog',
//         'petId': '37878',
//         'lastSeen': 'Example Any Place',
//         'phone': '62877388',
//       },
//     ];

//     return Scaffold(
//       backgroundColor: white,
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.shade300,
//                   blurRadius: 5.0,
//                   spreadRadius: 1.0,
//                 ),
//               ],
//             ),
//             width: MediaQuery.of(context).size.width,
//             height: 110,
//             child: Align(
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: SizedBox(
//                       height: 70,
//                       child: IconButton(
//                         onPressed: () {
//                           Get.back();
//                         },
//                         icon: const Icon(
//                           Icons.arrow_back,
//                           size: 26,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   Align(
//                     alignment: Alignment.bottomCenter,
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 20.0),
//                       child: Text(
//                         "Emergrency Resources",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontFamily: GoogleFonts.montserrat(
//                             fontWeight: FontWeight.w600,
//                           ).fontFamily,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(10),
//               itemCount: petData.length,
//               itemBuilder: (context, index) {
//                 final pet = petData[index];
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: lighgreen,
//                     border: Border.all(
//                       color: aquaGreen,
//                     ),
//                     borderRadius: BorderRadius.circular(
//                       18,
//                     ),
//                   ),
//                   margin: const EdgeInsets.symmetric(vertical: 10),
//                   child: Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(8.0),
//                           child: Image.asset(
//                             pet['image']!,
//                             height: 90,
//                             width: 80,
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     pet['title']!,
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18,
//                                       fontFamily:
//                                           GoogleFonts.montserrat().fontFamily,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     onPressed: () {},
//                                     icon: const Icon(
//                                       Icons.info_outline_rounded,
//                                       size: 18,
//                                       color: orange,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 'Pet ID: ${pet['petId']},',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontFamily:
//                                       GoogleFonts.montserrat().fontFamily,
//                                 ),
//                               ),
//                               const SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.location_pin,
//                                       color: aquaGreen, size: 16),
//                                   const SizedBox(width: 4),
//                                   Text(
//                                     'Last Seen:\nExample Any Place',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12,
//                                       fontFamily:
//                                           GoogleFonts.montserrat().fontFamily,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             Row(
//                               children: [
//                                 const Icon(Icons.phone_in_talk,
//                                     color: aquaGreen, size: 18),
//                                 const SizedBox(width: 5),
//                                 Text(
//                                   pet['phone']!,
//                                   style: TextStyle(
//                                     fontFamily:
//                                         GoogleFonts.montserrat().fontFamily,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 Checkbox(
//                                   fillColor:
//                                       const WidgetStatePropertyAll(white),
//                                   side: const BorderSide(
//                                       color: aquaGreen, width: 1),
//                                   value: false,
//                                   onChanged: (value) {},
//                                 ),
//                                 const SizedBox(
//                                   height: 40,
//                                 ),
//                                 Text(
//                                   textAlign: TextAlign.justify,
//                                   'Medical\nAttention\nRequired',
//                                   style: TextStyle(
//                                     fontSize: 10,
//                                     fontFamily:
//                                         GoogleFonts.montserrat().fontFamily,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_hub/utils/colors.dart';

class EmergrncyPrep extends StatelessWidget {
  const EmergrncyPrep({super.key});

  @override
  Widget build(BuildContext context) {
    final petData = [
      {
        'image':
            'assets/images/emergency_prep.png', // Replace with actual image URLs
        'title': 'Lost Dog',
        'petId': '37878',
        'lastSeen': 'Example Any Place',
        'phone': '62877388',
      },
      {
        'image':
            'assets/images/emergency_prep.png', // Replace with actual image URLs
        'title': 'Lost Dog',
        'petId': '37878',
        'lastSeen': 'Example Any Place',
        'phone': '62877388',
      },
      {
        'image':
            'assets/images/emergency_prep.png', // Replace with actual image URLs
        'title': 'Lost Dog',
        'petId': '37878',
        'lastSeen': 'Example Any Place',
        'phone': '62877388',
      },
      {
        'image':
            'assets/images/emergency_prep.png', // Replace with actual image URLs
        'title': 'Lost Dog',
        'petId': '37878',
        'lastSeen': 'Example Any Place',
        'phone': '62877388',
      },
    ];

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
                        "Emergrency Resources",
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
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: petData.length,
              itemBuilder: (context, index) {
                final pet = petData[index];
                return Container(
                  decoration: BoxDecoration(
                    color: lighgreen,
                    border: Border.all(
                      color: aquaGreen,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            pet['image']!,
                            height: 90,
                            width: 80,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    pet['title']!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _showInfoDialog(context);
                                    },
                                    icon: const Icon(
                                      Icons.info_outline_rounded,
                                      size: 18,
                                      color: orange,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Pet ID: ${pet['petId']},',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(Icons.location_pin,
                                      color: aquaGreen, size: 16),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Last Seen:\nExample Any Place',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      fontFamily:
                                          GoogleFonts.montserrat().fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.phone_in_talk,
                                    color: aquaGreen, size: 18),
                                const SizedBox(width: 5),
                                Text(
                                  pet['phone']!,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  fillColor:
                                      const WidgetStatePropertyAll(white),
                                  side: const BorderSide(
                                      color: aquaGreen, width: 1),
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  textAlign: TextAlign.justify,
                                  'Medical\nAttention\nRequired',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            "Information",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w800)
                  .fontFamily,
            ),
          ),
          content: Text(
            "Check this box if the pet is injured and requires first aid assistance.",
            style: TextStyle(
              fontSize: 14,
              fontFamily: GoogleFonts.montserrat(fontWeight: FontWeight.w600)
                  .fontFamily,
            ),
          ),
          actions: [
            TextButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(orange)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Close",
                style: TextStyle(
                    color: white,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
            ),
          ],
        );
      },
    );
  }
}
